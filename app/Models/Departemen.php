<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Departemen extends Model
{
    protected $table = 'departemen';
    protected $primaryKey = 'id_departemen';
    public $timestamps = false;

    protected $fillable = ['nama_departemen'];
}
