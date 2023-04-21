<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccountCode extends Model
{
    use HasFactory;

    protected $guarded = [''];

    protected $with = ['charts'];

    public function charts(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ChartOfAccount::class);
    }
}
