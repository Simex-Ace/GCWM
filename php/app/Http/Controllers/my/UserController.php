<?php

namespace App\Http\Controllers\my;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $tel = json_decode($request['tel']);
        $pwd = $request['password'];
        $data = DB::table('users')->where('tel', $tel)->get();
        if ($data->isEmpty()) {
            return $data = [
                'msg' => "手机号未注册"
            ];
        }
        $data = DB::table('users')->where('tel', $tel)->where('password', $pwd)->get();
        if ($data->isEmpty()) {
            return $data = [
                'msg' => "密码错误",
                'pwd' => $pwd
            ];
        }
        $data = [
            'msg' => "",
            'user' => $data
        ];
        $data = json_encode($data);
        return $data;
    }
    public function shoper(Request $request)
    {
        $tel = $request['tel'];
        $pwd = $request['password'];
        $data = DB::table('shopers')->where('tel', $tel)->get();
        if ($data->isEmpty()) {
            return $data = [
                'msg' => "手机号未注册"
            ];
        }
        $data = DB::table('shopers')->where('tel', $tel)->where('password', $pwd)->get();
        if ($data->isEmpty()) {
            return $data = [
                'msg' => "密码错误",
                'pwd' => $pwd
            ];
        }
        $data = [
            'msg' => "",
            'user' => $data
        ];
        $data = json_encode($data);
        return $data;
    }

    public function save(Request $request)
    {
        $data = json_decode($request['user']);
        DB::table('users')->where('user_id',$data->user_id)->update([
            'name' => $data->name,
            'sex' => $data->sex,
            'region' => $data->region,
            'tel' => $data->tel,
            'password' => $data->password,
            'img' => $data->img,
        ]);
        $data=DB::table('users')->where('user_id',$data->user_id)->get();
        $data = json_encode($data);
        return $data;
    }

    public function sign(Request $request)
    {
        $tel = json_decode($request['tel']);
        $pwd = $request['password'];
        $data = DB::table('users')->where('tel', $tel)->get();
        if (!$data->isEmpty()) {
            return $data = [
                'msg' => "手机号已注册"
            ];
        }
        $data = DB::table('users')->insert([
            'name' => '工程新生',
            'sex' => '男',
            'region' => '广东省-广州市-天河区',
            'tel' => $tel,
            'password' => $pwd,
            'img' => 'https://gitee.com/simex1746/myfiles/raw/master/18bba20af8d2ccf32.png',
        ]);
        $data = DB::table('users')->where('tel', $tel)->get();
        $data = [
            'msg' => "",
            'user' => $data
        ];
        $data = json_encode($data);
        return $data;
    }
    public function Ssign(Request $request)
    {
        $tel = $request['tel'];
        $pwd = $request['password'];
        $data = DB::table('shopers')->where('tel', $tel)->get();
        if (!$data->isEmpty()) {
            return $data = [
                'msg' => "手机号已注册"
            ];
        }
        $data = DB::table('shopers')->insert([
            'tel' => $tel,
            'password' => $pwd,
        ]);
        $data = DB::table('shopers')->where('tel', $tel)->get();
        $data = [
            'msg' => "",
            'user' => $data,
        ];
        $data = json_encode($data);
        return $data;
    }
    //详情页面
    public function Myscore(Request $request) //安全性TODO
    {
        $user = json_decode($request['user_id']);
        $data = DB::table('score')->where('user_id', $user)->get();
        if ($data->isEmpty()) {
            return $data = [
                'msg' => "用户不存在"
            ];
        }
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
    public function collectnum(Request $request){
        $id=$request['id'];
        $data=DB::table('collect')->where('user_id',$id)->count();
        return json_encode($data);
    }
    //详情页面

}



