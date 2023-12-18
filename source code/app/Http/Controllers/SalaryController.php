<?php

namespace App\Http\Controllers;

use App\Models\Salary;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Validator;
use Illuminate\Http\JsonResponse;
use App\Http\Resources\SalaryResource;
use Illuminate\Database\Eloquent\ModelNotFoundException;


class SalaryController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $salary = Salary::with('employee')->get();
        return $this->sendResponse(SalaryResource::collection($salary), 'Employee retrieved successfully.');
    } 

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        $input = $request->all();
        
        $validator = Validator::make($input, [
            'basic_salary' => 'required|integer',  
            'hra' => 'required|integer',  
            'da' => 'required|integer',  
            'other_allowances' => 'required|integer',  
            'gross_salary' => 'required|integer',  
            'employee_id' => 'required|exists:employees,id',
        ]);
       
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

       $salary  = new Salary;
       $salary->basic_salary = $request->basic_salary;
       $salary->hra = $request->hra;
       $salary->da = $request->da;
       $salary->other_allowances = $request->other_allowances;
       $salary->gross_salary = $request->gross_salary;
       $salary->employee_id = $request->employee_id;
       $salary->save();
    
       $salary->load('employee');

        return $this->sendResponse(new SalaryResource($salary), 'Salary created successfully.');
    } 

    /**
     * Display the specified resource.
     */
    public function show($id): JsonResponse
    {
        try {
            $salary = Salary::with('employee')->find($id);
        
            if (is_null($salary)) {
                return $this->sendError('Salary not found.');
            }
        
            return $this->sendResponse(new SalaryResource($salary), 'Salary retrieved successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Salary not found.', [], 404);
        }
    } 

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Salary $salary): JsonResponse
    {
        try {
            $input = $request->all();
        
            $validator = Validator::make($input, [
                'basic_salary' => 'required|integer',  
                'hra' => 'required|integer',  
                'da' => 'required|integer',  
                'other_allowances' => 'required|integer',  
                'gross_salary' => 'required|integer',  
                'employee_id' => 'required|exists:employees,id',
            ]);
        
            if($validator->fails()){
                return $this->sendError('Validation Error.', $validator->errors());       
            }
            
            $salary->basic_salary = $request->basic_salary;
            $salary->hra = $request->hra;
            $salary->da = $request->da;
            $salary->other_allowances = $request->other_allowances;
            $salary->gross_salary = $request->gross_salary;
            $salary->employee_id = $request->employee_id;
            $salary->save();

            return $this->sendResponse(new SalaryResource($salary), 'Salary updated successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Salary not found.', [], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Salary $salary): JsonResponse
    {
        try {
            $salary->delete();
        
            return $this->sendResponse([], 'Salary deleted successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Salary not found.', [], 404);
        }
    }

}
