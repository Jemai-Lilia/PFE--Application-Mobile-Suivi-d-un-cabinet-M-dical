<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Patient extends Model
{
    use HasFactory;

    protected $fillable = [
        'etat',
        'fcmtoken',
        'user_id',
        'medic_id',
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function medic(){
        return $this->belongsTo(Medic::class);
    }
}
