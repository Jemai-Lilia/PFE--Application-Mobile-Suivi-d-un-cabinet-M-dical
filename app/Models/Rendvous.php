<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rendvous extends Model
{
    use HasFactory;
    protected $fillable = [
        'time',
        'date',
        'medic_id',
        'patient_id'
    ];

    public function patient(){
        return $this->belongsTo(Patient::class);
    }

    public function medic(){
        return $this->belongsTo(Medic::class);
    }
}
