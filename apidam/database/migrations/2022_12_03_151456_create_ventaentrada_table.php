<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ventaentradas', function (Blueprint $table) {
            $table->unsignedInteger('id_venta')->autoIncrement();
            $table->string('codevento');
            $table->string('cod_cliente');
            $table->integer('total');
	        $table->softDeletes();
            
            $table->foreign('codevento')->references('cod_evento')->on('eventos');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ventaentrada');
    }
};
