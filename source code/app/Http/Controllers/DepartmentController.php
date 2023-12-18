<?php

namespace App\Http\Controllers;

use App\Models\Department;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Validator;
use Illuminate\Http\JsonResponse;
use App\Http\Resources\DepartmentResource;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class DepartmentController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $department = Department::all();
        
        return $this->sendResponse(DepartmentResource::collection($department), 'Department retrieved successfully.');
    } 

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        $input = $request->all();
       
        $validator = Validator::make($input, [
            'name' => 'required', 
        ]);
       
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
       
        $department = Department::create($input);
       
        return $this->sendResponse(new DepartmentResource($department), 'Department created successfully.');
    } 

    /**
     * Display the specified resource.
     */
    public function show($id): JsonResponse
    {
        try {
            $department = Department::find($id);
        
            if (is_null($department)) {
                return $this->sendError('department not found.');
            }
        
            return $this->sendResponse(new DepartmentResource($department), 'Department retrieved successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Department not found.', [], 404);
        }
    } 

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Department $department): JsonResponse
    {
        try {
            $input = $request->all();
        
            $validator = Validator::make($input, [
                'name' => 'required', 
            ]);
        
            if($validator->fails()){
                return $this->sendError('Validation Error.', $validator->errors());       
            }
            
            $department->name = $input['name']; 
            $department->save();

            return $this->sendResponse(new DepartmentResource($department), 'Department updated successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Department not found.', [], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Department $department): JsonResponse
    {
        try {
            $department->delete();
        
            return $this->sendResponse([], 'Department deleted successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Department not found.', [], 404);
        }
    }

}
