<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AuthApiToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next)
    {
        $token = $request->bearerToken();

        if (!$token) {
            return response()->json(['message' => 'Token tidak ditemukan'], 401);
        }

        $hashed = hash('sha256', $token);
        $user = \App\Models\User::where('api_token', $hashed)->first();

        if (!$user) {
            return response()->json(['message' => 'Token tidak valid'], 401);
        }

        $request->merge(['auth_user' => $user]);
        return $next($request);
    }

}
