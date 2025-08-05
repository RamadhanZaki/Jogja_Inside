<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DestinationMedia extends Model
{
    protected $fillable = ['destination_id', 'media_path', 'media_type'];

    protected $appends = ['media_url'];

    public function destination()
    {
        return $this->belongsTo(Destination::class);
    }

// DestinationMedia.php
public function getMediaUrlAttribute()
{
    return $this->media_path ? asset('storage/' . $this->media_path) : null;
}

}
