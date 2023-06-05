<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\Contribution;
use App\Models\Role;
use App\Models\User;
use App\Models\Wallet;
use App\Traits\HttpResponses;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

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

    public function store(Request $request): \Illuminate\Http\JsonResponse
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
            'middlename' => $request->middlename,
            'mobile' => $request->mobile,
            'contribution_fee' => $request->contribution_fee,
            'type' => $request->type,
            'email' => $request->email,
            'password' => Hash::make($password),
        ]);

        Contribution::create([
            'user_id' => $user->id,
            'fee' => $user->contribution_fee,
            'month' => strtolower(Carbon::now()->format('F')),
            'year' => Carbon::now()->format('Y'),
            'state' => 'active',
            'current' => true
        ]);

        Wallet::create([
            'user_id' => $user->id,
        ]);

        $role = Role::where('label', 'member')->first();

        if ($role) {
            $user->roles()->save($role);
        }

        return $this->success(new UserResource($user), "User Created Successfully!", 201);
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
            'staff_no' => 'required|string|max:8',
            'mobile' => 'required|string|max:15',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors', 500);
        }

        $member->update($request->all());
        return $this->success(new UserResource($member), 'Member data updated!!');
    }

    public function addRoleToMember(Request $request, User $member): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'role_id' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors', 500);
        }

        $role = Role::find($request->role_id);

        if (! $role) {
            return $this->error(null, 'This role does not exist', 422);
        }

        $member->roles()->save($role);
        return $this->success(new UserResource($member), 'Role added successfully!');
    }

    public function verifyUser(Request $request, User $member): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255|in:active,blocked,left',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors', 500);
        }

        $member->update([
            'status' => $request->status,
            'verified' => $request->status === "active",
            'disabled' => $request->status !== "active"
        ]);

        return $this->success(new UserResource($member), 'Member data updated!!');
    }

    public function destroy(User $member): \Illuminate\Http\JsonResponse
    {
        $member->delete();
        return $this->success(null, 'Member record deleted successfully');
    }
}
