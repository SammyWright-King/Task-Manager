<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class TaskController extends Controller
{

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET all tasks
     */
    public function allTasks() {
        $tasks = Task::all();
        return view('all-tasks', compact('tasks'));
    }
    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET my own tasks
     */
    public function list() {
        $user = Auth::user();
        $tasks = Task::all();
        return view('tasks', compact('user','tasks'));
    }

    /**
     * @param Task $task
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET task
     */
    public function show(Task $task) {
       return view('task', compact('task'));
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET create task page
     */
    public function create() {
        $categories = Category::all();
        return view('create-task', compact('categories'));
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     * @POST save task to database
     */
    public function save(Request $request) {
        //validate request
        request()->validate([
            'title' => 'required',
            'category' => 'required',
            'description' => 'required',
        ]);

        //find or create
        $task = Task::firstOrCreate([
            'user_id' => Auth::user()->id,
            'category_id' => $request->category,
            'title' => $request->title,
            'description' => $request->description
        ]);

        //if request has file
        if($request->hasFile('img')) {

            $file = $request->file('img');
            // Generate a file name with extension
            $fileName = time().'.'.$file->getClientOriginalExtension();
            // Save the file

            $path = Storage::disk('public')->put('img', $file);

            $task->update(['image_url' => $path]);
        }

        return redirect()->route('tasks');
    }

    /**
     * @param Task $task
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET edit task page
     */
    public function edit(Task $task){
        $categories = Category::all();
        return view('edit-task', compact('categories', 'task'));
    }

    /**
     * @param Task $task
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     * @POST update task
     */
    public function update(Task $task, Request $request) {
        //validate request
        request()->validate([
            'title' => 'required',
            'category' => 'required',
            'description' => 'required',
        ]);

        $task->update([
            'user_id' => Auth::user()->id,
            'category_id' => $request->category,
            'title' => $request->title,
            'description' => $request->description
        ]);

        //if request has file
        if($request->hasFile('img')) {

            $file = $request->file('img');
            // Generate a file name with extension
            $fileName = time().'.'.$file->getClientOriginalExtension();
            // Save the file

            $path = Storage::disk('public')->put('img', $file);

            $task->update(['image_url' => $path]);
        }

        return redirect()->route('tasks');
    }
}
