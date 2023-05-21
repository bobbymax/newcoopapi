<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubBudgetHead extends Model
{
    use HasFactory;

    protected $guarded = [''];

//    protected $with = ['budgetHead', 'category', 'feature', 'fund'];

    public function budgetHead(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(BudgetHead::class, 'budget_head_id');
    }

    public function category(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function expenditures(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Expenditure::class);
    }

    public function funds(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Fund::class);
    }

    public function fund(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(Fund::class)->where('year', 2023);
    }

    public function feature(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(Feature::class);
    }
}
