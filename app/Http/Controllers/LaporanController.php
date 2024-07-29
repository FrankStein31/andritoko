<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Carbon\Carbon;

class LaporanController extends Controller
{
    public function index(Request $request)
    {
        $date = $request->get('date');
        $paymentStatus = $request->get('payment_status');

        $query = Order::query();

        if ($date) {
            $query->whereDate('created_at', $date);
        }

        if ($paymentStatus) {
            $query->where('payment_status', $paymentStatus);
        }

        $orders = $query->orderBy('created_at', 'desc')->get();

        // Calculate daily totals and profits
        $dailyTotals = $orders->groupBy(function ($order) {
            return $order->created_at->format('Y-m-d');
        })->map(function ($dayOrders) {
            return [
                'total' => $dayOrders->sum('sub_total'),
                'profit' => $dayOrders->sum(function ($order) {
                    return $order->sub_total - $order->sub_total;
                }),
                'count' => $dayOrders->count(),
            ];
        })->sortKeysDesc();

        // Calculate overall totals
        $totalPaid = $orders->where('payment_status', 'paid')->sum('sub_total');
        $totalUnpaid = $orders->where('payment_status', 'unpaid')->sum('sub_total');

        return view('backend.laporan.index', compact('orders', 'dailyTotals', 'totalPaid', 'totalUnpaid', 'date', 'paymentStatus'));
    }
}