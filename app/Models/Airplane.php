<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Airplane extends Model
{
    use HasFactory;

    protected $guarded = [''];

    public function airTickets(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(AirTicket::class);
    }

    public function options(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(PurchaseOption::class);
    }
}
