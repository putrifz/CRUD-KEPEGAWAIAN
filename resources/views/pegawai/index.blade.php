@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Daftar Pegawai</h2>
    <a href="{{ route('pegawai.create') }}" class="btn btn-primary">Tambah Pegawai</a>
    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th>Nama</th>
                <th>Jabatan</th>
                <th>Departemen</th>
                <th>Tanggal Masuk</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($pegawai as $p)
            <tr>
                <td>{{ $p->nama }}</td>
                <td>{{ $p->jabatan->nama_jabatan }}</td>
                <td>{{ $p->departemen->nama_departemen }}</td>
                <td>{{ $p->tanggal_masuk }}</td>
                <td>
                    <a href="{{ route('pegawai.show', $p->id_pegawai) }}" class="btn btn-info">Detail</a>

                    <a href="{{ route('pegawai.edit', $p->id_pegawai) }}" class="btn btn-warning">Edit</a>
                    
                    <form action="{{ route('pegawai.destroy', $p->id_pegawai) }}" method="POST" style="display:inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Hapus</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
