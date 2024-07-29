<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SatuanJumlah;
use App\Models\Satuan;

class JumlahsatuanController extends Controller
{
    // public function index()
    // {
    //     $satuans = SatuanJumlah::with('satuan')->get();
    //     return view('backend.satuan.jumlahindex', compact('satuans'));
    // }
    public function index()
    {
        $satuans = SatuanJumlah::with('satuan')->get()->sortBy('satuan.nama_satuan');
        return view('backend.satuan.jumlahindex', compact('satuans'));
    }

    public function create()
    {
        $satuans = Satuan::all();
        return view('backend.satuan.jumlahcreate', compact('satuans'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'satuan_id' => 'required|integer|exists:satuan,satuan_id',
            'jumlah_satuan' => 'required|integer',
        ]);

        SatuanJumlah::create($request->all());

        return redirect()->route('jumlahsatuan.index')->with('success', 'Data berhasil disimpan');
    }

    public function destroy($id)
    {
        $satuanJumlah = SatuanJumlah::findOrFail($id);
        $satuanJumlah->delete();

        return redirect()->route('jumlahsatuan.index')->with('success', 'Data berhasil dihapus');
    }
}
