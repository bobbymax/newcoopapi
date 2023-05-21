<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\Contribution;
use App\Models\User;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class MemberController extends Controller
{
    use HttpResponses;

    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index(): \Illuminate\Http\JsonResponse
    {
        return $this->success(UserResource::collection(User::latest()->get()));
    }

    public function show(User $member): \Illuminate\Http\JsonResponse
    {
        return $this->success(new UserResource($member));
    }

    public function passwordReset(Request $request, User $member): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:8|confirmed',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors', 500);
        }

        $member->update([
            'password' => Hash::make($request->password)
        ]);

        return $this->success(new UserResource($member), 'Password has been changed successfully!');
    }

    public function update(Request $request, User $member): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'firstname' => 'required|string|max:255',
            'surname' => 'required|string|max:255',
            'staff_no' => 'required|string|max:8|unique:users',
            'mobile' => 'required|string|max:15|unique:users',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors', 500);
        }

        $member->update($request->all());
        return $this->success(new UserResource($member), 'Member data updated!!');
    }

    public function destroy(User $member): \Illuminate\Http\JsonResponse
    {
        $member->delete();
        return $this->success(null, 'Member record deleted successfully');
    }
}
