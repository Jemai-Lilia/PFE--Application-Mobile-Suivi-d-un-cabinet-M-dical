<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Response extends Model
{
    use HasFactory;

    protected $fillable = [
        'response',
        'question_id',
        'medic_id',
        'user_id'
    ];

    public function question(){
        return $this->belongsTo(Question::class);
    }
    public function medic(){
        return $this->belongsTo(Medic::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
