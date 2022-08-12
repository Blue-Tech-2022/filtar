<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProvidersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('providers', function (Blueprint $table) {
            $table->id();
            $table->string('logo')->nullable();
            $table->string('first_name');
            $table->string('last_name');
            $table->string('store_name');
            $table->string('nationality_id_image');
            $table->string('vat_number');
            $table->string('vat_number_image');
            $table->string('commercial_number');
            $table->string('commercial_number_image');
            $table->text('address')->nullable();
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
        Schema::dropIfExists('providers');
    }
}
