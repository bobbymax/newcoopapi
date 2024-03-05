<?php

namespace App\Http\Controllers;

use App\Http\Resources\FeatureResource;
use App\Models\Feature;
use App\Models\Variant;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FeatureController extends Controller
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
        return $this->success(FeatureResource::collection(Feature::latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'sub_budget_head_id' => 'required|integer',
            'frequency' => 'required|string|max:255|in:months,years',
            'commitment' => 'required',
            'max_repayment_tenor' => 'required|integer',
            'offer_limit' => 'required',
            'payable_from' => 'required|string|max:255|in:salary,upfront,special,custom',
            'variants' => 'required|array'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $feature = Feature::create($request->except('id', 'variants', 'interest_rate', 'tenor'));

        if ($feature) {
            foreach($request->variants as $val) {
                Variant::create([
                    'feature_id' => $feature->id,
                    'interest_rate' => $val['interest_rate'],
                    'tenor' => $val['tenor'],
                ]);
            }
        }

        return $this->success(new FeatureResource($feature), 'Sub Budget Head Feature has been created successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Feature $feature): \Illuminate\Http\JsonResponse
    {
        return $this->success(new FeatureResource($feature));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Feature $feature): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'sub_budget_head_id' => 'required|integer',
            'tenor' => 'required|integer',
            'frequency' => 'required|string|max:255|in:months,years',
            'interest_rate' => 'required|integer',
            'commitment' => 'required',
            'max_repayment_tenor' => 'required|integer',
            'offer_limit' => 'required',
            'payable_from' => 'required|string|max:255|in:salary,upfront,special,custom',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $feature->update($request->all());

        if ($request->has('variants')) {
            foreach ($request->variants as $obj) {
                $variant = Variant::where('interest_rate', $obj['interest_rate'])->where('tenor', $obj['tenor'])->first();

                if (! $variant) {
                    Variant::create([
                        'interest_rate' => $obj['interest_rate'],
                        'tenor' => $obj['tenor'],
                        'feature_id' => $feature->id
                    ]);
                }
            }
        }
        return $this->success(new FeatureResource($feature), 'Sub Budget Head Feature has been updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Feature $feature): \Illuminate\Http\JsonResponse
    {
        $feature->delete();
        return $this->success(null, 'Feature deleted successfully');
    }
}
