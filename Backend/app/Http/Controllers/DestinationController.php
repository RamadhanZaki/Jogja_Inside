<?php

namespace App\Http\Controllers;

use App\Models\Destination;
use App\Models\DestinationMedia;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class DestinationController extends Controller
{
    public function showBySlug($slug)
    {
        $destination = Destination::with('media')->where('slug', $slug)->firstOrFail();

        $destination->thumbnail_url = $destination->thumbnail
            ? asset('storage/' . $destination->thumbnail)
            : null;

        $destination->formatted_media = $destination->media->map(function ($media) {
            return [
                'src' => asset('storage/' . $media->media_path),
                'type' => str_contains($media->media_type, 'video') ? 'video' : 'image',
            ];
        });

        return response()->json($destination);
    }

    public function index(Request $request)
    {
        $query = Destination::query();

        if ($request->filled('search')) {
            $search = preg_replace('/\s+/', '', strtolower($request->search)); // hilangkan spasi, huruf kecil

            $query->where(function ($q) use ($search) {
                $q->whereRaw("REPLACE(LOWER(name), ' ', '') LIKE ?", ["%$search%"])
                ->orWhereRaw("REPLACE(LOWER(category), ' ', '') LIKE ?", ["%$search%"])
                ->orWhereRaw("REPLACE(LOWER(region), ' ', '') LIKE ?", ["%$search%"]);
            });
        }

        if ($request->filled('region')) {
            $regions = is_array($request->region)
                ? $request->region
                : explode(',', $request->region);
            $query->whereIn('region', $regions);
        }

        if ($request->filled('category')) {
            $categories = is_array($request->category)
                ? $request->category
                : explode(',', $request->category);
            $query->whereIn('category', $categories);
        }

        if ($request->filled('label')) {
            $labels = is_array($request->label)
                ? $request->label
                : explode(',', $request->label);
            foreach ($labels as $label) {
                $query->whereJsonContains('label', $label);
            }
        }

        // ✅ Tambahkan bagian ini untuk limit dan offset
        $limit = $request->input('limit', 10); // default 10
        $offset = $request->input('offset', 0); // default 0

        $total = $query->count(); // hitung total data sebelum pagination
        $destinations = $query
            ->offset($request->offset ?? 0)
            ->limit($request->limit ?? 100)
            ->get()
            ->map(function ($item) {
                $item->thumbnail_url = $item->thumbnail
                    ? asset('storage/' . $item->thumbnail)
                    : 'https://via.placeholder.com/300x200?text=No+Image';
                return $item;
            });

        return response()->json([
            'data' => $destinations,
            'total' => $total
        ]);
    }



    public function show($id)
    {
        $destination = Destination::with('media')->findOrFail($id);

        $mediaUrls = $destination->media->map(function ($media) {
            return asset('storage/' . $media->media_path);
        });

        $destination->background_url = $destination->background
            ? asset('storage/' . $destination->background)
            : null;

        $destination->thumbnail_url = $destination->thumbnail
            ? asset('storage/' . $destination->thumbnail)
            : null;

        $destination->media_urls = $mediaUrls;

        return response()->json($destination);
    }

    public function store(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'region' => 'required|string|max:100',
                'description' => 'required|string',
                'location' => 'required|string',
                'ticket_price' => 'required|string',
                'facilities' => 'required|string',
                'maps' => 'required|string',
                'rating' => 'required|integer|min:1|max:5',
                'label' => 'nullable|string|max:255',
                'category' => 'required|string|max:255',
                'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:2048',
                'background' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:4096',
                'media.*' => 'nullable|file|mimes:jpeg,png,jpg,gif,webp,mp4,webm,mov|max:10240',
                'whatsapp' => 'nullable|url',
                'instagram' => 'nullable|url',
                'tiktok' => 'nullable|url',
                'x' => 'nullable|url'
            ]);

            $slug = Str::slug($validated['name']);
            $originalSlug = $slug;
            $counter = 1;
            while (Destination::where('slug', $slug)->exists()) {
                $slug = $originalSlug . '-' . $counter++;
            }
            $validated['slug'] = $slug;

            if ($request->hasFile('thumbnail')) {
                $validated['thumbnail'] = $request->file('thumbnail')->store('uploads/thumbnail', 'public');
            }

            if ($request->hasFile('background')) {
                $validated['background'] = $request->file('background')->store('uploads/backgrounds', 'public');
            }

            unset($validated['media']);

            $destination = Destination::create($validated);

            if ($request->hasFile('media')) {
                foreach ($request->file('media') as $file) {
                    $mediaPath = $file->store('uploads/media', 'public');
                    DestinationMedia::create([
                        'destination_id' => $destination->id,
                        'media_path' => $mediaPath,
                        'media_type' => $file->getClientMimeType(),
                    ]);
                }
            }

            return response()->json(['message' => 'Berhasil menambahkan destinasi!'], 201);
        } catch (\Exception $e) {
            Log::error('❌ Gagal menyimpan destinasi', [
                'error' => $e->getMessage(),
                'line' => $e->getLine(),
            ]);
            return response()->json(['message' => 'Gagal menyimpan destinasi'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $destination = Destination::findOrFail($id);

            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'region' => 'required|string|max:100',
                'description' => 'required|string',
                'location' => 'required|string',
                'ticket_price' => 'required|string',
                'facilities' => 'required|string',
                'maps' => 'required|string',
                'rating' => 'required|integer|min:1|max:5',
                'label' => 'nullable|string|max:255',
                'category' => 'required|string|max:255',
                'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:2048',
                'background' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:4096',
                'whatsapp' => 'nullable|url',
                'instagram' => 'nullable|url',
                'tiktok' => 'nullable|url',
                'x' => 'nullable|url'
            ]);

            $validated['slug'] = Str::slug($validated['name']);

            if ($request->hasFile('thumbnail')) {
                if ($destination->thumbnail) {
                    Storage::disk('public')->delete($destination->thumbnail);
                }
                $validated['thumbnail'] = $request->file('thumbnail')->store('uploads/thumbnail', 'public');
            }

            if ($request->hasFile('background')) {
                if ($destination->background) {
                    Storage::disk('public')->delete($destination->background);
                }
                $validated['background'] = $request->file('background')->store('uploads/backgrounds', 'public');
            }

            unset($validated['media']);

            $destination->update($validated);

            if ($request->hasFile('media')) {
                foreach ($request->file('media') as $file) {
                    $mediaPath = $file->store('uploads/media', 'public');
                    DestinationMedia::create([
                        'destination_id' => $destination->id,
                        'media_path' => $mediaPath,
                        'media_type' => $file->getClientMimeType(),
                    ]);
                }
            }

            return response()->json(['message' => 'Berhasil memperbarui destinasi!']);
        } catch (\Exception $e) {
            Log::error('❌ Gagal update destinasi', [
                'error' => $e->getMessage(),
                'line' => $e->getLine(),
            ]);
            return response()->json(['message' => 'Gagal update destinasi'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $destination = Destination::with('media')->findOrFail($id);

            if ($destination->thumbnail) {
                Storage::disk('public')->delete($destination->thumbnail);
            }

            if ($destination->background) {
                Storage::disk('public')->delete($destination->background);
            }

            foreach ($destination->media as $media) {
                Storage::disk('public')->delete($media->media_path);
                $media->delete();
            }

            $destination->delete();

            return response()->json(['message' => 'Destinasi berhasil dihapus!']);
        } catch (\Exception $e) {
            Log::error('❌ Gagal menghapus destinasi', [
                'error' => $e->getMessage(),
                'line' => $e->getLine(),
            ]);
            return response()->json(['message' => 'Gagal menghapus destinasi'], 500);
        }
    }

    public function destroyMultiple(Request $request)
    {
        $ids = $request->input('ids');

        if (!is_array($ids)) {
            return response()->json(['message' => 'Data ID tidak valid.'], 400);
        }

        foreach ($ids as $id) {
            $destination = Destination::with('media')->find($id);
            if ($destination) {
                if ($destination->thumbnail) {
                    Storage::disk('public')->delete($destination->thumbnail);
                }

                if ($destination->background) {
                    Storage::disk('public')->delete($destination->background);
                }

                foreach ($destination->media as $media) {
                    Storage::disk('public')->delete($media->media_path);
                    $media->delete();
                }

                $destination->delete();
            }
        }

        return response()->json(['message' => 'Semua destinasi berhasil dihapus.']);
    }

    public function getStats(Request $request)
    {
        $region = $request->query('region');

        if (!$region) {
            return response()->json(['error' => 'Region is required'], 400);
        }

        $allowedRegions = ['Bantul', 'Sleman', 'Yogyakarta', 'Kulon Progo', 'GunungKidul'];
        if (!in_array($region, $allowedRegions)) {
            return response()->json(['error' => 'Region tidak valid'], 400);
        }

        $destinations = Destination::where('region', $region)->get();

        $total = $destinations->count();
        $trending = $destinations->filter(fn($d) => str_contains(strtolower($d->label), 'trending now'))->count();
        $hiddenGem = $destinations->filter(fn($d) => str_contains(strtolower($d->label), 'hidden gem'))->count();
        $natureEscape = $destinations->filter(fn($d) => str_contains(strtolower($d->label), 'nature escape'))->count();

        return response()->json([
            'total' => $total,
            'trending' => $trending,
            'hidden_gem' => $hiddenGem,
            'nature_escape' => $natureEscape,
        ]);
    }

}
