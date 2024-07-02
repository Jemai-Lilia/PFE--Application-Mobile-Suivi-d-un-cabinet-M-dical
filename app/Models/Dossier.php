<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dossier extends Model
{
    use HasFactory;

    protected $fillable = [
        'nom',
        'prenom',
        'date_naissance',
        'sexe',
        'tel',
        'email',
        'cnam',
        'diagnostique',
        'medicament',
        'synctome',
        'description',
        'medic_id',
    ];

    public function medic(){
        return $this->belongsTo(Medic::class);
    }
}
