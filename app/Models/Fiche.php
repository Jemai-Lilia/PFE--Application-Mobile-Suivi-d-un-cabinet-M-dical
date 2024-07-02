<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Fiche extends Model
{
    use HasFactory;

    protected $fillable = [
       'dossier_id',
        'image',
        'Note',
    ];

    public function dossier(){
        return $this->belongsTo(Dossier::class);
    }

    // public function medic(){
    //     return $this->belongsTo(Medic::class);
    // }
}
