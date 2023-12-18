<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Validator;
use Illuminate\Http\JsonResponse;
use App\Http\Resources\EmployeeResource;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class EmployeeController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $employee = Employee::with('position.department')->get();
        return $this->sendResponse(EmployeeResource::collection($employee), 'Employee retrieved successfully.');
    } 

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        $input = $request->all();
        
        $validator = Validator::make($input, [
            'name' => 'required', 
            'email' => 'required', 
            'phone_number' => 'required', 
            'address' => 'required', 
            'position_id' => 'required|exists:positions,id',
        ]);
       
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

       $employee  = new Employee;
       $employee->name = $request->name;
       $employee->email = $request->email;
       $employee->phone_number = $request->phone_number;
       $employee->address = $request->address;
       $employee->position_id = $request->position_id;
       $employee->save();
    
       $employee->load('position');

        return $this->sendResponse(new EmployeeResource($employee), 'Employee created successfully.');
    } 

    /**
     * Display the specified resource.
     */
    public function show($id): JsonResponse
    {
        try {
            $employee = Employee::with('position.department')->find($id);
        
            if (is_null($employee)) {
                return $this->sendError('Employee not found.');
            }
        
            return $this->sendResponse(new EmployeeResource($employee), 'Employee retrieved successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Department not found.', [], 404);
        }
    } 

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Employee $employee): JsonResponse
    {

        try {
            $input = $request->all();
        
            $validator = Validator::make($input, [
                'name' => 'required', 
                'email' => 'required', 
                'phone_number' => 'required', 
                'address' => 'required', 
                'position_id' => 'required|exists:positions,id',
            ]);
        
            if($validator->fails()){
                return $this->sendError('Validation Error.', $validator->errors());       
            }
            
            $employee->name = $request->name;
            $employee->email = $request->email;
            $employee->phone_number = $request->phone_number;
            $employee->address = $request->address;
            $employee->position_id = $request->position_id;
            $employee->save(); 

            return $this->sendResponse(new EmployeeResource($employee), 'Employee updated successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Department not found.', [], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Employee $employee): JsonResponse
    {
        try {
            $employee->delete();
        
            return $this->sendResponse([], 'Employee deleted successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Department not found.', [], 404);
        }
    }

}
