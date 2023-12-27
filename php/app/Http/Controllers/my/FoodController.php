<?php

namespace App\Http\Controllers\my;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
class FoodController extends Controller
{
    public function index(Request $request)
    {
        $data1=DB::table('style')->where('food_id',1)->get();
        $data2=DB::table('size')->get();
        foreach($data1 as $k1=>$v1){
            $sizes=[];
            foreach($data2 as $k2=>$v2){
                if($v1->style_id==$v2->style_id)
                {
                    $sizes[]=$v2;
                }
            }
            $v1->sizes=$sizes;
        }
        $data1=json_encode($data1);

        return $data1;
    }
 //详情页面
    public function add(Request $request)
    {
    $address=json_decode($request['address']);
    if($address->status===1){
        DB::table('address')->update([
            'status' => '0'
        ]);
    }
    $data=DB::table('address')->insert([
        'name'=> $address->name,
        'phone'=> $address->phone,
        'address'=> $address->address,
        'status'=> $address->status,
    ]);
    }

    public function delete(Request $request)
    {
        $address=json_decode($request['address']);
        $data=DB::table('address')->where('id',$address->id)->delete();
        return $address->id;
    }
    public function status(Request $request)
    {
        $address=json_decode($request['address']);
        
        DB::table('address')->where('id',$address->id)->update([
            'status' => '1'
        ]);
        DB::table('address')->where('id','!=',$address->id)->update([
            'status' => '0'
        ]);
        return $address->id;
    }
    public function defaultAddress(Request $request)
    {
        $data=DB::table('address')->where('status','1')->get();
        $data=json_encode($data);
        return $data;
    }
    
 //详情页面

}





