<?php

namespace App\Http\Controllers\my;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class ShopController extends Controller
{
    public function index(Request $request) //封装树形结构
    {

        $data = DB::table('home')->inRandomOrder()->get();
        $data1 = DB::table('shop')->where('status','1')->get();
        foreach ($data as $k => $v) {
            $shop = [];
            foreach ($data1 as $k1 => $v1) {
                if ($v->shop_id == $v1->shop_id) {
                    $shop[] = $v1;
                    $v->shop = $shop;
                }
            }
        }
        $data = collect($data)->filter(function ($item) {  
            // 返回 true 表示保留该元素，false 表示过滤掉该元素  
            return property_exists($item,'shop');  
        })->all();  
        $data = json_encode($data);
        return $data;
    }

    public function get(Request $request){
        $id = $request["id"];
        $data=DB::table('shop')->where('shop_id',$id)->get();
        $data = json_encode($data);
        return $data;
    }

    public function save(Request $request)
    {
        $shop = json_decode($request['shop']);
        $id = json_decode($request['shop_id']);
        $uid = json_decode($request['user_id']);
        if ($id != '') {
            $data = DB::table('shop')->where('shop_id', $id)->update([
                'name' => $shop->name,
                'chara' => $shop->chara,
                'time' => $shop->time,
                'distance' => $shop->distance,
                'qs_fee' => $shop->qs_fee,
                'ps_fee' => $shop->ps_fee,
                'img' => $shop->img,
                'status' => '0',
                'tel' => $shop->tel,
            ]);
        return $id;
        }
        $id=DB::table('shop')->insertGetId([
            'name' => $shop->name,
            'score' => '4.0',
            'sales' => '200',
            'status' => '0',
            'chara' => $shop->chara,
            'time' => $shop->time,
            'distance' => $shop->distance,
            'qs_fee' => $shop->qs_fee,
            'ps_fee' => $shop->ps_fee,
            'img' => $shop->img,
            'tel' => $shop->tel,
        ]);
        $data = DB::table('shopers')->where('id', $uid)->update([
            'shop_id'=>$id,
        ]);
        $id = json_encode($id);
        return $id;
    }

    //详情页面
    public function search(Request $request)
    {
        $shop = $request['shop_name'];
        $data = DB::table('shop')->where('name', 'like', '%' . $shop . '%')->where('status',1)->get();
        $data2 = DB::table('food')->get();
        foreach ($data as $k => $v) {
            $shop = [];
            $data1 = DB::table('category')->where('shop_id', $v->shop_id)->get();
            foreach ($data2 as $k2 => $v2) {
                if ($data1[0]->category_id == $v2->category_id) {
                    $shop[] = $v2;
                }
            }
            $v->shop = $shop;
        }
        return json_encode($data);
    }

    public function delete(Request $request)
    {
        $address = json_decode($request['address']);
        $data = DB::table('address')->where('id', $address->id)->delete();
        return $address->id;
    }
    public function status(Request $request)
    {
        $address = json_decode($request['address']);

        DB::table('address')->where('id', $address->id)->update([
            'status' => '1'
        ]);
        DB::table('address')->where('id', '!=', $address->id)->update([
            'status' => '0'
        ]);
        return $address->id;
    }
    public function defaultAddress(Request $request)
    {
        $data = DB::table('address')->where('status', '1')->get();
        $data = json_encode($data);
        return $data;
    }

    //详情页面

}





