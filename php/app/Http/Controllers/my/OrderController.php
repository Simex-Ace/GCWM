<?php

namespace App\Http\Controllers\my;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

use Yansongda\Pay\Pay;
use Yansongda\Pay\Log;

class OrderController extends Controller
{
    protected $config = [
        'app_id' => '9021000131622823',
        'notify_url' => 'https://7b7e477b.r19.cpolar.top/order/notify',
        'return_url' => 'https://7b7e477b.r19.cpolar.top/order/return',
        'ali_public_key' => 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArsxUZyYI102Ko/3A+XXer06h6um8YpYBiRZ55ZNmek4H30Hq5S1tsGIBJeXAxwrcjf1j3/sgg6Vj/f0DxPty8skx17IlA9ZG4NjJsm0tOXJhSsREs54MhQH34eq69P6yIe/a4o+dDWWbhqbfOt3Dv+A77XU1sMSoGa5cEPDpNIiZsSCd5rz+shvn2wgvZwujIAtSaf/ENPwa2x//uP6P5ksARSh3alf71OcjN4q0vgSaM7BvAJrNhnkt8Fu9swX5dRI03hTEZR4kYdgXPTLGwFEkpFw0Bl+gLmDHUyXBjiJaFYsttqcrS9ca1VAqjRMkKXjMTQnS6zcCuri67y4uwQIDAQAB',
        // 加密方式： **RSA2**  
        'private_key' => 'MIIEogIBAAKCAQEAhM3gVO24zsy+lxD+FA+KgoKF3lbHMyV/sabZERJq5CDHAsqayYkgYcvNRZPT0vTACosYkR0pQ422iPcyn/wNlbLyMl7LfdSKAVX0WpeHOXJTWglM/pkiz7iBDDs0oTsozc+wWwAiZ6W1RlEWb02P7mDIWJrM52wEXjD7jbbu1m5CBWrPKwOGQQpE4GyjhYjaTkO9LMW5pNpohTKslkV2uLuKwVJ1tSAxVg+zAvs3V/9rotKNceHcs6T1q5JlB127xVfNWlQW1oBPG3M2Edd0+kaZpJGsUGD0EsGad4yVZSXsKjnmkmcr5ltVjB8r7Oetxus0Bljf78C6BhUngDnncwIDAQABAoIBADsVcRm3zYHL23tQJwn7xA6+TRqXFvatVztNVMNgo0etQXz/cI/7Pvnjdwbedt4i35GRQrPE+ofAc5ZKDC7bL5wLSe+Y9wWbWm6vtA/d3F51e5nSC3w12yP5HQi5Cng03rl6DibeT3A3bAfFqaqJImDWlCu/aywGhYb2WeQ5n9ar+UaTl/JBlOjiW00Mj3kIsQH9SwzXdJXlfOHVDydbkzOgiC/bg6vP2BzcSUtcLn72SeU4yQ3DgkKJ7n67z3MdHcGbKxxP5JJDAfMqsUx7mm30oSeoNDZ0DoUr6LNW2dfgUjakOCUz9jqvS45dz8GhuEDd6HCNjPNN4R5Kvrl58xkCgYEA+njdZIgslmOdzjfSBdQtjrGmTvgevosJ6OLdzVYRIUWEaStMaOiRNAOcdTtcbH8yeh9naNoWrkdfudtyXDRFn6RvHd70PhuoAXfdMANKcIQVuq2dW41MXNcAPhG4Nak0JRM37uh1YdAzH8X76YlL/5VyPUDpsn88T+aeiMYhZjUCgYEAh7wz8XbCVCfHlM5FiF6e6QF8gUQXiZJYq5xPFg1ezElK/klrmG8knq85uMqZ8DIqc8UNXptRfVZuyhICCkqhL2l3y0Z9+xN5d9Nchx0A8PTOuf+FQfq8HUkG6KpsXSV87pU3ls6wJVu5wT+CjFSvx2wGeCioYkd2lQ5Mr7SjLAcCgYBBTM17bj0hoCr+HnN07ZJLB2myYOGzD5Cv1KW66NtibztMJ+ut1iQ1CVP7BFTePHMuf414OpN7MER2sg2omEAmlLobcYr/vjoY1+UkpVb86pK3rpe9zKLB+ZOomvoJk2ly2QXWFWi07ZDGkdlRU2gq5A16hrfmv2E7+4YNZopCmQKBgAY/osCF8BJBto1iJY9Ok9A0MlAdG1xI8W4NBxMD0I5k/V/Rb3OYAj6P4H9iTE3jcVLdCm2Fhu3XMch5pcBliSAOoeYou5n4Xoomn8bUjfuJuY6UdcUAzvImL3w8hDqRhDvTgLifkTpXC6kazF67c1Ah5/ZWINJNaecYvm0EStK3AoGADs/8e0flDyfUEqEk4FNsv5eG8Dj4Tlu4HZkYJt4BjdSFBtBXO+riOTL4N12PQFTMu/DSWURoPorzOcz1SayhidxtlY5rNd6YktRfS3oCqDSJM1cKkXLsInzQ1WpmIxlT9DDCJB3BU/pTFNYjV/KJNgyQd6EsbSLisG24vyZdRfg=',
        'log' => [ // optional
            'file' => './logs/alipay.log',
            'level' => 'debug', // 建议生产环境等级调整为 info，开发环境为 debug
            'type' => 'single', // optional, 可选 daily.
            'max_file' => 30, // optional, 当 type 为 daily 时有效，默认 30 天
        ],
        'http' => [ // optional
            'timeout' => 5.0,
            'connect_timeout' => 5.0,
            // 更多配置项请参考 [Guzzle](https://guzzle-cn.readthedocs.io/zh_CN/latest/request-options.html)
        ],
        'mode' => 'dev', // optional,设置此参数，将进入沙箱模式
    ];

