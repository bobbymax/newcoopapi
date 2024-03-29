<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = [''];
    protected $with = ['roles', 'wallet', 'accounts'];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function loans(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Loan::class);
    }

    public function wallet(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(Wallet::class);
    }

    public function serviceRequests(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ServiceRequest::class);
    }

    public function accounts(): \Illuminate\Database\Eloquent\Relations\MorphMany
    {
        return $this->morphMany(Account::class, 'accountable');
    }

    public function account(): \Illuminate\Database\Eloquent\Relations\MorphOne
    {
        return $this->morphOne(Account::class, 'accountable')->where('current', true);
    }

    public function roles(): \Illuminate\Database\Eloquent\Relations\MorphToMany
    {
        return $this->morphToMany(Role::class, 'roleable');
    }

    public function batches(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Batch::class);
    }

    public function deposits(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Deposit::class);
    }

    public function contributions(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Contribution::class);
    }

    public function contribution(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(Contribution::class)->where('status', 'active');
    }

    public function contributionReviews(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ReviewContribution::class);
    }

    public function expenditures(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Expenditure::class);
    }

     public function payments(): \Illuminate\Database\Eloquent\Relations\MorphMany
     {
         return $this->morphMany(Expenditure::class, 'expenditureable');
     }

    public function projects(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Project::class);
    }

    public function awards(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Award::class);
    }

    public function transactions(): \Illuminate\Database\Eloquent\Relations\MorphMany
    {
        return $this->morphMany(Transaction::class, 'transactionable');
    }

    public function liquidations(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Liquidation::class);
    }
}
