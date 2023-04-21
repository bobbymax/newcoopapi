<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $guarded = [''];

    protected $with = ['subBudgetHeads'];

    public function subBudgetHeads(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(SubBudgetHead::class);
    }
}
