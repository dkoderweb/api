<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Validator;
use Illuminate\Http\JsonResponse;
use App\Http\Resources\AttendanceResource;
use Illuminate\Database\Eloquent\ModelNotFoundException;


class AttendanceController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $attendance = Attendance::with('employee')->get();
        return $this->sendResponse(AttendanceResource::collection($attendance), 'Attendance retrieved successfully.');
    } 

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        $input = $request->all();
        
        $validator = Validator::make($input, [
            // 'in_time' => ['required', 'regex:/^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/'],
            // 'out_time' => ['required', 'regex:/^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/'], 
            'employee_id' => 'required|exists:employees,id',
        ]);
       
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

       $attendance  = new Attendance;
       $attendance->in_time = $request->in_time;
       $attendance->out_time = $request->out_time; 
       $attendance->employee_id = $request->employee_id;
       $attendance->save();
    
       $attendance->load('employee');

        return $this->sendResponse(new AttendanceResource($attendance), 'Attendance created successfully.');
    } 

    /**
     * Display the specified resource.
     */
    public function show($id): JsonResponse
    {
        try {
            $attendance = Attendance::with('employee')->find($id);
        
            if (is_null($attendance)) {
                return $this->sendError('Attendance not found.');
            }
        
            return $this->sendResponse(new AttendanceResource($attendance), 'Attendance retrieved successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Attendance not found.', [], 404);
        }
    } 

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Attendance $attendance): JsonResponse
    {
        try {
            $input = $request->all();
        
            $validator = Validator::make($input, [
                // 'in_time' => ['required', 'regex:/^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/'],
                // 'out_time' => ['required', 'regex:/^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/'], 
                'employee_id' => 'required|exists:employees,id',
            ]);
        
            if($validator->fails()){
                return $this->sendError('Validation Error.', $validator->errors());       
            }
            
            $attendance->in_time = $request->in_time;
            $attendance->out_time = $request->out_time; 
            $attendance->employee_id = $request->employee_id;
            $attendance->save();

            return $this->sendResponse(new AttendanceResource($attendance), 'Attendance updated successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Attendance not found.', [], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Attendance $attendance): JsonResponse
    {
        try {
            $attendance->delete();
        
            return $this->sendResponse([], 'Attendance deleted successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Attendance not found.', [], 404);
        }
    }

}
