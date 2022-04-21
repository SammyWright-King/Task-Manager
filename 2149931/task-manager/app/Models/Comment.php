<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'task_id', 'comment'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     * task it belongs to
     */
    public function task() {
        return $this->belongsTo(Task::class, 'task_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     * get user that posted comment
     */
    public function user() {
        return $this->belongsTo(User::class, 'user_id');
    }
}
