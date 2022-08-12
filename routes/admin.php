<?php

use Illuminate\Support\Facades\Route;



Route::group(['prefix'=>'admin'],function (){
    Route::get('login', 'AuthController@index')->name('admin.login');
    Route::POST('login', 'AuthController@login')->name('admin.login');
});

Route::group(['prefix'=>'admin','middleware'=>'auth:admin'],function (){

    #### Home ####
    Route::get('/', 'HomeController@index')->name('adminHome');
    Route::get('searchIndex', 'HomeController@searchIndex')->name('searchIndex');


    #### Admins ####
    Route::resource('admins','AdminController');
    Route::POST('delete_admin','AdminController@delete')->name('delete_admin');
    Route::get('my_profile','AdminController@myProfile')->name('myProfile');

    #### Contact ###
    Route::group(['prefix' => 'contacts'], function () {
        Route::get('/', 'ContactUsController@index')->name('contact.index');
        Route::post('delete', 'ContactUsController@delete')->name('delete_contact');
        Route::get('show/{id}', 'ContactUsController@show')->name('contact.show');
        Route::post('contact.store', 'ContactUsController@store')->name('contact.store');
    });

    ##### Roles ####
    Route::get('roles','RolesController@index')->name('roles.index');
    Route::get('roles/create','RolesController@create')->name('roles.create');
    Route::POST('roles.delete','RolesController@delete')->name('roles.delete');
    Route::POST('roles/store','RolesController@store')->name('roles.store');
    Route::get('roles/edit/{id}','RolesController@edit')->name('roles.edit');
    Route::PUT('roles/update/{id}','RolesController@update')->name('roles.update');




    #### users ###
    Route::group(['prefix' => 'users'], function () {
        Route::get('/', 'UserController@index')->name('users.index');
        Route::post('delete', 'UserController@delete')->name('delete_user');
    });


    #### Sliders ####
    Route::resource('sliders','SlidersController');
    Route::POST('slider.delete','SlidersController@delete')->name('slider.delete');



    #### Categories ####
    Route::resource('categories','CategoryController');
    Route::POST('category.delete','CategoryController@delete')->name('category.delete');


    #### Categories ####
    Route::resource('explanations','ExplainationController');
    Route::POST('explanations.delete','ExplainationController@delete')->name('explanations.delete');

    #### Products ####
    Route::resource('products','ProductController');
    Route::POST('products.delete','ProductController@delete')->name('products.delete');
    Route::POST('productActivation','ProductController@productActivation')->name('productActivation');


    #### Product Images ####
    Route::GET('showProductImages/{id}','ProductController@showProductImages')->name('showProductImages');
    Route::POST('deleteProductImage','ProductController@deleteProductImage')->name('deleteProductImage');
    Route::POST('addProductPhoto','ProductController@addProductPhoto')->name('addProductPhoto');


    #### Provider ####
    Route::group(['prefix' => 'providers'], function () {
        Route::get('/', 'ProviderController@index')->name('provider.index');
        Route::get('show/{id}', 'ProviderController@show')->name('provider.show');
        Route::post('Activation', 'ProviderController@providerActivation')->name('providerActivation');
        Route::post('delete', 'ProviderController@delete')->name('delete_provider');
        Route::get('profile/{id}', 'ProviderController@profile')->name('providerProfile');
    });


    ### Notification ####
    Route::get('sendNotification', 'NotificationController@index')->name('sendNotification.index');
    Route::post('postNotifications.post', 'NotificationController@send')->name('postNotifications.post');


    ### Reports ###
    Route::get('reports', 'ReportController@index')->name('reports.index');
    Route::get('filtarByCountry', 'ReportController@filtarByCountry')->name('filtarByCountry');


    ### Nationalities ####
    Route::resource('nationalities', 'NationalityController');
    Route::POST('nationalityDelete','NationalityController@delete')->name('nationalities.delete');



    ### governoratesOfCountry ###
    Route::get('governoratesOfCountry/{id}', 'GovernorateController@index')->name('governoratesOfCountry');
    Route::get('governorateDelete', 'GovernorateController@delete')->name('governorate.delete');
    Route::get('governorate.create/{country_id}', 'GovernorateController@create')->name('governorate.create');
    Route::post('governorate.store', 'GovernorateController@store')->name('governorate.store');
    Route::get('governorate.edit/{id}', 'GovernorateController@edit')->name('governorate.edit');
    Route::POST('governorate.update/{id}', 'GovernorateController@update')->name('governorate.update');


    ### Orders ####
    Route::get('orders', 'OrderController@index')->name('orders.index');
    Route::get('orderDetails/{id}', 'OrderController@orderDetails')->name('orderDetails');
    Route::post('orderDelete', 'OrderController@delete')->name('orders.delete');

    ### Filter Setting ####
    Route::get('filterSetting', 'filterSettingController@index')->name('filterSetting.index');


    #### Auth ####
    Route::get('logout', 'AuthController@logout')->name('admin.logout');
});



Route::get('/clear/route', function (){
    \Artisan::call('optimize:clear');
    return 'done';
});
