<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Comment;
use App\Models\Task;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use PHPUnit\Framework\Error;

class AdminController extends Controller
{
    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET admin login
     */
    public function login() {
        return view('admin.login');
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     * @POST login
     */
    public function postLogin(Request $request) {
        try{
           //get email
            $user = User::where('email', $request->email);
            if($user){
                //attempt to validate email
                if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
                    return redirect()->route('admin.index');
                }else{
                    return back()->with('error', 'User Not Found!');
                }
            }
        }catch(\Exception $e) {

        }
    }


    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET admin index
     */
    public function index() {
        $tasks = Task::all();
        $users = User::all();
        $categories = Category::all();
        $comments = Comment::all();
        return view('admin.index', compact('users', 'categories', 'tasks', 'comments'));
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET categories
     */
    public function categories() {
        $categories = Category::all();
        return view('admin.categories', compact('categories'));
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET tasks
     */
    public function tasks() {
        $tasks = Task::simplePaginate(30);
        return view('admin.tasks', compact('tasks'));
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET users
     */
    public function users() {
        $users = User::simplePaginate(30);
        return view('admin.users', compact('users'));
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET comments
     */
    public function comments() {
        $comments = Comment::simplePaginate(30);
        return view('admin.comments', compact('comments'));
    }

    public function forms() {
        return view('admin.forms');
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET create category page
     */
    public function createCategory() {
        $user = Auth::user();
        return view('admin.create-category', compact('user'));
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     * @POST new category
     */
    public function postCategory(Request $request) {
        //first or create category
        Category::firstOrCreate(['name' => $request->name]);

        //redirect to categories page
        return redirect()->route('admin.categories');
    }
}
