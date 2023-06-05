<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    protected $guarded = [''];
    protected $with = ['awards'];

    public function subBudgetHead()
    {
        return $this->belongsTo(SubBudgetHead::class, 'sub_budget_head_id');
    }

    public function officer()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function awards()
    {
        return $this->hasMany(Award::class);
    }
}
