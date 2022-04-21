<?php

namespace Database\Seeders;

use App\Models\Comment;
use App\Models\User;
use App\Models\Task;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use phpDocumentor\Reflection\Types\False_;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //insert admin account
        User::create([
            'first_name' => 'admin',
            'last_name' => 'admin',
            'email' => 'admin@admin.com',
            'password' => Hash::make('password'),
            'is_admin' => True
        ]);

        //populate dummy data
        User::factory()->count(50)->has(Task::factory()->count(2), 'tasks')
            ->create();


    }
}
