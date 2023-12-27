<?php

namespace App\Http\Controllers\my;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
class RecordController extends Controller
{

    public function index(Request $request){
        $id=json_decode($request['id']);
        $data=DB::table('record')->where('user_id',$id)->get();
        $data2=DB::table('shop')->get();
        foreach($data as $k=>$v){
            $shop=[];
            foreach($data2 as $k2=>$v2){
                if($v2->shop_id==$v->shop_id){
                    $shop[]=$v2;
                    $v->shop=$shop;
                }
            }
        }
        return json_encode($data);
    }
    public function num(Request $request){
        $id=json_decode($request['id']);
        $data=DB::table('record')->where('user_id',$id)->count();
        return json_encode($data);
    }



    public function add(Request $request){

        $record=json_decode($request['record']);
        $data=DB::table('record')->where('user_id',$record->user_id)->where('shop_id',$record->shop_id)->get();
        if($data!=null){
            DB::table('record')->where('user_id',$record->user_id)->where('shop_id',$record->shop_id)->delete();
        }
        DB::table('record')->insert([
            'shop_id' => $record->shop_id,
            'scan_time' => $record->scan_time,
            'user_id' => $record->user_id,
        ]);
        return "ok";

    }
    public function del(Request $request){
        $id=json_decode($request['id']);
        DB::table('record')->where('id',$id)->delete();
        return "ok";

    }
    public function del_all(Request $request){
        $id=json_decode($request['id']);
        $data=DB::table('record')->where('user_id',$id)->delete();
        $data=DB::table('record')->get();
        return json_encode($data);

    }
}