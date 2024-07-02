<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class rdv extends Model
{
    use HasFactory;
    protected $fillable = ['heur', 'jour'];
}
