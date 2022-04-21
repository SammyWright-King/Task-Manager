<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    /**
     * @param Request $request
     * @param Task $task
     * @POST
     */
    public function comment(Request $request, Task $task) {
        //get user
        $user = Auth::user();

        //find or insert into comment section
        $comment = Comment::firstOrCreate([
                'user_id' => $user->id,
                'task_id' => $task->id,
                'comment' => $request->comment
            ]);

        echo $comment;
    }
}
