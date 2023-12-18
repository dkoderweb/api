<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Carbon\Carbon;
use App\Models\SalaryCalculation;
use App\Models\Salary;
use DateTime;  
use App\Models\Employee;

class CalculateSalary extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'salary:calculate';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Calculate salary on the first day of every month';

    /**
     * Execute the console command.
     */
    public function handle()
    { 
        try {
            

            $currentMonth = Carbon::now()->firstOfMonth()->format('Y-m'); 

            $currentMonth =  '2023-11';  //for testing 
            $calculation_date = now()->format('Y-m-d'); 

        try {
            $salary = SalaryCalculation::select('employee_id')->where('calculated_month', $currentMonth)->get(); 
            if($salary){

                $Employee = Employee::whereNotIn('employee_id', $salary)->get();
                // //add current month status 
                if($Employee){
                    
                    foreach($Employee as $data ){
                        $calculation = new SalaryCalculation;
                        $calculation->employee_id = $data->id;
                        $calculation->calculation_date = $calculation_date;
                        $calculation->calculated_month = $currentMonth;
                        $calculation->status = 'pending';
                        $calculation->save(); 
                    } 
                }
            }
        } catch (\Exception $exception) {
            info('Error during salary calculation: ' . $exception->getMessage());
        }

            $previousMonth = Carbon::now()->subMonth()->firstOfMonth()->format('Y-m');


    
            $employee_salary = Salary::has('attendance')
                    ->with(['attendance' => function ($query) use ($previousMonth) {
                        $query->select('employee_id', 'in_time', 'out_time')
                            ->whereYear('updated_at', '=', substr($previousMonth, 0, 4))
                            ->whereMonth('updated_at', '=', substr($previousMonth, 5, 2));
                    }])
                    ->join('salary_calculations', 'salary_calculations.employee_id', '=', 'salaries.employee_id')
                    ->select(
                        'salaries.employee_id',
                        'salaries.gross_salary',
                        'salary_calculations.calculated_month',
                        'salary_calculations.status',
                        'salary_calculations.id as pending_id', 
                    )
                    ->where('status','pending')
                    ->where('salary_calculations.calculated_month', $previousMonth)
                    ->get();
                    $previousMonth = Carbon::now()->subMonth()->firstOfMonth()->format('Y-m');
        
        
            //calculate previouse month salary
            foreach($employee_salary as $data ){
                $calculation = SalaryCalculation::find($data->pending_id);
                $salary = $this->calculateSalary($data);
                $calculation->employee_id = $data->employee_id;
                $calculation->month_salary = $salary;
                $calculation->calculation_date = $calculation_date;
                $calculation->calculated_month = $previousMonth;
                $calculation->status = 'complated';
                $calculation->update(); 
            }  
            info('Salary calculated for moth '.$previousMonth);
        } catch (\Exception $exception) {
            info('Error during salary calculation: ' . $exception->getMessage());
        }
    }
   private function calculateSalary($data){
        $daySalary = $data->gross_salary / 30 ;
        $hourRate = $daySalary / 9;
        $hourRate = number_format($hourRate, 2); 

        foreach ($data->attendance as $attendance) {
            $dateTimeIn = new DateTime($attendance ? $attendance->in_time : '00:00');
            $dateTimeOut = new DateTime($attendance ? $attendance->out_time : '00:00');
        
            $interval = $dateTimeIn->diff($dateTimeOut);
        
            $hours = $interval->h;  
            $minutes = $interval->i; 
        
            $totalHours = $hours + ($minutes / 60);
            $hoursWorked[] = $totalHours;
        }
        
        $totalHoursWorked = array_sum($hoursWorked);
        
        $salary = $hourRate * $totalHoursWorked;
        
        return $salary;
        
    }
}
