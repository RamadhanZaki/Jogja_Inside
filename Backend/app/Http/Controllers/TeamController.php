<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Team;

class TeamController extends Controller
{
    // ✅ Menampilkan semua data tim
    public function index()
    {
        return response()->json(Team::all());
    }

    // ✅ Menambahkan anggota tim dengan upload gambar (diperbaiki)
    public function store(Request $request)
    {
        $request->validate([
            'name'      => 'required|string|max:255',
            'job'       => 'required|string|max:255',
            'github'    => 'nullable|url',
            'instagram' => 'nullable|url',
            'image'     => 'required|image|mimes:jpeg,png,jpg,webp|max:2048',
        ]);

        // Simpan gambar dengan nama unik dan ekstensi asli
        $image = $request->file('image');
        $filename = uniqid() . '.' . $image->getClientOriginalExtension(); // Contoh: abc123.jpg
        $image->storeAs('teams', $filename, 'public'); // Simpan di storage/app/public/teams
        $imagePath = 'teams/' . $filename;

        // Simpan data ke database, path publik bisa diakses via browser
        $team = Team::create([
            'name'      => $request->name,
            'job'       => $request->job,
            'github'    => $request->github,
            'instagram' => $request->instagram,
            'img'       => '/storage/' . $imagePath,
        ]);

        return response()->json([
            'message' => 'Team member berhasil ditambahkan',
            'data' => $team
        ], 201);
    }

    // ✅ Menghapus satu anggota tim
    public function destroy($id)
    {
        $team = Team::findOrFail($id);

        // Hapus gambar dari storage jika ada
        if ($team->img) {
            $imgPath = str_replace('/storage/', '', $team->img); // Ubah ke path dalam disk
            if (Storage::disk('public')->exists($imgPath)) {
                Storage::disk('public')->delete($imgPath);
            }
        }

        $team->delete();

        return response()->json([
            'message' => 'Team member berhasil dihapus'
        ]);
    }

    // ✅ Menghapus banyak anggota tim
    public function deleteMultiple(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
            'ids.*' => 'integer',
        ]);

        $teams = Team::whereIn('id', $request->ids)->get();

        foreach ($teams as $team) {
            if ($team->img) {
                $imgPath = str_replace('/storage/', '', $team->img);
                if (Storage::disk('public')->exists($imgPath)) {
                    Storage::disk('public')->delete($imgPath);
                }
            }
            $team->delete();
        }

        return response()->json([
            'message' => 'Beberapa anggota tim berhasil dihapus'
        ]);
    }

    // ✅ Mengupdate anggota tim
    public function update(Request $request, $id)
    {
        $team = Team::findOrFail($id);

        $request->validate([
            'name'      => 'required|string|max:255',
            'job'       => 'required|string|max:255',
            'github'    => 'nullable|url',
            'instagram' => 'nullable|url',
            'image'     => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048',
        ]);

        $team->name = $request->name;
        $team->job = $request->job;
        $team->github = $request->github;
        $team->instagram = $request->instagram;

        // Ganti gambar jika ada gambar baru
        if ($request->hasFile('image')) {
            // Hapus gambar lama
            if ($team->img) {
                $oldPath = str_replace('/storage/', '', $team->img);
                if (Storage::disk('public')->exists($oldPath)) {
                    Storage::disk('public')->delete($oldPath);
                }
            }

            // Upload gambar baru
            $file = $request->file('image');
            $filename = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->storeAs('teams', $filename, 'public');
            $team->img = '/storage/teams/' . $filename;
        }

        $team->save();

        return response()->json([
            'message' => 'Team member berhasil diperbarui',
            'data' => $team
        ]);
    }
}
