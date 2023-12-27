<?php

namespace App\Http\Controllers\my;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use DB;

class CategoryController extends Controller
{
    public function index(Request $request) //封装树形结构
    {
        $id = $request["id"];
        $data1 = DB::table('category')->where('shop_id', $id)->get(); //传来shop_id
        $data2 = DB::table('food')->get(); //传来shop_id
        $data3 = DB::table('shop')->where('shop_id', $id)->get();
        $data4 = DB::table('style')->get();
        foreach ($data1 as $k1 => $v1) {
            $foods = [];
            $styles = [];
            foreach ($data2 as $k2 => $v2) {
                if ($v1->category_id == $v2->category_id) {
                    foreach ($data4 as $k3 => $v3) {
                        if ($v3->food_id == $v2->food_id) {
                            $styles[] = $v3;
                            $v2->style = $styles;
                        }
                        $styles = [];
                    }
                    $foods[] = $v2;
                }
            }
            $v1->foods = $foods;
        }
        $data = [
            "foods" => $data1,
            "shop" => $data3,
        ];
        $data = json_encode($data);
        return $data;
    }
    public function shop(Request $request) //封装树形结构
    {
        $id = $request["id"];
        $shop = DB::table('shop')->where('shop_id', $id)->get();
        $data1 = DB::table('category')->where('shop_id', $id)->get(); //传来shop_id
        $data2 = DB::table('food')->get(); //传来shop_id
        $data3 = DB::table('style')->get();
        $data4 = DB::table('size')->get();
        foreach ($data1 as $k1 => $v1) {
            $foods = [];
            $styles = [];
            foreach ($data2 as $k2 => $v2) {
                if ($v1->category_id == $v2->category_id) {
                    foreach ($data3 as $k3 => $v3) {
                        if ($v3->food_id == $v2->food_id) {
                            $size = [];
                            foreach ($data4 as $k4 => $v4) {
                                if ($v3->style_id == $v4->style_id) {
                                    $size[] = $v4;
                                    $v3->sizes = $size;
                                }
                            }
                            $styles[] = $v3;
                            $v2->style = $styles;
                        }
                        // $styles = [];
                    }
                    $foods[] = $v2;
                }
            }
            $v1->foods = $foods;
        }
        $data = [
            "foods" => $data1,
            "shop" => $shop,
        ];
        $data = json_encode($data);
        return $data;
    }

