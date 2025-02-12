@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Edit Pegawai</h2>
    <form action="{{ route('pegawai.update', $pegawai->id_pegawai) }}" method="POST">
        @csrf
        @method('PUT')    

        <div class="mb-3">
            <label class="form-label">Nama:</label>
            <input type="text" name="nama" class="form-control" value="{{ $pegawai->nama }}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Jabatan:</label>
            <select name="id_jabatan" class="form-select" required>
                @foreach ($jabatan as $j)
                    <option value="{{ $j->id_jabatan }}" {{ $pegawai->id_jabatan == $j->id_jabatan ? 'selected' : '' }}>
                        {{ $j->nama_jabatan }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Departemen:</label>
            <select name="id_departemen" class="form-select" required>
                @foreach ($departemen as $d)
                    <option value="{{ $d->id_departemen }}" {{ $pegawai->id_departemen == $d->id_departemen ? 'selected' : '' }}>
                        {{ $d->nama_departemen }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Tanggal Masuk:</label>
            <input type="date" name="tanggal_masuk" class="form-control" value="{{ $pegawai->tanggal_masuk }}" required>
        </div>

        <button type="submit" class="btn btn-success">Update</button>
    </form>
</div>
@endsection
