@extends('backend.layouts.master')

@section('main-content')
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Edit Satuan</h1>

    <form action="{{ route('satuan.update', $satuan->satuan_id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="form-group">
            <label for="nama_satuan">Nama Satuan</label>
            <input type="text" class="form-control" id="nama_satuan" name="nama_satuan" value="{{ $satuan->nama_satuan }}" required>
        </div>
        <div class="form-group">
            <label for="weight">Weight</label>
            <input type="number" step="0.01" class="form-control" id="weight" name="weight" value="{{ $satuan->weight }}">
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>
@endsection