<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmissaoContigenciasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('emissao_contigencias', function (Blueprint $table) {
            $table->id();

            $table->integer('business_id')->unsigned();
            $table->foreign('business_id')->references('id')->on('business')->onDelete('cascade');

            $table->string('chave', 44);
            $table->string('recibo', 30);
            $table->string('serie', 3);
            $table->integer('numero');
            $table->decimal('valor', 16, 7);
            $table->timestamp('data_emissao')->nullable();
            $table->boolean('status_reenvio')->default(0);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('emissao_contigencias');
    }
}
