@extends('backend.layouts.master')

@section('main-content')
<div class="container">
    <h2>Daftar Jumlah Satuan</h2>
    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            {{ $message }}
        </div>
    @endif
    <a href="{{ route('jumlahsatuan.create') }}" class="btn btn-primary mb-3">Tambah Jumlah Satuan</a>
    <a href="{{ route('satuan.index') }}" class="btn btn-secondary mb-3">Kembali</a>
    <table class="table">
        <thead>
            <tr>
                <th>Satuan</th>
                <th>Jumlah</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @foreach($satuans as $satuan)
                <tr>
                    <td>{{ $satuan->satuan->nama_satuan }}</td>
                    <td>{{ $satuan->jumlah_satuan }}</td>
                    <td>
                        <form action="{{ route('jumlahsatuan.destroy', $satuan->id_st) }}" method="POST">
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
