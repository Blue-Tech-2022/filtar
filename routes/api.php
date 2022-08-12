<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::group([ 'middleware' => 'api','namespace' => 'Api'], function () {

    ### Auth ###
    Route::post('login', 'AuthController@login');
    Route::post('user_register', 'AuthController@user_register');
    Route::post('provider_register', 'AuthController@provider_register');
    Route::post('insertToken', 'AuthController@insertToken');
    Route::post('logout', 'AuthController@logout');
    Route::post('updateProviderProfile', 'AuthController@updateProviderProfile');
    Route::post('updateUserProfile', 'AuthController@updateUserProfile');


    ### Governorate and City
    Route::get('countries', 'AuthController@countries');
    Route::get('governorates', 'AuthController@governorates');
    Route::get('citiesOfGovernorate', 'AuthController@citiesOfGovernorate');


    ### Contact & Setting ###
    Route::get('setting', 'SettingController@setting');
    Route::post('contactUs', 'SettingController@contactUs');
    Route::get('notifications', 'SettingController@notifications');
    Route::get('unReadNotifications', 'SettingController@unReadNotifications');
    Route::post('deleteAllNotifications', 'SettingController@deleteAllNotifications');
    Route::get('myStatitistc', 'SettingController@myStatitistc');


    #### Explanations ####
    Route::get('latestExplanation', 'ExplanationController@latestExplanation');
    Route::get('allExplanations', 'ExplanationController@allExplanations');
    Route::get('allExplanationsTags', 'ExplanationController@allExplanationsTags');
    Route::get('searchExplanations', 'ExplanationController@searchExplanations');
    Route::get('oneExplanation', 'ExplanationController@oneExplanation');



});

################################## User #################################
Route::group([ 'middleware' => 'api','namespace' => 'Api\User'], function () {

    ### Filter Data ###
    Route::post('addFilter', 'FilterController@addFilter');
    Route::post('editFilter', 'FilterController@editFilter');
    Route::get('myCleaningTimes', 'FilterController@myCleaningTimes');
    Route::get('firstCleaningTime', 'FilterController@firstCleaningTime');

    ### Products ###
    Route::post('add_product', 'ProductController@addProduct');
    Route::get('allCategories', 'ProductController@allCategories');
    Route::post('deleteProduct', 'ProductController@deleteProduct');
    Route::post('editProduct', 'ProductController@editProduct');
    Route::get('products', 'ProductController@products');
    Route::get('product_details', 'ProductController@productDetails');
    Route::get('sliders', 'ProductController@sliders');
    Route::get('latestProducts', 'ProductController@latestProducts');

    ### Orders ###
    Route::post('makeOrder', 'OrderController@makeOrder');
    Route::get('myOrders', 'OrderController@myOrders');
    Route::post('updateOrderStatus', 'OrderController@updateOrderStatus');
    Route::get('orderDetails', 'OrderController@orderDetails');

});


Route::fallback(function () {
    return response()->json(['data'=>null,'message' => 'Not Found!','status'=>404], 200);
});
