<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Organization extends Model
{
    use HasFactory;

    protected $guarded = [''];

    protected $with = ['accounts'];

    public function accounts(): \Illuminate\Database\Eloquent\Relations\MorphMany
    {
        return $this->morphMany(Account::class, 'accountable');
    }

    public function beneficiaries(): \Illuminate\Database\Eloquent\Relations\MorphMany
    {
        return $this->morphMany(Expenditure::class, 'expenditureable');
    }
}
