<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SatuanJumlah extends Model
{
    use HasFactory;

    protected $table = 'satuan_jumlah';
    protected $primaryKey = 'id_st';
    public $timestamps = false;

    protected $fillable = ['satuan_id', 'jumlah_satuan'];

    public function satuan()
    {
        return $this->belongsTo(Satuan::class, 'satuan_id', 'satuan_id');
    }
}