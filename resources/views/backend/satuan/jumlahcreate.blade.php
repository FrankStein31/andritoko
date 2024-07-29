@extends('backend.layouts.master')

@section('main-content')
<div class="container">
    <h2>Tambah Jumlah Satuan</h2>
    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            {{ $message }}
        </div>
    @endif
    <form action="{{ route('jumlahsatuan.store') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="satuan_id">Satuan:</label>
            <select name="satuan_id" class="form-control" required>
                @foreach($satuans as $satuan)
                    <option value="{{ $satuan->satuan_id }}">{{ $satuan->nama_satuan }}</option>
                @endforeach
            </select>
        </div>
        <div class="form-group">
            <label for="jumlah_satuan">Jumlah Satuan:</label>
            <input type="number" name="jumlah_satuan" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Simpan</button>
    </form>
</div>
@endsection
