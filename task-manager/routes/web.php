<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\AdminController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::middleware('guest')->group(function(){
    Route::get('/login', [UserController::class, 'showLogin'])->name('login.user');
    Route::post('/login', [UserController::class, 'postLogin'])->name('post.login-user');
    Route::get('/signup', [UserController::class, 'showSignup'])->name('signup.user');
    Route::post('/signup', [UserController::class, 'postSignup'])->name('post.signup-user');

});

Route::get('/tasks', [TaskController::class, 'allTasks'])->name('all-tasks');

Route::get('/admin/login', [AdminController::class, 'login'])->name('admin.login');
Route::post('/admin/login', [AdminController::class, 'postLogin'])->name('post.admin.login');

Route::middleware('admin.check')->group(function (){
    Route::get('/admin', [AdminController::class, 'index'])->name('admin.index');
    Route::get('/admin/users', [AdminController::class, 'users'])->name('admin.users');
    Route::get('/admin/categories', [AdminController::class, 'categories'])->name('admin.categories');
    Route::get('/admin/tasks', [AdminController::class, 'tasks'])->name('admin.tasks');
    Route::get('/admin/comments', [AdminController::class, 'comments'])->name('admin.comments');
    Route::get('/admin/create-category', [AdminController::class, 'createCategory'])->name('create-category');
    Route::post('/admin/create-category', [AdminController::class, 'postCategory'])->name('post-category');
});

Route::middleware('auth')->group(function (){
    Route::post('/logout', [UserController::class, 'logout'])->name('logout');

    Route::get('/my-tasks', [TaskController::class, 'list'])->name('tasks');
    Route::get('/task/{task}', [TaskController::class, 'show'])->name('task');
    Route::get('/create-task', [TaskController::class, 'create'])->name('create.task');
    Route::post('/create-task', [TaskController::class, 'save'])->name('save.task');
    Route::get('/task/{task}/edit', [TaskController::class, 'edit'])->name('edit.task');
    Route::post('/task/{task}/edit', [TaskController::class, 'update'])->name('update.task');

    Route::post('/task/{task}/comment', [CommentController::class, 'comment'])->name('comment');

//    Route::get('/admin', [AdminController::class])->name('admin-login');
});