    public function index(Request $request)
    {
        $order_detail = ($request['order_detail']);
        $shop = $request['shop'];
        $total = $request['total'];
        $order = [
            'out_trade_no' => time(),
            'subject' => $shop,
            'total_amount' => $total,
            'buyer_id' => 2088722019871377,
            'body' => $order_detail,
            'notify_url' => 'https://7b7e477b.r19.cpolar.top/order/notify',
            // 'http_method'  => 'GET' // 如果想在 wap 支付时使用 GET 方式提交，请加上此参数。默认使用 POST 方式提交
        ];
        $alipay = Pay::alipay($this->config)->scan($order);
        return $alipay;
        // return $result;// laravel 框架中请直接 `return $alipay`
    }

    public function return ()
    {
        $data = Pay::alipay($this->config)->verify(); // 是的，验签就这么简单！
        // 订单号：$data->out_trade_no
        // 支付宝交易号：$data->trade_no
        // 订单总金额：$data->total_amount
        return $data;
    }

    public function notify(Request $request)
    {
        $alipay = Pay::alipay($this->config);

        try {
            $data = $alipay->verify(); // 是的，验签就这么简单！
            // 请自行对 trade_status 进行判断及其它逻辑进行判断，在支付宝的业务通知中，只有交易通知状态为 TRADE_SUCCESS 或 TRADE_FINISHED 时，支付宝才会认定为买家付款成功。
            // 1、商户需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号；
            // 2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额）；
            // 3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）；
            // 4、验证app_id是否为该商户本身。
            // 5、其它业务逻辑情况
            $order = json_decode($data['body'])[0];
            $order = DB::table('orders')->insert([
                'create_time' => $order->create_time,
                'shop_id' => $order->shop_id,
                'user_id' => $order->user_id,
                'order_no' => $order->order_no,
                'notes' => $order->notes,
                'address_id' => $order->address_id,
            ]);
            $foods = array_slice(json_decode($data['body']), 1);
            foreach ($foods as $food) {
                DB::table('order_detail')->insert([
                    'food_id' => $food->food_id,
                    'food_name' => $food->food_name,
                    'food_image' => $food->food_image,
                    'order_no' => $food->order_no,
                    'totalPrice' => $food->totalPrice,
                    'food_price' => $food->food_price,
                    'food_num' => $food->food_num,
                    'choiceSizes' => $food->choiceSizes,
                ]);
            }
            Log::debug('Alipay notify', $data->all());
        } catch (\Exception $e) {
            $e->getMessage();
        }
        return $alipay->success(); // laravel 框架中请直接 `return $alipay->success()`
    }
    //用户订单
    public function payindex(Request $request)
    {
        $id = $request['id'];
        $data1 = DB::table('orders')->where('user_id', $id)->get();
        $data2 = DB::table('order_detail')->get();
        $data3 = DB::table('shop')->get();
        foreach ($data1 as $k1 => $v1) {
            $orders = [];
            $shop = [];
            foreach ($data2 as $k2 => $v2) {
                if ($v1->order_no == $v2->order_no) {
                    $orders[] = $v2;
                }
            }
            foreach ($data3 as $k3 => $v3) {
                if ($v1->shop_id == $v3->shop_id) {
                    $shop[] = $v3;
                }
            }
            $v1->orders = $orders;
            $v1->shop = $shop;
        }
        $data1 = json_encode($data1);
        return $data1;
    }
    
    public function surepay(Request $request)
    {
        $order_on = $request['order_no'];
        $order = DB::table('orders')->where('order_no', $order_on)->count();
        if ($order > 0) {
            return "true";
        } else {
            return "false";
        }
    }
    public function shop(Request $request)
    {
        $id = $request['id'];
        $data1 = DB::table('orders')->where('shop_id', $id)->get();
        $data2 = DB::table('order_detail')->get();
        $data3 = DB::table('users')->get();
        foreach ($data1 as $k1 => $v1) {
            $orders = [];
            $user = [];
            foreach ($data2 as $k2 => $v2) {
                if ($v1->order_no == $v2->order_no) {
                    $orders[] = $v2;
                }
            }
            foreach ($data3 as $k3 => $v3) {
                if ($v1->user_id == $v3->user_id) {
                    $user[] = $v3;
                }
            }
            $v1->orders = $orders;
            $v1->user = $user;
        }
        $data1 = json_encode($data1);
        return $data1;
    }
    public function status(Request $request)
    {
        $order = $request['id'];
        $status = $request['status'];
        $order = DB::table('orders')->where('order_no', $order)->update([
            'status' => $status,
        ]);
        return $order;
    }

    public function get_order_detail(Request $request)
    {
        $order_no = $request['order'];
        $order = DB::table('order_detail')->where('order_no', $order_no)->get();
        $order = json_encode($order);
        return $order;
    }
}