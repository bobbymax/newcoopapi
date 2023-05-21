<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Loan extends Model
{
    use HasFactory;

    protected $guarded = [''];

    protected $with = ['subBudgetHead', 'installments'];

    public function member(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function subBudgetHead(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(SubBudgetHead::class, 'sub_budget_head_id');
    }

    public function installments(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Installment::class);
    }

    public function guarantors(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Guarantor::class);
    }
}
