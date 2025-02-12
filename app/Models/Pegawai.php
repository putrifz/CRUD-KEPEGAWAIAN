<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Gaji;

class Pegawai extends Model
{
    use HasFactory;

    protected $table = 'pegawai';
    protected $primaryKey = 'id_pegawai';
    public $timestamps = false;

    protected $fillable = [
        'nama', 'id_jabatan', 'id_departemen', 'tanggal_masuk'
    ];

    // Tambahkan relasi ke Jabatan
    public function jabatan()
    {
        return $this->belongsTo(Jabatan::class, 'id_jabatan', 'id_jabatan');
    }

    // Tambahkan relasi ke Departemen
    public function departemen()
    {
        return $this->belongsTo(Departemen::class, 'id_departemen', 'id_departemen');
    }

    // Relasi Ke Gaji
    public function gaji()
    {
        return $this->hasMany(Gaji::class, 'id_pegawai');
    }

    public function show($id)
    {
        $pegawai = Pegawai::with('jabatan', 'departemen')->findOrFail($id);
        $gaji = Gaji::where('id_pegawai', $id)->get();

        return view('pegawai.show', compact('pegawai', 'gaji'));
    }
}
