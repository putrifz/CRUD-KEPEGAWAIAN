<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gaji extends Model
{
    use HasFactory;

    protected $table = 'gaji'; // Nama tabel di database
    protected $primaryKey = 'id_gaji'; // Primary key tabel

    protected $fillable = [
        'id_pegawai',
        'tanggal_pembayaran',
        'jumlah',
    ];
}
