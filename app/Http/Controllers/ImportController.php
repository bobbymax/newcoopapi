<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\BudgetHead;
use App\Models\Category;
use App\Models\ChartOfAccount;
use App\Models\Contribution;
use App\Models\Expenditure;
use App\Models\Fund;
use App\Models\Journal;
use App\Models\Ledger;
use App\Models\Module;
use App\Models\Role;
use App\Models\SubBudgetHead;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Wallet;
use App\Traits\HttpResponses;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ImportController extends Controller
{
    use HttpResponses;

    protected $parent, $result;
    protected $data = [];

    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function handle(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'data' => 'required|array',
            'type' => 'required|string|max:255'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $this->result = match ($request->type) {
            'budget-heads' => $this->loadBudgetHeads($request->data),
            'sub-budget-heads' => $this->loadSubHeads($request->data),
            'categories' => $this->loadCategories($request->data),
            'members' => $this->loadMembers($request->data),
            'contributions' => $this->loadContributions($request->data),
            'modules' => $this->loadModules($request->data)
        };

        return $this->success($this->result, 'Data imported successfully!');
    }

    protected function loadModules(array $data)
    {
        $role = Role::where('label', 'super-administrator')->first();
        foreach($data as $obj) {
            $module = Module::where('code', $obj['CODE'])->first();
            $parent = $obj['PARENT'] !== 'none' ? $this->getModule($obj['PARENT']) : null;

            if (! $module) {
                $module = Module::create([
                    'name' => $obj['NAME'],
                    'label' => Str::slug($obj['NAME']),
                    'icon' => $obj['ICON'],
                    'url' => $obj['URL'],
                    'code' => $obj['CODE'],
                    'type' => $obj['TYPE'],
                    'parentId' => $parent !== null ? $parent->id : 0
                ]);
            }

            if (! in_array($role->id, $module?->roles->pluck('id')->toArray())) {
                $module?->roles()->save($role);
            }


            $this->data[] = $module;
        }

        return $this->data;
    }

    private function getModule($code) {
        return Module::where('label', $code)->first();
    }

    protected function loadBudgetHeads(array $data): array
    {
        foreach($data as $obj) {
            $label = Str::slug($obj['NAME']);
            $budgetHead = BudgetHead::where('label', $label)->first();

            if (!$budgetHead) {
                $budgetHead = BudgetHead::create([
                    'name' => $obj['NAME'],
                    'label' => $label
                ]);
            }

            $this->data[] = $budgetHead;
        }

        return $this->data;
    }

    protected function loadSubHeads(array $data): array
    {
        foreach ($data as $value)
        {
            $label = Str::slug($value['HEAD']);
            $budgetHead = BudgetHead::where('label', $label)->first();
            $category = Category::where('label', $value['CATEGORY'])->first();
            $subBudgetHead = SubBudgetHead::where('code', $value['CODE'])->first();

            if (!$subBudgetHead && $category && $budgetHead) {
                $subBudgetHead = SubBudgetHead::create([
                    'budget_head_id' => $budgetHead->id,
                    'category_id' => $category->id,
                    'name' => $value['NAME'],
                    'code' => $value['CODE'],
                    'type' => $value['TYPE'],
                    'group' => $value['GROUP']
                ]);

                if ($subBudgetHead) {
                    Fund::create([
                        'sub_budget_head_id' => $subBudgetHead->id,
                        'approved_amount' => $value['AMOUNT'],
                        'booked_balance' => $value['AMOUNT'],
                        'actual_balance' => $value['AMOUNT'],
                        'year' => $value['YEAR']
                    ]);
                }

                $this->data[] = $subBudgetHead;
            }
        }

        return $this->data;
    }

    protected function loadCategories(array $data): array
    {
        foreach($data as $obj) {
            $label = Str::slug($obj['NAME']);
            $category = Category::where('label', $label)->first();

            if (!$category) {
                $category = Category::create([
                    'name' => $obj['NAME'],
                    'label' => $label
                ]);
            }

            $this->data[] = $category;
        }

        return $this->data;
    }

    private function checkAndAddRole() {
        $role = Role::where('label', 'member')->first();

        if (! $role) {
            Role::create([
                'name' => 'Member',
                'label' => 'member',
                'slot' => 1000
            ]);
        }

        return $role;
    }

    protected function loadMembers(array $data): array
    {
        $role = $this->checkAndAddRole();

        foreach ($data as $value)
        {
            $member = User::where('membership_no', $value['MEMID'])->first();

            $email = $value['EMAIL'] ?? Str::slug($value['FIRSTNAME']) . "." . Str::slug($value['SURNAME']) . "@ncdmb.gov.ng";

            if (!$member) {
                $member = User::create([
                    'membership_no' => $value['MEMID'],
                    'firstname' => $value['FIRSTNAME'],
                    'middlename' => $value['MIDDLENAME'] ?? "",
                    'surname' => $value['SURNAME'],
                    'contribution_fee' => $value['CONTRIBUTION'],
                    'email' => $value['EMAIL'],
                    'mobile' => Str::random(11),
                    'password' => Hash::make('Password1')
                ]);

                if ($member && $role) {

                    Wallet::create([
                        'user_id' => $member->id,
                        'savings' => $value['SAVINGS'],
                    ]);

                    Contribution::create([
                        'user_id' => $member->id,
                        'fee' => $member->contribution_fee,
                        'month' => $value['MONTH'],
                        'current' => true
                    ]);

                    $member->roles()->save($role);
                }

                $this->data[] = $member;
            }
        }

        return $this->data;
    }

    protected function loadContributions(array $data): array
    {
        foreach($data as $value)
        {
            $member = User::where('membership_no', $value['MEMID'])->first();

            if ($member)
            {
                $contribution = Contribution::create([
                    'user_id' => $member->id,
                    'fee' => $value['FEE'],
                    'month' => $value['MONTH'],
                    'current' => false
                ]);
            }

            $this->data[] = $member;
        }

        return $this->data;
    }
}
