<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Task\CreateRequest;
use App\Http\Requests\Task\SearchRequest;
use App\Http\Requests\Task\UpdateRequest;
use App\Http\Resources\API\Task\TaskCollection;
use App\Http\Resources\API\Task\TaskResource;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(SearchRequest $request)
    { 
        try {
            $data = $request->validated();
    
            $user = $request->user();
            $tasks = Task::with('user')
            ->where('user_id', $user->id);
            
            if ($request->has('status') && $data['status'] != null) {
                $tasks->where('status', $data['status']);
            }
    
            if ($request->has('priority') && $data['priority'] != null) {
                $tasks->where('priority', $data['priority']);
            }

            if ($request->has('expires')  && $data['expires'] != null) {
               $this->_filterExpires($tasks, $data['expires']);
            }

            if ($request->has('text')  && $data['text'] != null) {
                $searchTerm = $data['text'];
                $tasks->where(function ($query) use ($searchTerm) {
                    $query->where('title', 'LIKE', "%$searchTerm%")
                        ->orWhere('description', 'LIKE', "%$searchTerm%");
                });
            }

            Log::info('Tasks retrieved successfully.', ['user_id' => $user->id]);
            return (new TaskCollection($tasks->get()));
        } catch (\Exception $e) {
            Log::error('Error retrieving tasks: ' . $e->getMessage(), ['user_id' => $user->id]);
            return response()->json([
                $e->getMessage()
            ], 400);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(CreateRequest $request)
    {
        try {
            $data = $request->validated();
            $data = array_merge($data, ['user_id' =>$request->user()->id]);
            $task = Task::create($data);
           
            Log::info('Data created', [
                'id' => $task->id,
                'title' => $task->title,
                'description' => $task->description,
                'expired_at' => $task->expired_at,
                'user_id' => $request->user()->id
            ]);
            return (new TaskResource($task))->additional([
                'message' => 'data created successfully'
            ]);
        } catch (\Exception $e) {
            Log::error('Error creating data', ['error' => $e->getMessage()]);
            return response()->json([
                $e->getMessage()
            ], 400);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Task $task, Request $request)
    {
        if ($request->user()->id != $task->user_id) {
            return $this->_failedUser();
        }
        try {
            Log::info("User ".$request->user()->id." accessed task = ".$task->id);
            return (new TaskResource($task));
        } catch (\Exception $e) {
            Log::error('Error retrieving data', ['error' => $e->getMessage()]);
            return response()->json([
                $e->getMessage()
            ], 400);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRequest $request, Task $task)
    {
        if ($request->user()->id != $task->user_id) {
            return $this->_failedUser();
        }
        try {
            $data = $request->validated();
            $task->update($data);
            $task->refresh();
            Log::info('Data updated', [
                'id' => $task->id,
                'title' => $task->title,
                'description' => $task->description,
                'expired_at' => $task->expired_at,
                'user_id' => $request->user()->id
            ]);
            return (new TaskResource($task));
        } catch (\Exception $e) {
            Log::error('Error updating data', ['error' => $e->getMessage()]);
            return response()->json([
                $e->getMessage()
            ], 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Task $task, Request $request)
    {
        if ($request->user()->id != $task->user_id) {
            return $this->_failedUser();
        }
        try {
            $task->delete();
            Log::info('Task deleted', ['task_id' => $task->id, 'user_id' => $request->user()->id]);
            return response()->json([
                'message' => 'deleted data successfully'
            ], 200);
        } catch (\Exception $e) {
            Log::error('Error deleting data', ['error' => $e->getMessage()]);
            return response()->json([
                $e->getMessage()
            ], 400);
        }
    }

    public function _filterExpires($tasks, $expires)
    {
        if ($expires == 'today') {
            $tasks->whereDate('expired_at', today());
        }
    
        if ($expires == 'week') {
            $tasks->whereDate('expired_at', '>=', today())
                ->whereDate('expired_at', '<=', today()->addWeek());
        }
    
        return $tasks;
    }

    public function _failedUser()
    {
        Log::error('Forbidden: User tried to access restricted data');
        return response()->json([
            'error' => 'Forbidden',
            'message' => 'You are not allowed to access this data.',
        ], 403);
    }
}