    public function style(Request $request)
    {
        $id = json_decode($request["id"]);
        $data1 = DB::table('style')->where('food_id', $id)->get();
        $data2 = DB::table('size')->get();
        $data = DB::table('food')->where('food_id', $id)->get();
        foreach ($data1 as $k1 => $v1) {
            $sizes = [];
            foreach ($data2 as $k2 => $v2) {
                if ($v2->style_id == $v1->style_id) {
                    $sizes[] = $v2;
                }
            }
            $v1->sizes = $sizes;
        }
        $data1 = json_encode($data1);
        return $data1;
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
        ]);
    }
    public function save(Request $request)
    {
        $foods = json_decode($request['foods']);
        $id = $request['shop_id'];
        if (!$foods) {
            return "null";
        }
        foreach ($foods as $k1 => $v1) {
            if (!isset($v1->category_id)) {
                $categoryid = DB::table('category')->insertGetId([
                    'name' => $v1->name,
                    'shop_id' => $id,
                ]);
                $v1->category_id=$categoryid;
            } else {
                DB::table('category')->where('category_id', $v1->category_id)->update([
                    'name' => $v1->name,
                ]);
                $categoryid = $v1->category_id;
            }
            if (!isset($v1->foods)) {
                continue;
            }
            foreach ($v1->foods as $k2 => $v2) {
                if (!$v2->food_id) {
                    $foodid = DB::table('food')->insertGetId([
                        'name' => $v2->name,
                        'category_id' => $categoryid,
                        'chara' => $v2->chara,
                        'sale' => 0,
                        'score' => 0.50,
                        'price' => $v2->price,
                        'img' => $v2->img,
                    ]);
                    // return;
                    $v2->food_id = $foodid;
                } else {
                    DB::table('food')->where('food_id', $v2->food_id)->update([
                        'name' => $v2->name,
                        'chara' => $v2->chara,
                        'price' => $v2->price,
                        'img' => $v2->img,
                    ]);
                    $foodid = $v2->food_id;
                }
                if (!isset($v2->style)) {
                    continue;
                }
                foreach ($v2->style as $k3 => $v3) {
                    if (!$v3->style_id) {
                        $styleid = DB::table('style')->insertGetId([
                            'name' => $v3->name,
                            'food_id' => $foodid,
                        ]);
                        $v3->style_id = $styleid;
                    } else {
                        DB::table('style')->where('style_id', $v3->style_id)->update([
                            'name' => $v3->name,
                        ]);
                        $styleid = $v3->style_id;
                    }
                    if (!isset($v3->sizes)) {
                        continue;
                    }
                    foreach ($v3->sizes as $k4 => $v4) {
                        if (!$v4->size_id) {
                            $sizeid = DB::table('size')->insertGetId([
                                'name' => $v4->name,
                                'style_id' => $styleid,
                            ]);
                            $v4->size_id = $sizeid;
                        } else {
                            DB::table('size')->where('size_id', $v4->size_id)->update([
                                'name' => $v4->name,
                            ]);
                            $sizeid = $v4->size_id;
                        }

                    }
                    $delsize = DB::table('size')->where('style_id', $styleid)->get();
                    foreach ($delsize as $k4 => $v4) {
                        $f4 = false;
                        foreach ($v3->sizes as $k5 => $v5) {
                            if ($v5->size_id == $v4->size_id) {
                                $f4 = true;
                            }
                        }
                        if (!$f4) {
                            DB::table('size')->where('size_id', $v4->size_id)->delete();
                        }
                    }

                }
                $delstyle = DB::table('style')->where('food_id', $foodid)->get();
                foreach ($delstyle as $k4 => $v4) {
                    $f4 = false;
                    foreach ($v2->style as $k5 => $v5) {
                        if ($v5->style_id == $v4->style_id) {
                            $f4 = true;
                        }
                    }
                    if (!$f4) {
                        DB::table('style')->where('style_id', $v4->style_id)->delete();
                    }
                }
            }
            $delfood = DB::table('food')->where('category_id', $categoryid)->get();
            foreach ($delfood as $k4 => $v4) {
                $f4 = false;
                foreach ($v1->foods as $k5 => $v5) {
                    if ($v5->food_id == $v4->food_id) {
                        $f4 = true;
                    }
                }
                if (!$f4) {
                    DB::table('food')->where('food_id', $v4->food_id)->delete();
                }
            }

        }
        $delcategory = DB::table('category')->where('shop_id', $id)->get();
            foreach ($delcategory as $k4 => $v4) {
                $f4 = false;
                foreach ($foods as $k5 => $v5) {
                    if ($v5->category_id == $v4->category_id) {
                        $f4 = true;
                    }
                }
                if (!$f4) {
                    DB::table('category')->where('category_id', $v4->category_id)->delete();
                }
            }
        return "ok";
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
    public function getcollect(Request $request)
    {
        $user_id = $request['user_id'];
        $shop_id = $request['shop_id'];
        $data = DB::table('collect')->where('user_id', $user_id)->where('shop_id', $shop_id)->count();
        if ($data > 0) {
            return 1;
        }
        return 0;
    }
    public function setcollect(Request $request)
    {
        $user_id = $request['user_id'];
        $shop_id = $request['shop_id'];
        $data = DB::table('collect')->where('user_id', $user_id)->where('shop_id', $shop_id)->count();
        if ($data > 0) {
            DB::table('collect')->where('user_id', $user_id)->where('shop_id', $shop_id)->delete();
            return 0;
        }
        DB::table('collect')->insert([
            'shop_id' => $shop_id,
            'user_id' => $user_id,
        ]);
        return 1;
    }
    public function collect(Request $request)
    {
        $user_id = $request['user_id'];
        $data = DB::table('collect')->where('user_id', $user_id)->get();
        $data2 = DB::table('shop')->get();
        foreach ($data as $k => $v) {
            $shop = [];
            foreach ($data2 as $k2 => $v2) {
                if ($v2->shop_id == $v->shop_id) {
                    $shop[] = $v2;
                    $v->shop = $shop;
                }
            }
        }
        $data = json_encode($data);
        return $data;
    }



    //详情页面

}








