@extends('backend.layouts.master')

@section('main-content')
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Laporan Penjualan</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Filter</h6>
        </div>
        <div class="card-body">
            <form action="{{ route('laporan.index') }}" method="GET" id="reportForm">
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label for="date">Tanggal</label>
                        <input type="date" class="form-control" id="date" name="date" value="{{ $date }}">
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="payment_status">Status pembayaran</label>
                        <select class="form-control" id="payment_status" name="payment_status">
                            <option value="">Semua</option>
                            <option value="paid" {{ $paymentStatus == 'paid' ? 'selected' : '' }}>Terbayar</option>
                            <option value="unpaid" {{ $paymentStatus == 'unpaid' ? 'selected' : '' }}>Belum Dibayar</option>
                        </select>
                    </div>
                </div>
                <button class="btn btn-primary" type="submit">Filter</button>
                <a href="{{ route('laporan.index') }}" class="btn btn-secondary">Reset</a>
            </form>
        </div>
        @section('scripts')
        <script>
            document.getElementById('payment_status').addEventListener('change', function() {
                document.getElementById('reportForm').submit();
            });
        </script>
        @endsection
    </div>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Jumlah keuntungan</h6>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <h5>Terbayar : Rp.{{ number_format($totalPaid, 2) }}</h5>
                </div>
                <div class="col-md-6">
                    <h5>Belum dibayar : Rp.{{ number_format($totalUnpaid, 2) }}</h5>
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Laporan Harian</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Total Penjualan</th>
                            <th>Jumlah Penjualan</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($dailyTotals as $date => $total)
                        <tr>
                            <td>{{ $date }}</td>
                            <td>Rp.{{ number_format($total['total'], 2) }}</td>
                            <td>{{ $total['count'] }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Detail Penjualan</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Kode Resi</th>
                            <th>Nama Customer</th>
                            <th>Total</th>
                            <th>Status Pembayaran</th>
                            <th>Status Penjualan</th>
                            <th>Tanggal</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($orders as $order)
                        <tr>
                            <td>{{ $order->order_number }}</td>
                            <td>{{ $order->first_name }} {{ $order->last_name }}</td>
                            <td>Rp.{{ number_format($order->sub_total, 2) }}</td>
                            <td>{{ ucfirst($order->payment_status) }}</td>
                            <td>{{ ucfirst($order->status) }}</td>
                            <td>{{ $order->created_at->format('Y-m-d H:i:s') }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection

