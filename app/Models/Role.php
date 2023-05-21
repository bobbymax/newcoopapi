<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    protected $guarded = [''];

//    protected $with = ['members'];

    public function members(): \Illuminate\Database\Eloquent\Relations\MorphToMany
    {
        return $this->morphedByMany(User::class, 'roleable');
    }

    public function modules(): \Illuminate\Database\Eloquent\Relations\MorphToMany
    {
        return $this->morphedByMany(Module::class, 'roleable');
    }
}
