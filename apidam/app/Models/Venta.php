<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\softDeletes;


class Venta extends Model
{
    use HasFactory, softDeletes;
    
    protected $table = 'ventaentrada';
    protected $primaryKey = 'cod_venta';
    protected $keyType = 'string';
	public $timestamps = false;
}
