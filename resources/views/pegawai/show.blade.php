@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Detail Pegawai</h2>
    <table class="table">
        <tr><th>Nama</th><td>{{ $pegawai->nama }}</td></tr>
        <tr><th>Jabatan</th><td>{{ $pegawai->jabatan->nama_jabatan }}</td></tr>
        <tr><th>Departemen</th><td>{{ $pegawai->departemen->nama_departemen }}</td></tr>
        <tr><th>Tanggal Masuk</th><td>{{ $pegawai->tanggal_masuk }}</td></tr>
        <tr>
            <td><strong>Gaji Terakhir</strong></td>
            <td>
                @if ($pegawai->gaji->isNotEmpty())
                    Rp {{ number_format($pegawai->gaji->last()->jumlah, 0, ',', '.') }}
                @else
                    Belum Ada Data Gaji
                @endif
            </td>
        </tr>
        <tr>
            <td><strong>Tanggal Pembayaran Gaji Terakhir</strong></td>
            <td>
                @if ($pegawai->gaji->isNotEmpty())
                    {{ $pegawai->gaji->last()->tanggal_pembayaran }}
                @else
                    Belum Ada Data Gaji
                @endif
            </td>
        </tr>
        
    </table>
    <a href="{{ route('pegawai.index') }}" class="btn btn-secondary">Kembali</a>
</div>
@endsection
