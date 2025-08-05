<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $query = User::query();

        if ($search = $request->input('search')) {
            $query->where('username', 'like', "%$search%")
                  ->orWhere('email', 'like', "%$search%");
        }

        if ($role = $request->input('role')) {
            $query->where('role', $role);
        }

        return $query->orderBy('created_at', 'desc')->get();
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'     => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:user', // ganti dari 'users'
            'email'    => 'required|email|unique:user',          // ganti dari 'users'
            'role'     => 'required|in:Admin,Super Admin',
            'password' => 'required|string|min:6',
        ]);

        $validated['password'] = Hash::make($validated['password']);

        $user = User::create($validated);

        return response()->json($user, 201);
    }

    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $validated = $request->validate([
            'username' => 'required|string|max:255|unique:user,username,' . $id, // ganti dari 'users'
            'email'    => 'required|email|max:255|unique:user,email,' . $id,     // ganti dari 'users'
        ]);

        $user->update($validated);

        return response()->json($user);
    }

    public function destroy(Request $request)
    {
        $ids = $request->input('ids', []);
        if (!empty($ids)) {
            User::whereIn('id', $ids)->delete();
            return response()->json(['message' => 'Users deleted'], 200);
        }
        return response()->json(['message' => 'No IDs provided'], 400);
    }
}
