<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


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

    Route::patch('set/default/accounts/{account}', 'AccountController@makeAccountDefault');
    Route::patch('act/awards/{award}', 'AwardController@acceptOrDenyAward');
    Route::patch('end/awards/{award}', 'AwardController@endContract');
    Route::patch('verify/members/{member}', 'MemberController@verifyUser');

    Route::get('fetch/expenditures/{expenditure}', 'ExpenditureController@fetchByCode');
    Route::get('retrieve/owner', 'OrganizationController@owner');
    Route::patch('add/role/members/{member}', 'MemberController@addRoleToMember');
    Route::get('collect/all/deposits', 'DepositController@fetchAll');
    Route::get('tickets/all', 'AirTicketController@getPendingTickets');
    Route::get('members/accounts/{member}', 'AccountController@fetchMemberAccounts');


    Route::apiResource('airplanes', 'AirplaneController');
    Route::apiResource('airTickets', 'AirTicketController');
    Route::apiResource('passengers', 'PassengerController');
    Route::apiResource('purchaseOptions', 'PurchaseOptionController');
    Route::apiResource('accountCodes', 'AccountCodeController');
    Route::apiResource('organizations', 'OrganizationController');
    Route::apiResource('journals', 'JournalController');
    Route::apiResource('ledgers', 'LedgerController');
    Route::apiResource('projects', 'ProjectController');
    Route::apiResource('awards', 'AwardController');
    Route::apiResource('chartOfAccounts', 'ChartOfAccountController');
    Route::apiResource('accounts', 'AccountController');
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
    Route::apiResource('electronics', 'ElectronicController');
    Route::apiResource('liquidations', 'LiquidationController');

    Route::apiResource('roles', 'RoleController');
    Route::apiResource('modules', 'ModuleController');
    Route::apiResource('settings', 'SettingController');
});


