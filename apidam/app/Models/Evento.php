<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\softDeletes;

class Evento extends Model
{
    use HasFactory, softDeletes;
    
    protected $table = 'evento';
    protected $primaryKey = 'cod_evento';
    protected $keyType = 'string';
	public $timestamps = false;
    


}
