<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\softDeletes;


class Venta extends Model
{
    use HasFactory, softDeletes;
    
    protected $table = 'ventaentradas';
    protected $primaryKey = 'id_venta';
    protected $keyType = 'unsignedInteger';
	public $timestamps = false;
}
