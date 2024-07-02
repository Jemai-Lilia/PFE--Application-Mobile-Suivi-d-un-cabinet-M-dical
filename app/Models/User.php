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
    protected $fillable = [
        'name',
        'num_tel',
        'adresse',
        'ville',
        'sexe',
        'num_cnam',
        'role',
        'email',
        'password',
        'verification_code',
        'verified'
    ];

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

    public function medic()
    {
        return $this->hasOne(Medic::class);
    }
    public function patient()
    {
        return $this->hasOne(Patient::class);
    }
    // public function user_details()
    // {
    //     return $this->hasOne(UserDetails::class, 'user_id');
    // }
    public function posts()
    {
        return $this->hasMany(Post::class, 'user_id');
    }

}
