<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Variant extends Model
{
    use HasFactory;

    protected $guarded = [''];

    public function feature(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Feature::class, 'feature_id');
    }
}
