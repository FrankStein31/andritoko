@extends('backend.layouts.master')

@section('main-content')
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Daftar Satuan</h1>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <a href="{{ route('satuan.create') }}" class="btn btn-primary mb-3">Tambah Satuan</a>
    <a href="{{ route('jumlahsatuan.index') }}" class="btn btn-secondary mb-3">Kelola Jumlah Satuan</a>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nama Satuan</th>
                <th>Weight</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @foreach($satuans as $satuan)
            <tr>
                <td>{{ $satuan->satuan_id }}</td>
                <td>{{ $satuan->nama_satuan }}</td>
                <td>{{ $satuan->weight }}</td>
                <td>
                    <a href="{{ route('satuan.edit', $satuan->satuan_id) }}" class="btn btn-sm btn-primary">Edit</a>
                    <form action="{{ route('satuan.destroy', $satuan->satuan_id) }}" method="POST" class="d-inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Apakah Anda yakin ingin menghapus?')">Hapus</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection