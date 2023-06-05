<?php

namespace App\Http\Controllers;

use App\Http\Resources\JournalResource;
use App\Models\Journal;
use App\Models\Ledger;
use App\Traits\HttpResponses;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class JournalController extends Controller
{

    use HttpResponses;

    public function __construct()
    {
        $this->middleware('auth:api');
    }

    /**
     * Display a listing of the resource.
     */
    public function index(): \Illuminate\Http\JsonResponse
    {
        return $this->success(JournalResource::collection(Journal::latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'expenditure_id' => 'required|integer',
            'chart_of_account_id' => 'required|integer',
            'debit_account_id' => 'required|integer',
            'credit_account_id' => 'required|integer',
            'ledgers' => 'required|array'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $journal = Journal::create($request->except('ledgers'));

        foreach ($request->ledgers as $ledger) {
            Ledger::create([
                'journal_id' => $journal->id,
                'account_id' => $ledger['account_id'],
                'amount' => $ledger['amount'],
                'type' => $ledger['type'],
                'post_date' => Carbon::now()
            ]);
        }

        return $this->success(new JournalResource($journal), 'Journal has been stored successfully', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Journal $journal): \Illuminate\Http\JsonResponse
    {
        return $this->success(new JournalResource($journal));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Journal $journal)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Journal $journal)
    {
        //
    }
}
