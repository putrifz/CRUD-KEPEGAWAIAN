<?php

namespace App\Http\Controllers;

use App\Models\Pegawai;
use App\Models\Jabatan;
use App\Models\Departemen;
use Illuminate\Http\Request;

class PegawaiController extends Controller
{
    public function index()
    {
        $pegawai = Pegawai::with(['jabatan', 'departemen'])->get();
        return view('pegawai.index', compact('pegawai'));
    }

    public function create()
    {
        $jabatan = Jabatan::all();
        $departemen = Departemen::all();
        return view('pegawai.create', compact('jabatan', 'departemen'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama' => 'required',
            'id_jabatan' => 'required',
            'id_departemen' => 'required',
            'tanggal_masuk' => 'required|date',
        ]);

        Pegawai::create($request->all());
        return redirect()->route('pegawai.index');
    }

    public function edit($id)
        {
            $pegawai = Pegawai::findOrFail($id);
            $jabatan = Jabatan::all();
            $departemen = Departemen::all();

            return view('pegawai.edit', compact('pegawai', 'jabatan', 'departemen'));
        }

    

    public function update(Request $request, Pegawai $pegawai)
{
    $request->validate([
        'nama' => 'required',
        'id_jabatan' => 'required',
        'id_departemen' => 'required',
        'tanggal_masuk' => 'required|date',
    ]);

    $pegawai->update($request->all());
    return redirect()->route('pegawai.index')->with('success', 'Data pegawai berhasil diperbarui');
}

public function show($id)
{
    $pegawai = Pegawai::with(['jabatan', 'departemen'])->findOrFail($id);
    return view('pegawai.show', compact('pegawai'));
}


    public function destroy(Pegawai $pegawai)
    {
        $pegawai->delete();
        return redirect()->route('pegawai.index');
    }
}
