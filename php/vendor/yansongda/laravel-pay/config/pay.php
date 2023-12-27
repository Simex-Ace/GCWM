<?php

return [
    'alipay' => [
        // 支付宝分配的 APPID
        // 'app_id' => env('ALI_APP_ID', '9021000131622823'),

        // 支付宝异步通知地址
        // 'notify_url' => 'http://15ba50bf.r7.vip.cpolar.cn/order/notify',

        // 支付成功后同步通知地址
        // 'return_url' => 'http://15ba50bf.r7.vip.cpolar.cn/order/return',

        // 阿里公共密钥，验证签名时使用
        // 'ali_public_key' => env('ALI_PUBLIC_KEY', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArsxUZyYI102Ko/3A+XXer06h6um8YpYBiRZ55ZNmek4H30Hq5S1tsGIBJeXAxwrcjf1j3/sgg6Vj/f0DxPty8skx17IlA9ZG4NjJsm0tOXJhSsREs54MhQH34eq69P6yIe/a4o+dDWWbhqbfOt3Dv+A77XU1sMSoGa5cEPDpNIiZsSCd5rz+shvn2wgvZwujIAtSaf/ENPwa2x//uP6P5ksARSh3alf71OcjN4q0vgSaM7BvAJrNhnkt8Fu9swX5dRI03hTEZR4kYdgXPTLGwFEkpFw0Bl+gLmDHUyXBjiJaFYsttqcrS9ca1VAqjRMkKXjMTQnS6zcCuri67y4uwQIDAQAB'),

        // 自己的私钥，签名时使用
        // 'private_key' => env('ALI_PRIVATE_KEY', 'MIIEogIBAAKCAQEAhM3gVO24zsy+lxD+FA+KgoKF3lbHMyV/sabZERJq5CDHAsqayYkgYcvNRZPT0vTACosYkR0pQ422iPcyn/wNlbLyMl7LfdSKAVX0WpeHOXJTWglM/pkiz7iBDDs0oTsozc+wWwAiZ6W1RlEWb02P7mDIWJrM52wEXjD7jbbu1m5CBWrPKwOGQQpE4GyjhYjaTkO9LMW5pNpohTKslkV2uLuKwVJ1tSAxVg+zAvs3V/9rotKNceHcs6T1q5JlB127xVfNWlQW1oBPG3M2Edd0+kaZpJGsUGD0EsGad4yVZSXsKjnmkmcr5ltVjB8r7Oetxus0Bljf78C6BhUngDnncwIDAQABAoIBADsVcRm3zYHL23tQJwn7xA6+TRqXFvatVztNVMNgo0etQXz/cI/7Pvnjdwbedt4i35GRQrPE+ofAc5ZKDC7bL5wLSe+Y9wWbWm6vtA/d3F51e5nSC3w12yP5HQi5Cng03rl6DibeT3A3bAfFqaqJImDWlCu/aywGhYb2WeQ5n9ar+UaTl/JBlOjiW00Mj3kIsQH9SwzXdJXlfOHVDydbkzOgiC/bg6vP2BzcSUtcLn72SeU4yQ3DgkKJ7n67z3MdHcGbKxxP5JJDAfMqsUx7mm30oSeoNDZ0DoUr6LNW2dfgUjakOCUz9jqvS45dz8GhuEDd6HCNjPNN4R5Kvrl58xkCgYEA+njdZIgslmOdzjfSBdQtjrGmTvgevosJ6OLdzVYRIUWEaStMaOiRNAOcdTtcbH8yeh9naNoWrkdfudtyXDRFn6RvHd70PhuoAXfdMANKcIQVuq2dW41MXNcAPhG4Nak0JRM37uh1YdAzH8X76YlL/5VyPUDpsn88T+aeiMYhZjUCgYEAh7wz8XbCVCfHlM5FiF6e6QF8gUQXiZJYq5xPFg1ezElK/klrmG8knq85uMqZ8DIqc8UNXptRfVZuyhICCkqhL2l3y0Z9+xN5d9Nchx0A8PTOuf+FQfq8HUkG6KpsXSV87pU3ls6wJVu5wT+CjFSvx2wGeCioYkd2lQ5Mr7SjLAcCgYBBTM17bj0hoCr+HnN07ZJLB2myYOGzD5Cv1KW66NtibztMJ+ut1iQ1CVP7BFTePHMuf414OpN7MER2sg2omEAmlLobcYr/vjoY1+UkpVb86pK3rpe9zKLB+ZOomvoJk2ly2QXWFWi07ZDGkdlRU2gq5A16hrfmv2E7+4YNZopCmQKBgAY/osCF8BJBto1iJY9Ok9A0MlAdG1xI8W4NBxMD0I5k/V/Rb3OYAj6P4H9iTE3jcVLdCm2Fhu3XMch5pcBliSAOoeYou5n4Xoomn8bUjfuJuY6UdcUAzvImL3w8hDqRhDvTgLifkTpXC6kazF67c1Ah5/ZWINJNaecYvm0EStK3AoGADs/8e0flDyfUEqEk4FNsv5eG8Dj4Tlu4HZkYJt4BjdSFBtBXO+riOTL4N12PQFTMu/DSWURoPorzOcz1SayhidxtlY5rNd6YktRfS3oCqDSJM1cKkXLsInzQ1WpmIxlT9DDCJB3BU/pTFNYjV/KJNgyQd6EsbSLisG24vyZdRfg='),

        // 使用公钥证书模式，请配置下面两个参数，同时修改 ali_public_key 为以 .crt 结尾的支付宝公钥证书路径，如（./cert/alipayCertPublicKey_RSA2.crt）
        // 应用公钥证书路径
        // 'app_cert_public_key' => 'G:\Desktop\work\kdst\php\storage\cert\appPublicCert.crt',

        // 支付宝根证书路径
        // 'alipay_root_cert' => 'G:\Desktop\work\kdst\php\storage\cert\alipayRootCert.crt',

        // optional，默认 warning；日志路径为：sys_get_temp_dir().'/logs/yansongda.pay.log'
        // 'log' => [
        //     'file' => storage_path('logs/alipay.log'),
        //  'level' => 'debug',
        //  'type' => 'single', // optional, 可选 daily.
        //  'max_file' => 30,
        // ],

        // optional，设置此参数，将进入沙箱模式
        // 'mode' => 'dev',
    ],

    'wechat' => [
        // 公众号 APPID
        'app_id' => env('WECHAT_APP_ID', ''),

        // 小程序 APPID
        'miniapp_id' => env('WECHAT_MINIAPP_ID', ''),

        // APP 引用的 appid
        'appid' => env('WECHAT_APPID', ''),

        // 微信支付分配的微信商户号
        'mch_id' => env('WECHAT_MCH_ID', ''),

        // 微信支付异步通知地址
        'notify_url' => '',

        // 微信支付签名秘钥
        'key' => env('WECHAT_KEY', ''),

        // 客户端证书路径，退款、红包等需要用到。请填写绝对路径，linux 请确保权限问题。pem 格式。
        'cert_client' => '',

        // 客户端秘钥路径，退款、红包等需要用到。请填写绝对路径，linux 请确保权限问题。pem 格式。
        'cert_key' => '',

        // optional，默认 warning；日志路径为：sys_get_temp_dir().'/logs/yansongda.pay.log'
        'log' => [
            'file' => storage_path('logs/wechat.log'),
        //  'level' => 'debug'
        //  'type' => 'single', // optional, 可选 daily.
        //  'max_file' => 30,
        ],

        // optional
        // 'dev' 时为沙箱模式
        // 'hk' 时为东南亚节点
        // 'mode' => 'dev',
    ],
];
