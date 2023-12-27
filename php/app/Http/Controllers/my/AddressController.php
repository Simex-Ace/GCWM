<?php

namespace App\Http\Controllers\my;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class AddressController extends Controller
{
    public function index(Request $request)
    {
        $user = $request['user_id'];
        $data = DB::table('address')->where('user_id', $user)->get();
        if ($data->isEmpty()) {
            return $data = [
                'msg' => "用户不存在"
            ];
        }
        $data = json_encode($data);
        return $data;
    }
    //详情页面
    public function add(Request $request)
    {
        $address = json_decode($request['address']);
        if ($address->status === 1) {
            DB::table('address')->update([
                'status' => '0'
            ]);
        }
        $data = DB::table('address')->insert([
            'name' => $address->name,
            'phone' => $address->phone,
            'address' => $address->address,
            'status' => $address->status,
            'user_id' => $address->user_id
        ]);
        return $data;
    }
    public function save(Request $request)
    {
        $address = json_decode($request['address']);
        $data = DB::table('address')->where('address_id', $address->address_id)->update([
            'name' => $address->name,
            'phone' => $address->phone,
            'address' => $address->address,
        ]);
        return 1;

    }
    public function delete(Request $request)
    {
        $address = json_decode($request['address']);
        $data = DB::table('address')->where('address_id', $address->address_id)->delete();
        // return $address->id;
    }
    public function status(Request $request)
    {
        $address = json_decode($request['address']);
        $id = $request['id'];

        DB::table('address')->where('user_id', $id)->where('address_id', $address->address_id)->update([
            'status' => '1'
        ]);
        DB::table('address')->where('user_id', $id)->where('address_id', '!=', $address->address_id)->update([
            'status' => '0'
        ]);
        // return $address->id;
    }
    public function defaultAddress(Request $request)
    {
        $user = $request['user_id'];
        $data = DB::table('address')->where('user_id',$user)->where('status', '1')->get();
        $data = json_encode($data);
        return $data;
    }
    public function getaddress(Request $request)
    {
        $address_id = $request['address_id'];
        $user = $request['user_id'];
        $data = DB::table('address')->where('address_id',$address_id)->count();
        if($data>0){
            $data = DB::table('address')->where('address_id',$address_id)->get();
        }else{
        $data = DB::table('address')->where('user_id',$user)->where('status', '1')->get();
        }
        $data = json_encode($data);
        return $data;
    }

    //详情页面

}





