<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['prefix'=>'address'],function (){
    //在Api文件下的控制器
        Route::post('','my\AddressController@index');
        Route::post('get','my\AddressController@getaddress');
        Route::post('add','my\AddressController@add');
        Route::post('save','my\AddressController@save');
        Route::post('delete','my\AddressController@delete');
        Route::post('status','my\AddressController@status');
        Route::post('defaultAddress','my\AddressController@defaultAddress');
    });
Route::group(['prefix'=>'shop'],function (){
    //在Api文件下的控制器
        Route::get('','my\ShopController@index');
        Route::post('search','my\ShopController@search');
        Route::post('get','my\ShopController@get');
        Route::post('save','my\ShopController@save');
        Route::post('add','my\ShopController@add');
        Route::post('delete','my\ShopController@delete');
        Route::post('status','my\ShopController@status');
        Route::get('defaultAddress','my\ShopController@defaultAddress');
    });
Route::group(['prefix'=>'score'],function (){
    //在Api文件下的控制器
        Route::post('','my\ScoreController@index');
        Route::post('add','my\ScoreController@add');
        Route::post('save','my\ScoreController@save');
        Route::post('delete','my\ScoreController@delete');
        Route::post('status','my\ScoreController@status');
        Route::get('defaultAddress','my\ScoreController@defaultAddress');
    });
Route::group(['prefix'=>'category'],function (){
    //在Api文件下的控制器
        Route::post('','my\CategoryController@index');
        Route::post('shop','my\CategoryController@shop');
        Route::post('style','my\CategoryController@style');
        Route::post('add','my\CategoryController@add');
        Route::post('save','my\CategoryController@save');
        Route::post('delete','my\CategoryController@delete');
        Route::post('status','my\CategoryController@status');
        Route::get('defaultAddress','my\CategoryController@defaultAddress');
        Route::post('getcollect','my\CategoryController@getcollect');
        Route::post('setcollect','my\CategoryController@setcollect');
        Route::post('collect','my\CategoryController@collect');
    });
Route::group(['prefix'=>'food'],function (){
    //在Api文件下的控制器
        Route::get('','my\FoodController@index');
        Route::post('add','my\FoodController@add');
        Route::post('save','my\FoodController@save');
        Route::post('delete','my\FoodController@delete');
        Route::post('status','my\FoodController@status');
        Route::get('defaultAddress','my\FoodController@defaultAddress');
    });
Route::group(['prefix'=>'order'],function (){
    //在Api文件下的控制器
        Route::post('','my\OrderController@payindex');
        Route::post('pay','my\OrderController@index');
        Route::post('return','my\OrderController@return');
        Route::post('notify','my\OrderController@notify');
        Route::post('surepay','my\OrderController@surepay');
        Route::post('status','my\OrderController@status');
        Route::post('shop','my\OrderController@shop');
        Route::post('getDetail','my\OrderController@get_order_detail');
    });
Route::group(['prefix'=>'record'],function (){
    //在Api文件下的控制器
        Route::post('','my\RecordController@index');
        Route::post('num','my\RecordController@num');
        Route::post('del_all','my\RecordController@del_all');
        Route::post('del','my\RecordController@del');
        Route::post('add','my\RecordController@add');
    });
Route::group(['prefix'=>'user'],function (){
    //在Api文件下的控制器
        Route::get('','my\UserController@index');
        Route::post('shoper','my\UserController@shoper');
        Route::post('save','my\UserController@save');
        Route::get('myscore','my\UserController@Myscore');
        Route::get('del_all','my\UserController@del_all');
        Route::post('del','my\UserController@del');
        Route::post('sign','my\UserController@sign');
        Route::post('Ssign','my\UserController@Ssign');
        Route::post('collectnum','my\UserController@collectnum');
    });

    