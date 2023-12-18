<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\SalaryCalculation;
use App\Models\Salary;
use DateTime;  
use App\Models\Employee;
class HomeController extends Controller
{
    public function index(){
          $salarys = SalaryCalculation::with('employee','salary','attendance')->get();  

        return view('salary',compact('salarys'));
         
    } 
    public function calculate($id){
        $data = SalaryCalculation::with('employee','salary','attendance')->find($id);  
        $salary = $this->calculateSalary($data); 
        $data->month_salary = $salary;
        $data->calculation_date = now()->format('Y-m-d');
        $data->status = 'complated';
        $data->update(); 
        return redirect()->back();
    }
    private function calculateSalary($data){
        $daySalary = $data->salary->gross_salary / 30 ;
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
