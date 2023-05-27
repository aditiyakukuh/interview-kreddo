<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TaskSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i=1; $i <= 10; $i++) { 
            \App\Models\Task::factory()->create([
                'title' => 'job'.$i,
                'user_id' => \App\Models\User::first()->id,
                'expired_at' => now()->addDays($i)
            ]);
        }
    }
}
