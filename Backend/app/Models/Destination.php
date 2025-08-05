<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Destination extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'region',
        'description',
        'location',
        'ticket_price',
        'facilities',
        'maps',
        'rating',
        'label',
        'category',
        'thumbnail',
        'background',
        'whatsapp',
        'instagram',
        'tiktok',
        'x',
        'slug',
    ];

    protected $appends = ['background_url', 'media_urls'];

    // Relasi ke media
    public function media()
    {
        return $this->hasMany(DestinationMedia::class);
    }

    // URL background (hindari duplikat "http://..." jika sudah full URL)
    // Destination.php
public function getBackgroundUrlAttribute()
{
    return $this->background ? asset('storage/' . $this->background) : null;
}


    // URL media (jika relasi 'media' sudah dimuat)
    public function getMediaUrlsAttribute()
    {
        if (!$this->relationLoaded('media')) {
            return [];
        }

        return $this->media->map(function ($item) {
            return isset($item->media_path)
                ? asset('storage/' . $item->media_path)
                : null;
        })->filter()->values();
    }
}
