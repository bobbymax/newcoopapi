<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});


Route::group(['middleware' => ['json.response']], function () {
    Route::post('register', 'AuthController@register');
    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::patch('members/{member}/password-reset', 'MemberController@passwordReset');

    Route::patch('respond/loans/{loan}', 'LoanController@loanResponse');
    Route::post('configure', 'SettingController@configuration');
    Route::post('imports', 'ImportController@handle');
    Route::get('batch/expenditures', 'ExpenditureController@forBatches');
    Route::get('code/batches/{batch}', 'BatchController@fetchByCode');

    Route::get('registered/loans', 'LoanController@registeredLoans');
    Route::get('codes/loans/{loan}', 'LoanController@loansByCode');


    Route::apiResource('accountCodes', 'AccountCodeController');
    Route::apiResource('chartOfAccounts', 'ChartOfAccountController');

    Route::apiResource('members', 'MemberController');
    Route::apiResource('contributions', 'ContributionController');
    Route::apiResource('deposits', 'DepositController');
    Route::apiResource('wallets', 'WalletController');
    Route::apiResource('categories', 'CategoryController');
    Route::apiResource('budgetHeads', 'BudgetHeadController');
    Route::apiResource('subBudgetHeads', 'SubBudgetHeadController');
    Route::apiResource('funds', 'FundController');
    Route::apiResource('expenditures', 'ExpenditureController');
    Route::apiResource('batches', 'BatchController');
    Route::apiResource('features', 'FeatureController');
    Route::apiResource('variants', 'VariantController');
    Route::apiResource('guarantors', 'GuarantorController');

    Route::apiResource('loans', 'LoanController');

    Route::apiResource('roles', 'RoleController');
    Route::apiResource('modules', 'ModuleController');
    Route::apiResource('settings', 'SettingController');
});


