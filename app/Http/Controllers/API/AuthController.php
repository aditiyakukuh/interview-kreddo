<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\API\Auth\RegisterRequest;
use App\Http\Requests\API\Auth\LoginRequest;
use App\Models\User;
use App\Http\Resources\API\User\UserResource;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        try {
            $data = $request->validated();

            $user = User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
            ]);

            $token = $user->createToken('auth_token')->plainTextToken;
            Log::info('User registered successfully', ['user_id' => $user->id]);
            return (new UserResource($user))->additional([
                'token' => $token
            ]);
        } catch (\Exception $e) {
            Log::error('Error registering user', ['error' => $e->getMessage()]);
            return response()->json([
               $e->getMessage()
            ], 401);
        }
    }

    public function login(LoginRequest $request)
    {
        try {
            $credential = $request->validated();
            if (auth()->attempt($credential)) {
                $user = auth()->user();
                Log::info('Login successful', [
                    'user_id' => auth()->user()->id,
                    'email' => auth()->user()->email,
                ]);
                return (new UserResource($user))->additional([
                    'token' => $user->createToken('auth_token')->plainTextToken
                ]);
            }
            return response()->json([
                'message' => 'credential is not match'
            ], 401);
        } catch (\Exception $e) {
            
            $error = Log::error('Error during login', [
                'error' => $e->getMessage(),
                'line' => __LINE__,
                'file' => __FILE__,
            ]);
            return response()->json($error, 401);
        }
    }

    public function profile()
    {
        try {
            $user = Auth::guard('sanctum')->user();
            Log::info('Profile accessed for user: '.$user->id);
            return new UserResource($user);
        } catch (AuthorizationException $e) {
            Log::error('Authorization failed while accessing profile');
            return response()->json(['message' => 'Unauthorized'], 401);
        }
    }

    public function logout()
    {
        auth()->user()->tokens()->delete();

        return [
            'message' => 'You have successfully logged out and the token was successfully deleted'
        ];
    }
}
