<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SalaryCalculation extends Model
{
    use HasFactory;

    public function employee(){
        return $this->belongsTo(Employee::class);
    }

    public function salary()
    {
        return $this->belongsTo(Salary::class, 'employee_id', 'employee_id');
    }
    public function attendance()
    {
        return $this->hasMany(Attendance::class, 'employee_id', 'employee_id');
    }
}
