<?php

namespace App\Http\Controllers;

use App\Http\Resources\GuarantorResource;
use App\Http\Resources\LoanResource;
use App\Models\Guarantor;
use App\Models\Loan;
use App\Models\User;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class GuarantorController extends Controller
{
    use HttpResponses;

    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    /**
     * Display a listing of the resource.
     */
    public function index(): \Illuminate\Http\JsonResponse
    {
        return $this->success(GuarantorResource::collection(Guarantor::where('user_id', Auth::user()->id)->latest()->get()));
//        return $this->success(Auth::user());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'guarantors' => 'required|array',
            'loan_id' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $isGuaranteed = $this->getGuarantorNumber($request->loan_id);
        $loan = Loan::find($request->loan_id);

        if ($isGuaranteed) {
            return $this->error(null, 'You have 3 guarantors already', 403);
        }

        if (! $loan) {
            return $this->error(null, 'This loan does not exists', 422);
        }

        foreach ($request->guarantors as $user) {
            $guarantor = User::find($user['value']);

            if ($guarantor) {
                Guarantor::create([
                    'user_id' => $guarantor->id,
                    'loan_id' => $loan->id
                ]);
            }
        }

        return $this->success(new LoanResource($loan), 'Guarantors for this loan have been added!', 201);

    }

    /**
     * Display the specified resource.
     */
    public function show(Guarantor $guarantor): \Illuminate\Http\JsonResponse
    {
        return $this->success(new GuarantorResource($guarantor));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Guarantor $guarantor): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'remark' => 'required',
            'status' => 'required|string|max:255|in:approved,denied',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $guarantor->update($request->all());

        $isGuaranteed = $this->getGuarantorNumber($guarantor->loan_id);

        if ($isGuaranteed) {
            $guarantor->loan->status = "registered";
            $guarantor->loan->save();
        }

        return $this->success(new GuarantorResource($guarantor), 'Guarantor request has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Guarantor $guarantor): \Illuminate\Http\JsonResponse
    {
        if ($guarantor->status === "approved") {
            return $this->error(null, 'You cannot perform this action', 403);
        }

        $guarantor->delete();
        return $this->success(null, 'Guarantor request has been deleted successfully!');
    }

    private function getGuarantorNumber($loanId): bool
    {
        $isGuaranteed = Guarantor::where('loan_id', $loanId)->where('status', 'approved')->count();
        return $isGuaranteed == 3;
    }
}
