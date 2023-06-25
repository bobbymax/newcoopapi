<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\User;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    use HttpResponses;

    public function __construct()
    {
        $this->middleware('auth:api')->except('login');
    }

    public function register(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'firstname' => 'required|string|max:255',
            'surname' => 'required|string|max:255',
            'membership_no' => 'required|string|max:8|unique:users',
            'staff_no' => 'required|string|max:8|unique:users',
            'mobile' => 'required|string|max:15|unique:users',
            'contribution_fee' => 'required',
            'email' => 'required|string|max:255|unique:users',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors', 500);
        }

        $password = Str::slug($request->firstname) . "." . Str::slug($request->surname);

        $user = User::create([
            'membership_no' => $request->membership_no,
            'staff_no' => $request->staff_no,
            'firstname' => $request->firstname,
            'surname' => $request->surname,
            'mobile' => $request->mobile,
            'contribution_fee' => $request->contribution_fee,
            'type' => $request->type,
            'email' => $request->email,
            'password' => Hash::make($password),
        ]);

        return $this->success(new UserResource($user), "User Created Successfully!", 201);
    }

    public function login(Request $request): \Illuminate\Http\JsonResponse
    {
        // Validate login credentials
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255',
            'password' => 'required|string',
            'device' => 'required|string'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors', 500);
        }

        // if validation passed gather login credentials
        $credentials = $request->only('email', 'password');

        if (! Auth::attempt($credentials)) {
            return $this->error(null, 'Invalid login details', 422);
        }

        $token = Auth::user()->createToken($request->device)->accessToken;

        return $this->success(['user' => new UserResource(Auth::user()), 'token' => $token], 'Login Successful');
    }

    public function logout(Request $request): \Illuminate\Http\JsonResponse
    {
        Auth::user()->tokens->each(function ($token, $key) {
            $this->revokeAccessAndRefreshTokens($token->id);
        });

        return $this->success(null, 'You have been successfully logged out!');
    }

    protected function revokeAccessAndRefreshTokens($tokenId)
    {
        $tokenRepository = app('Laravel\Passport\TokenRepository');
        $refreshTokenRepository = app('Laravel\Passport\RefreshTokenRepository');

        $tokenRepository->revokeAccessToken($tokenId);
        $refreshTokenRepository->revokeRefreshTokensByAccessTokenId($tokenId);
    }
}
