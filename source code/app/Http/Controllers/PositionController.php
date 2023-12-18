<?php

namespace App\Http\Controllers;

use App\Models\Position;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Validator;
use Illuminate\Http\JsonResponse;
use App\Http\Resources\PositionResource;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class PositionController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $position = Position::with('department')->get();
        return $this->sendResponse(PositionResource::collection($position), 'Position retrieved successfully.');
    } 

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        $input = $request->all();
        
        $validator = Validator::make($input, [
            'name' => 'required|unique:positions,name', 
            'department_id' => 'required|exists:departments,id',
        ]);
       
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

       $Position  = new Position;
       $Position->name = $request->name;
       $Position->department_id = $request->department_id;
       $Position->save();
    
       $Position->load('department');

        return $this->sendResponse(new PositionResource($Position), 'Position created successfully.');
    } 

    /**
     * Display the specified resource.
     */
    public function show($id): JsonResponse
    {
        try {
            $position = Position::with('department')->find($id);
        
            if (is_null($position)) {
                return $this->sendError('Position not found.');
            }
        
            return $this->sendResponse(new PositionResource($position), 'Position retrieved successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Department not found.', [], 404);
        }
    } 

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Position $position): JsonResponse
    {

        try {
            $input = $request->all();
        
            $validator = Validator::make($input, [
                'name' => 'required|unique:positions,name', 
                'department_id'=> 'required' 
            ]);
        
            if($validator->fails()){
                return $this->sendError('Validation Error.', $validator->errors());       
            }
            
            $position->name =$request->name; 
            $position->department_id = $request->department_id;
            $position->save();

            return $this->sendResponse(new PositionResource($position), 'Position updated successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Department not found.', [], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Position $position): JsonResponse
    {
        try {
            $position->delete();
        
            return $this->sendResponse([], 'Position deleted successfully.');
        } catch (ModelNotFoundException $e) {
            return $this->sendError('Department not found.', [], 404);
        }
    }

}
