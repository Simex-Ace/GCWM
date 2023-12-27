<?php

namespace App\Http\Controllers\my;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class ScoreController extends Controller
{
    public function index(Request $request)
    {
        $shop = json_decode($request['shop_id']);
        $data1 = DB::table('score')->where('shop_id', $shop)->get();
        $data2 = DB::table('users')->get();
        foreach ($data1 as $k1 => $v1) {
            foreach ($data2 as $k2 => $v2) {
                if ($v1->user_id == $v2->user_id) {
                    $v1->user = $v2;
                }
            }
        }
        $data = json_encode($data1);
        return $data;
    }
    public function add(Request $request)
    {
        $score = json_decode($request['score']);
        $data = DB::table('score')->insert([
            'message' => $score->message,
            'img1' => $score->img1,
            'img2' => $score->img2,
            'img3' => $score->img3,
            'score' => $score->score,
            'time' => $score->time,
            'user_id' => $score->user_id,
            'shop_id' => $score->shop_id,
            'order_on' => $score->order_on,
        ]);
        $data = json_encode($data);
        return $data;
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
// 原始时间字符串


