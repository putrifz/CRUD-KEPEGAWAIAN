@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Tambah Pegawai</h2>
    <form action="{{ route('pegawai.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label class="form-label">Nama:</label>
            <input type="text" name="nama" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Jabatan:</label>
            <select name="id_jabatan" class="form-select" required>
                @foreach ($jabatan as $j)
                    <option value="{{ $j->id_jabatan }}">{{ $j->nama_jabatan }}</option>
                @endforeach
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Departemen:</label>
            <select name="id_departemen" class="form-select" required>
                @foreach ($departemen as $d)
                    <option value="{{ $d->id_departemen }}">{{ $d->nama_departemen }}</option>
                @endforeach
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Tanggal Masuk:</label>
            <input type="date" name="tanggal_masuk" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-primary">Simpan</button>
    </form>
</div>
@endsection
