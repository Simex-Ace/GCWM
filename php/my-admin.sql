/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : my-admin

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 19/12/2023 17:37:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `address_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '默认地址',
  `user_id` int NOT NULL COMMENT '用户id',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1058 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '地址管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (2, '蒋嘉伦', '18818858638', '中国北京市海淀区清河中街68号103号36楼655555555', '1', 1);
INSERT INTO `address` VALUES (3, '向云', '17692014341', '中国东莞珊瑚路261号32栋222222', '0', 1);
INSERT INTO `address` VALUES (1031, '吴雄', '178776755727', '广东省渔沙坦', '1', 9);
INSERT INTO `address` VALUES (1033, '噢噢', '515544545', '广东省', '0', 10);
INSERT INTO `address` VALUES (1052, '維生', '51548989', '廣東省', '0', 1);
INSERT INTO `address` VALUES (1057, 'ace', '19171108194231', '深圳大学', '0', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `shop_id` int NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '店长推荐', 1);
INSERT INTO `category` VALUES (2, '招牌', 1);
INSERT INTO `category` VALUES (3, '畅销', 1);
INSERT INTO `category` VALUES (4, '推荐', 2);
INSERT INTO `category` VALUES (5, '小食加料', 2);
INSERT INTO `category` VALUES (6, '调料', 2);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `shop_id` int NOT NULL COMMENT '商品id',
  `user_id` int NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收藏管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (118, 1, 10);
INSERT INTO `collect` VALUES (124, 2, 1);
INSERT INTO `collect` VALUES (127, 1, 1);

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `food_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名',
  `chara` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品介绍',
  `sale` int NULL DEFAULT NULL COMMENT '销量',
  `score` float(2, 2) NULL DEFAULT NULL COMMENT '评分',
  `price` float(5, 2) NULL DEFAULT NULL COMMENT '价格',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品照片',
  `category_id` int NOT NULL COMMENT '分类id',
  PRIMARY KEY (`food_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, '文房四堡', '好吃美味', 6, 0.99, 11.99, 'https://i.postimg.cc/k5PpqLjM/F2-AFE3075-F6-B5-F6-FF1-C160346-F111-A5-B.jpg', 1);
INSERT INTO `food` VALUES (2, '薯条', '快乐小吃', 2, 0.88, 4.59, 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 1);
INSERT INTO `food` VALUES (3, '中可', '冰凉可口', 5, 0.99, 1.88, 'https://i.postimg.cc/59zpNsC6/31-CA06-B833-BE6-F430-F17-E614-AB82256-F.jpg', 1);
INSERT INTO `food` VALUES (4, '大可', '大杯冰爽', 2, 0.84, 3.89, 'https://i.postimg.cc/59zpNsC6/31-CA06-B833-BE6-F430-F17-E614-AB82256-F.jpg', 2);
INSERT INTO `food` VALUES (5, '全家福鸭血粉丝汤', '美味好吃', 47, 0.88, 16.80, 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 4);
INSERT INTO `food` VALUES (6, '招牌鸭血粉丝汤', '招牌鸭血粉丝', 15, 0.94, 14.00, 'https://i.postimg.cc/zGrFXz2m/1699060777294.jpg\r\n', 4);
INSERT INTO `food` VALUES (7, '酸菜鸭血粉丝汤', '酸爽好吃', 5, 0.78, 10.00, 'https://i.postimg.cc/wTcs2h2P/1699060782155.jpg\r\n', 4);
INSERT INTO `food` VALUES (8, '青菜', '青菜', 6, 0.90, 1.00, 'https://i.postimg.cc/bvXcvtcy/1699060793069.jpg', 5);
INSERT INTO `food` VALUES (9, '豆泡', '', 3, 0.60, 2.00, 'https://i.postimg.cc/sXctKHBx/1699060796225.jpg', 5);
INSERT INTO `food` VALUES (10, '鱼蛋', '', 5, 0.90, 2.00, 'https://i.postimg.cc/j23BYW4r/1699060801072.jpg', 5);
INSERT INTO `food` VALUES (11, '荷包蛋', '', 21, 0.90, 2.00, 'https://i.postimg.cc/c1Fpnjy5/1699060803894.jpg', 5);
INSERT INTO `food` VALUES (12, '炸腐竹', '', 2, 0.90, 2.00, 'https://i.postimg.cc/4Nnrb5X4/1699060807549.jpg', 5);
INSERT INTO `food` VALUES (13, '鱼仔烧鱼棒', '', 2, 0.80, 3.00, 'https://i.postimg.cc/0ywFhy6L/1699060810728.jpg', 5);
INSERT INTO `food` VALUES (14, '牛筋丸', '', 8, 0.90, 3.00, 'https://i.postimg.cc/TwC4nySW/1699060815798.jpg', 5);
INSERT INTO `food` VALUES (15, '香菜', '', 35, 0.60, 0.00, 'https://i.postimg.cc/3Jn27XGG/1699060823702.jpg\r\n', 6);
INSERT INTO `food` VALUES (16, '酸豆角', '', 31, 0.90, 0.00, 'https://i.postimg.cc/XJSCxxRR/1699060826905.jpg', 6);
INSERT INTO `food` VALUES (17, '葱花', '', 24, 0.90, 0.00, 'https://i.postimg.cc/pXG532NY/1699060831858.jpg', 6);
INSERT INTO `food` VALUES (18, '酱油', '', 9, 0.80, 0.00, 'https://i.postimg.cc/rw70FQwD/1699060835989.jpg', 6);

-- ----------------------------
-- Table structure for home
-- ----------------------------
DROP TABLE IF EXISTS `home`;
CREATE TABLE `home`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '展示id',
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '展示类型',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '展示图片',
  `shop_id` int NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '首页管理\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home
-- ----------------------------
INSERT INTO `home` VALUES (1, '1', 'https://preview.qiantucdn.com/58pic/28/89/55/38958PIC9GbinV549jaPf_PIC2018.jpg%21w1024_new_3072', 2);
INSERT INTO `home` VALUES (2, '1', 'https://img2.baidu.com/it/u=2369326397,3292121810&fm=253&fmt=auto&app=138&f=JPEG?w=975&h=450', 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `food_id` int NOT NULL COMMENT '商品id',
  `food_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名',
  `food_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品图片',
  `food_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `food_num` int NOT NULL COMMENT '商品数量',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `totalPrice` decimal(10, 2) NOT NULL COMMENT '商品总价',
  `choiceSizes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选择口味',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 194 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单详情管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (60, 1, '文房四堡', 'https://i.postimg.cc/k5PpqLjM/F2-AFE3075-F6-B5-F6-FF1-C160346-F111-A5-B.jpg', 11.99, 7, 'D1699091092969522827', 98.70, '香辣/中辣');
INSERT INTO `order_detail` VALUES (61, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 3, 'D1699091092969522827', 98.70, '');
INSERT INTO `order_detail` VALUES (62, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 5, 'D1699122764973881151', 23.95, '');
INSERT INTO `order_detail` VALUES (63, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 5, 'D1699122778761068131', 85.00, '');
INSERT INTO `order_detail` VALUES (64, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 4, 'D1699124245096283393', 19.36, '');
INSERT INTO `order_detail` VALUES (65, 6, '招牌鸭血粉丝汤', 'https://i.postimg.cc/zGrFXz2m/1699060777294.jpg\r\n', 14.00, 1, 'D1699124274797504412', 22.00, '');
INSERT INTO `order_detail` VALUES (66, 8, '青菜', 'https://i.postimg.cc/bvXcvtcy/1699060793069.jpg', 1.00, 1, 'D1699124274797504412', 22.00, '');
INSERT INTO `order_detail` VALUES (67, 10, '鱼蛋', 'https://i.postimg.cc/j23BYW4r/1699060801072.jpg', 2.00, 3, 'D1699124274797504412', 22.00, '');
INSERT INTO `order_detail` VALUES (68, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 4, 'D1699158557229008183', 19.36, '');
INSERT INTO `order_detail` VALUES (69, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 6, 'D1699161156081085960', 112.80, '');
INSERT INTO `order_detail` VALUES (70, 8, '青菜', 'https://i.postimg.cc/bvXcvtcy/1699060793069.jpg', 1.00, 1, 'D1699161156081085960', 112.80, '');
INSERT INTO `order_detail` VALUES (71, 9, '豆泡', 'https://i.postimg.cc/sXctKHBx/1699060796225.jpg', 2.00, 2, 'D1699161156081085960', 112.80, '');
INSERT INTO `order_detail` VALUES (72, 10, '鱼蛋', 'https://i.postimg.cc/j23BYW4r/1699060801072.jpg', 2.00, 2, 'D1699161156081085960', 112.80, '');
INSERT INTO `order_detail` VALUES (73, 11, '荷包蛋', 'https://i.postimg.cc/c1Fpnjy5/1699060803894.jpg', 2.00, 1, 'D1699161156081085960', 112.80, '');
INSERT INTO `order_detail` VALUES (74, 15, '香菜', 'https://i.postimg.cc/3Jn27XGG/1699060823702.jpg\r\n', 0.00, 1, 'D1699161156081085960', 112.80, '');
INSERT INTO `order_detail` VALUES (75, 16, '酸豆角', 'https://i.postimg.cc/XJSCxxRR/1699060826905.jpg', 0.00, 1, 'D1699161156081085960', 112.80, '');
INSERT INTO `order_detail` VALUES (76, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (77, 6, '招牌鸭血粉丝汤', 'https://i.postimg.cc/zGrFXz2m/1699060777294.jpg\r\n', 14.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (78, 7, '酸菜鸭血粉丝汤', 'https://i.postimg.cc/wTcs2h2P/1699060782155.jpg\r\n', 10.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (79, 8, '青菜', 'https://i.postimg.cc/bvXcvtcy/1699060793069.jpg', 1.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (80, 9, '豆泡', 'https://i.postimg.cc/sXctKHBx/1699060796225.jpg', 2.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (81, 10, '鱼蛋', 'https://i.postimg.cc/j23BYW4r/1699060801072.jpg', 2.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (82, 11, '荷包蛋', 'https://i.postimg.cc/c1Fpnjy5/1699060803894.jpg', 2.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (83, 12, '炸腐竹', 'https://i.postimg.cc/4Nnrb5X4/1699060807549.jpg', 2.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (84, 13, '鱼仔烧鱼棒', 'https://i.postimg.cc/0ywFhy6L/1699060810728.jpg', 3.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (85, 14, '牛筋丸', 'https://i.postimg.cc/TwC4nySW/1699060815798.jpg', 3.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (86, 15, '香菜', 'https://i.postimg.cc/3Jn27XGG/1699060823702.jpg\r\n', 0.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (87, 16, '酸豆角', 'https://i.postimg.cc/XJSCxxRR/1699060826905.jpg', 0.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (88, 17, '葱花', 'https://i.postimg.cc/pXG532NY/1699060831858.jpg', 0.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (89, 18, '酱油', 'https://i.postimg.cc/rw70FQwD/1699060835989.jpg', 0.00, 1, 'D1699172162702126777', 56.80, '');
INSERT INTO `order_detail` VALUES (90, 1, '文房四堡', 'https://i.postimg.cc/k5PpqLjM/F2-AFE3075-F6-B5-F6-FF1-C160346-F111-A5-B.jpg', 11.99, 3, 'D1699177447076268280', 36.97, '香辣/不辣');
INSERT INTO `order_detail` VALUES (91, 1, '文房四堡', 'https://i.postimg.cc/k5PpqLjM/F2-AFE3075-F6-B5-F6-FF1-C160346-F111-A5-B.jpg', 11.99, 2, 'D1699179604643308565', 38.75, '香辣/中辣');
INSERT INTO `order_detail` VALUES (92, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 3, 'D1699179604643308565', 38.75, '');
INSERT INTO `order_detail` VALUES (93, 1, '文房四堡', 'https://i.postimg.cc/k5PpqLjM/F2-AFE3075-F6-B5-F6-FF1-C160346-F111-A5-B.jpg', 11.99, 2, 'D1699182807976074703', 39.75, '香辣/中辣');
INSERT INTO `order_detail` VALUES (94, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 3, 'D1699182807976074703', 39.75, '');
INSERT INTO `order_detail` VALUES (95, 1, '文房四堡', 'https://i.postimg.cc/k5PpqLjM/F2-AFE3075-F6-B5-F6-FF1-C160346-F111-A5-B.jpg', 11.99, 2, 'D1699183524366954492', 39.75, '香辣/中辣');
INSERT INTO `order_detail` VALUES (96, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 3, 'D1699183524366954492', 39.75, '');
INSERT INTO `order_detail` VALUES (97, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 3, 'D1699183540886985490', 14.77, '');
INSERT INTO `order_detail` VALUES (98, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 2, 'D1699183815815332459', 43.60, '');
INSERT INTO `order_detail` VALUES (99, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 2, 'D1699199898167516656', 43.60, '');
INSERT INTO `order_detail` VALUES (100, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 2, 'D1699199965657581109', 43.60, '');
INSERT INTO `order_detail` VALUES (101, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 3, 'D1699199986298072254', 14.77, '');
INSERT INTO `order_detail` VALUES (102, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 3, 'D1699202068862564664', 14.77, '');
INSERT INTO `order_detail` VALUES (103, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 3, 'D1699203508217185928', 14.77, '');
INSERT INTO `order_detail` VALUES (104, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 3, 'D1699203937309466117', 14.77, '');
INSERT INTO `order_detail` VALUES (105, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 6, 'D1699203956593266084', 112.80, '');
INSERT INTO `order_detail` VALUES (106, 8, '青菜', 'https://i.postimg.cc/bvXcvtcy/1699060793069.jpg', 1.00, 1, 'D1699203956593266084', 112.80, '');
INSERT INTO `order_detail` VALUES (107, 9, '豆泡', 'https://i.postimg.cc/sXctKHBx/1699060796225.jpg', 2.00, 2, 'D1699203956593266084', 112.80, '');
INSERT INTO `order_detail` VALUES (108, 10, '鱼蛋', 'https://i.postimg.cc/j23BYW4r/1699060801072.jpg', 2.00, 2, 'D1699203956593266084', 112.80, '');
INSERT INTO `order_detail` VALUES (109, 11, '荷包蛋', 'https://i.postimg.cc/c1Fpnjy5/1699060803894.jpg', 2.00, 1, 'D1699203956593266084', 112.80, '');
INSERT INTO `order_detail` VALUES (110, 15, '香菜', 'https://i.postimg.cc/3Jn27XGG/1699060823702.jpg\r\n', 0.00, 1, 'D1699203956593266084', 112.80, '');
INSERT INTO `order_detail` VALUES (111, 16, '酸豆角', 'https://i.postimg.cc/XJSCxxRR/1699060826905.jpg', 0.00, 1, 'D1699203956593266084', 112.80, '');
INSERT INTO `order_detail` VALUES (112, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 6, 'D1699204025868975089', 112.80, '');
INSERT INTO `order_detail` VALUES (113, 8, '青菜', 'https://i.postimg.cc/bvXcvtcy/1699060793069.jpg', 1.00, 1, 'D1699204025868975089', 112.80, '');
INSERT INTO `order_detail` VALUES (114, 9, '豆泡', 'https://i.postimg.cc/sXctKHBx/1699060796225.jpg', 2.00, 2, 'D1699204025868975089', 112.80, '');
INSERT INTO `order_detail` VALUES (115, 10, '鱼蛋', 'https://i.postimg.cc/j23BYW4r/1699060801072.jpg', 2.00, 2, 'D1699204025868975089', 112.80, '');
INSERT INTO `order_detail` VALUES (116, 11, '荷包蛋', 'https://i.postimg.cc/c1Fpnjy5/1699060803894.jpg', 2.00, 1, 'D1699204025868975089', 112.80, '');
INSERT INTO `order_detail` VALUES (117, 15, '香菜', 'https://i.postimg.cc/3Jn27XGG/1699060823702.jpg\r\n', 0.00, 1, 'D1699204025868975089', 112.80, '');
INSERT INTO `order_detail` VALUES (118, 16, '酸豆角', 'https://i.postimg.cc/XJSCxxRR/1699060826905.jpg', 0.00, 1, 'D1699204025868975089', 112.80, '');
INSERT INTO `order_detail` VALUES (119, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 6, 'D1699204313041798483', 112.80, '');
INSERT INTO `order_detail` VALUES (120, 8, '青菜', 'https://i.postimg.cc/bvXcvtcy/1699060793069.jpg', 1.00, 1, 'D1699204313041798483', 112.80, '');
INSERT INTO `order_detail` VALUES (121, 9, '豆泡', 'https://i.postimg.cc/sXctKHBx/1699060796225.jpg', 2.00, 2, 'D1699204313041798483', 112.80, '');
INSERT INTO `order_detail` VALUES (122, 10, '鱼蛋', 'https://i.postimg.cc/j23BYW4r/1699060801072.jpg', 2.00, 2, 'D1699204313041798483', 112.80, '');
INSERT INTO `order_detail` VALUES (123, 11, '荷包蛋', 'https://i.postimg.cc/c1Fpnjy5/1699060803894.jpg', 2.00, 1, 'D1699204313041798483', 112.80, '');
INSERT INTO `order_detail` VALUES (124, 15, '香菜', 'https://i.postimg.cc/3Jn27XGG/1699060823702.jpg\r\n', 0.00, 1, 'D1699204313041798483', 112.80, '');
INSERT INTO `order_detail` VALUES (125, 16, '酸豆角', 'https://i.postimg.cc/XJSCxxRR/1699060826905.jpg', 0.00, 1, 'D1699204313041798483', 112.80, '');
INSERT INTO `order_detail` VALUES (126, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 6, 'D1699264757772227492', 112.80, '');
INSERT INTO `order_detail` VALUES (127, 8, '青菜', 'https://i.postimg.cc/bvXcvtcy/1699060793069.jpg', 1.00, 1, 'D1699264757772227492', 112.80, '');
INSERT INTO `order_detail` VALUES (128, 9, '豆泡', 'https://i.postimg.cc/sXctKHBx/1699060796225.jpg', 2.00, 2, 'D1699264757772227492', 112.80, '');
INSERT INTO `order_detail` VALUES (129, 10, '鱼蛋', 'https://i.postimg.cc/j23BYW4r/1699060801072.jpg', 2.00, 2, 'D1699264757772227492', 112.80, '');
INSERT INTO `order_detail` VALUES (130, 11, '荷包蛋', 'https://i.postimg.cc/c1Fpnjy5/1699060803894.jpg', 2.00, 1, 'D1699264757772227492', 112.80, '');
INSERT INTO `order_detail` VALUES (131, 15, '香菜', 'https://i.postimg.cc/3Jn27XGG/1699060823702.jpg\r\n', 0.00, 1, 'D1699264757772227492', 112.80, '');
INSERT INTO `order_detail` VALUES (132, 16, '酸豆角', 'https://i.postimg.cc/XJSCxxRR/1699060826905.jpg', 0.00, 1, 'D1699264757772227492', 112.80, '');
INSERT INTO `order_detail` VALUES (133, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 7, 'D1699265922563635996', 33.13, '');
INSERT INTO `order_detail` VALUES (134, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 7, 'D1699270279228572361', 33.13, '');
INSERT INTO `order_detail` VALUES (135, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 7, 'D1699277330803308875', 33.13, '');
INSERT INTO `order_detail` VALUES (136, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 7, 'D1699423024785974451', 33.13, '');
INSERT INTO `order_detail` VALUES (137, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 7, 'D1699497186535102151', 33.13, '');
INSERT INTO `order_detail` VALUES (138, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 7, 'D1699497202621728988', 33.13, '');
INSERT INTO `order_detail` VALUES (139, 2, '薯条', 'https://i.postimg.cc/9QYnXJsG/DFF9-DC59453-D0-A5-A0-EAE7-BD0-A73-F6526.jpg', 4.59, 7, 'D1699497549823458127', 33.13, '');
INSERT INTO `order_detail` VALUES (140, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 6, 'D1699497568983450208', 112.80, '');
INSERT INTO `order_detail` VALUES (141, 8, '青菜', 'https://i.postimg.cc/bvXcvtcy/1699060793069.jpg', 1.00, 1, 'D1699497568983450208', 112.80, '');
INSERT INTO `order_detail` VALUES (142, 9, '豆泡', 'https://i.postimg.cc/sXctKHBx/1699060796225.jpg', 2.00, 2, 'D1699497568983450208', 112.80, '');
INSERT INTO `order_detail` VALUES (143, 10, '鱼蛋', 'https://i.postimg.cc/j23BYW4r/1699060801072.jpg', 2.00, 2, 'D1699497568983450208', 112.80, '');
INSERT INTO `order_detail` VALUES (144, 11, '荷包蛋', 'https://i.postimg.cc/c1Fpnjy5/1699060803894.jpg', 2.00, 1, 'D1699497568983450208', 112.80, '');
INSERT INTO `order_detail` VALUES (145, 15, '香菜', 'https://i.postimg.cc/3Jn27XGG/1699060823702.jpg\r\n', 0.00, 1, 'D1699497568983450208', 112.80, '');
INSERT INTO `order_detail` VALUES (146, 16, '酸豆角', 'https://i.postimg.cc/XJSCxxRR/1699060826905.jpg', 0.00, 1, 'D1699497568983450208', 112.80, '');
INSERT INTO `order_detail` VALUES (147, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 6, 'D1699555821969072005', 112.80, '');
INSERT INTO `order_detail` VALUES (148, 8, '青菜', 'https://i.postimg.cc/bvXcvtcy/1699060793069.jpg', 1.00, 1, 'D1699555821969072005', 112.80, '');
INSERT INTO `order_detail` VALUES (149, 9, '豆泡', 'https://i.postimg.cc/sXctKHBx/1699060796225.jpg', 2.00, 2, 'D1699555821969072005', 112.80, '');
INSERT INTO `order_detail` VALUES (150, 10, '鱼蛋', 'https://i.postimg.cc/j23BYW4r/1699060801072.jpg', 2.00, 2, 'D1699555821969072005', 112.80, '');
INSERT INTO `order_detail` VALUES (151, 11, '荷包蛋', 'https://i.postimg.cc/c1Fpnjy5/1699060803894.jpg', 2.00, 1, 'D1699555821969072005', 112.80, '');
INSERT INTO `order_detail` VALUES (152, 15, '香菜', 'https://i.postimg.cc/3Jn27XGG/1699060823702.jpg\r\n', 0.00, 1, 'D1699555821969072005', 112.80, '');
INSERT INTO `order_detail` VALUES (153, 16, '酸豆角', 'https://i.postimg.cc/XJSCxxRR/1699060826905.jpg', 0.00, 1, 'D1699555821969072005', 112.80, '');
INSERT INTO `order_detail` VALUES (252, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 3, 'D1702919688860655917', 51.40, '');
INSERT INTO `order_detail` VALUES (253, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 3, 'D1702920035781140744', 51.40, '');
INSERT INTO `order_detail` VALUES (254, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 3, 'D1702920053259964890', 51.40, '');
INSERT INTO `order_detail` VALUES (255, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 3, 'D1702920117563874149', 51.40, '');
INSERT INTO `order_detail` VALUES (256, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 3, 'D1702920313133063146', 51.40, '');
INSERT INTO `order_detail` VALUES (257, 5, '全家福鸭血粉丝汤', 'https://i.postimg.cc/kg0wSNgH/1699060768113.jpg\r\n', 16.80, 3, 'D1702920331366674870', 51.40, '');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '订单号',
  `create_time` datetime NOT NULL COMMENT '创建订单时间',
  `user_id` int NOT NULL COMMENT '用户id',
  `shop_id` int NOT NULL COMMENT '店铺id',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `address_id` int NOT NULL COMMENT '地址id',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '订单状态',
  PRIMARY KEY (`order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('D1701592423000731760', '2023-12-03 16:33:42', 9, 1, '', 1031, '4');
INSERT INTO `orders` VALUES ('D1701592471918327139', '2023-12-03 16:34:31', 9, 1, '', 1031, '3');
INSERT INTO `orders` VALUES ('D1702919688860655917', '2023-12-18 01:14:48', 1, 2, '', 2, '4');
INSERT INTO `orders` VALUES ('D1702920035781140744', '2023-12-18 01:20:35', 1, 2, '', 2, '4');
INSERT INTO `orders` VALUES ('D1702920053259964890', '2023-12-18 01:20:53', 1, 2, '', 2, '4');
INSERT INTO `orders` VALUES ('D1702920117563874149', '2023-12-18 01:21:57', 1, 2, '', 2, '4');
INSERT INTO `orders` VALUES ('D1702920313133063146', '2023-12-18 01:25:13', 1, 2, '', 2, '0');
INSERT INTO `orders` VALUES ('D1702920331366674870', '2023-12-18 01:25:31', 1, 2, '', 2, '0');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME` ASC, `TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME` ASC, `INSTANCE_NAME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME` ASC, `INSTANCE_NAME` ASC, `REQUESTS_RECOVERY` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME` ASC, `JOB_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME` ASC, `TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME` ASC, `REQUESTS_RECOVERY` ASC) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME` ASC, `JOB_GROUP` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018BEBC940C87874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'Simex-Ace1702969220326', 1702978225754, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int NULL DEFAULT NULL,
  `INT_PROP_2` int NULL DEFAULT NULL,
  `LONG_PROP_1` bigint NULL DEFAULT NULL,
  `LONG_PROP_2` bigint NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PRIORITY` int NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME` ASC, `JOB_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME` ASC, `CALENDAR_NAME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME` ASC, `TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME` ASC, `TRIGGER_GROUP` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME` ASC, `NEXT_FIRE_TIME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME` ASC, `TRIGGER_STATE` ASC, `NEXT_FIRE_TIME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME` ASC, `MISFIRE_INSTR` ASC, `NEXT_FIRE_TIME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME` ASC, `MISFIRE_INSTR` ASC, `NEXT_FIRE_TIME` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME` ASC, `MISFIRE_INSTR` ASC, `NEXT_FIRE_TIME` ASC, `TRIGGER_GROUP` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1702980000000, 1702978200000, 5, 'WAITING', 'CRON', 1700468800000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018BEBC940C87874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `shop_id` int NOT NULL COMMENT '商品id',
  `scan_time` date NOT NULL COMMENT '浏览日期',
  `user_id` int NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 461 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '记录管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (160, 2, '2023-11-15', 10);
INSERT INTO `record` VALUES (162, 1, '2023-11-15', 10);
INSERT INTO `record` VALUES (291, 2, '2023-12-05', 9);
INSERT INTO `record` VALUES (355, 1, '2023-12-13', 9);
INSERT INTO `record` VALUES (456, 1, '2023-12-18', 1);
INSERT INTO `record` VALUES (460, 2, '2023-12-18', 1);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2023-11-20 16:11:57');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-20 18:00:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-20 19:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-20 19:30:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-20 20:00:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-20 20:30:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-20 21:00:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-20 21:30:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-20 22:00:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-20 22:30:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-20 23:00:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-20 23:30:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 4, '2023-11-21 00:00:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 00:30:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 01:00:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 01:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 02:00:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 02:30:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 13:30:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 14:00:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 14:30:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 16:30:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 17:00:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 17:30:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 18:00:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 18:30:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 19:00:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 19:30:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 20:00:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 20:30:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 21:30:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 22:00:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 22:30:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-21 23:00:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-21 23:30:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 29, '2023-11-22 00:00:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-22 00:30:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-22 01:00:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-22 01:30:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-22 02:00:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-22 02:30:00');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-22 12:30:00');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-22 13:00:00');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-22 13:30:00');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-22 21:30:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-22 22:00:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-22 22:30:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-22 23:00:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-22 23:30:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 13, '2023-11-23 00:00:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 2, '2023-11-23 00:30:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-23 01:00:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-23 01:30:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-23 02:00:00');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-23 17:00:00');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-23 17:30:00');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-23 18:00:00');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-23 18:30:00');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-23 19:00:00');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-23 19:30:00');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-23 20:00:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-23 20:30:00');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-23 21:00:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-23 21:30:00');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-23 22:00:00');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-23 22:30:00');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 2, '2023-11-23 23:00:00');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-23 23:30:00');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 8, '2023-11-24 00:00:00');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 2, '2023-11-24 00:30:00');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-24 01:00:00');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-24 01:30:00');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 02:00:00');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 02:30:00');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 03:00:00');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 14:30:00');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 15:00:00');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 15:30:00');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-24 18:00:00');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 3, '2023-11-24 18:30:00');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-24 19:00:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 19:30:00');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 2, '2023-11-24 20:00:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-24 20:30:00');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 21:00:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 21:30:00');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-24 22:00:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 22:30:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 23:00:00');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-24 23:30:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 8, '2023-11-25 00:00:00');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 2, '2023-11-25 00:30:00');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 01:00:00');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 01:30:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 02:00:00');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 02:30:00');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 03:00:00');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 2, '2023-11-25 12:30:00');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 13:30:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 14:00:00');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 14:30:00');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 15:00:00');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 16:00:00');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 17:00:00');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 17:30:00');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-25 18:00:00');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 18:30:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 19:00:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-25 19:30:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 20:00:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-25 20:30:00');
INSERT INTO `schedule_job_log` VALUES (126, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 21:00:00');
INSERT INTO `schedule_job_log` VALUES (127, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 21:30:00');
INSERT INTO `schedule_job_log` VALUES (128, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-25 22:00:00');
INSERT INTO `schedule_job_log` VALUES (129, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-25 22:30:00');
INSERT INTO `schedule_job_log` VALUES (130, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 23:00:00');
INSERT INTO `schedule_job_log` VALUES (131, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-25 23:30:00');
INSERT INTO `schedule_job_log` VALUES (132, 1, 'testTask', 'renren', 0, NULL, 5, '2023-11-26 00:00:00');
INSERT INTO `schedule_job_log` VALUES (133, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-26 00:30:00');
INSERT INTO `schedule_job_log` VALUES (134, 1, 'testTask', 'renren', 0, NULL, 2, '2023-11-26 01:00:00');
INSERT INTO `schedule_job_log` VALUES (135, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-26 01:30:00');
INSERT INTO `schedule_job_log` VALUES (136, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-26 02:00:00');
INSERT INTO `schedule_job_log` VALUES (137, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-26 02:30:00');
INSERT INTO `schedule_job_log` VALUES (138, 1, 'testTask', 'renren', 0, NULL, 0, '2023-11-26 03:00:00');
INSERT INTO `schedule_job_log` VALUES (139, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-26 03:30:00');
INSERT INTO `schedule_job_log` VALUES (140, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES (141, 1, 'testTask', 'renren', 0, NULL, 4, '2023-11-26 15:00:00');
INSERT INTO `schedule_job_log` VALUES (142, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES (143, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-26 16:00:00');
INSERT INTO `schedule_job_log` VALUES (144, 1, 'testTask', 'renren', 0, NULL, 2, '2023-11-26 16:30:00');
INSERT INTO `schedule_job_log` VALUES (145, 1, 'testTask', 'renren', 0, NULL, 1, '2023-11-26 17:00:00');
INSERT INTO `schedule_job_log` VALUES (146, 1, 'testTask', 'renren', 0, NULL, 0, '2023-12-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES (147, 1, 'testTask', 'renren', 0, NULL, 0, '2023-12-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES (148, 1, 'testTask', 'renren', 0, NULL, 1, '2023-12-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES (149, 1, 'testTask', 'renren', 0, NULL, 1, '2023-12-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES (150, 1, 'testTask', 'renren', 0, NULL, 0, '2023-12-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES (151, 1, 'testTask', 'renren', 0, NULL, 2, '2023-12-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES (152, 1, 'testTask', 'renren', 0, NULL, 0, '2023-12-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES (153, 1, 'testTask', 'renren', 0, NULL, 1, '2023-12-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES (154, 1, 'testTask', 'renren', 0, NULL, 0, '2023-12-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES (155, 1, 'testTask', 'renren', 0, NULL, 0, '2023-12-19 17:27:43');
INSERT INTO `schedule_job_log` VALUES (156, 1, 'testTask', 'renren', 0, NULL, 0, '2023-12-19 17:30:00');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `score_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论d',
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `img1` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论照片1',
  `img2` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论照片2',
  `img3` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论照片3',
  `score` int NULL DEFAULT NULL COMMENT '评分',
  `time` date NULL DEFAULT NULL COMMENT '评论时间',
  `user_id` int NOT NULL COMMENT '用户id',
  `shop_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺id',
  `order_on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  PRIMARY KEY (`score_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (1, '物美价廉 好吃', 'https://pic.ntimg.cn/file/20201201/12703668_091228303084_2.jpg', '', NULL, 4, '2023-10-10', 1, '1', '');
INSERT INTO `score` VALUES (3, '好好好', 'https://pic.ntimg.cn/file/20201201/12703668_091228303084_2.jpg', 'https://pic.ntimg.cn/file/20201201/12703668_091228303084_2.jpg', 'https://pic.ntimg.cn/file/20201201/12703668_091228303084_2.jpg', 4, '2023-11-03', 1, '1', '');
INSERT INTO `score` VALUES (4, '好好吃23333', 'https://img2.baidu.com/it/u=2038889396,242641491&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'https://img2.baidu.com/it/u=3606081472,3615771268&fm=253&fmt=auto&app=138&f=JPEG?w=665&h=500', '', 2, '2023-11-04', 1, '1', '');
INSERT INTO `score` VALUES (5, '', '', '', '', 4, '2023-11-10', 1, '2', 'D1699604188382743113');
INSERT INTO `score` VALUES (6, '', '', '', '', 5, '2023-11-10', 1, '2', 'D1699604188382743113');
INSERT INTO `score` VALUES (7, '', '', '', '', 4, '2023-11-10', 1, '2', 'D1699604188382743113');
INSERT INTO `score` VALUES (8, '', '', '', '', 3, '2023-11-10', 1, '2', 'D1699604188382743113');
INSERT INTO `score` VALUES (9, '', '', '', '', 2, '2023-11-10', 1, '2', 'D1699604188382743113');
INSERT INTO `score` VALUES (10, '', '', '', '', 1, '2023-11-10', 1, '2', 'D1699604188382743113');
INSERT INTO `score` VALUES (13, '', '', '', '', 3, '2023-11-10', 1, '2', 'D1699604188382743113');
INSERT INTO `score` VALUES (14, '', '', '', '', 4, '2023-11-10', 1, '2', 'D1699604188382743113');
INSERT INTO `score` VALUES (15, '', '', '', '', 5, '2023-11-10', 1, '2', 'D1699604188382743113');
INSERT INTO `score` VALUES (16, '#全家福鸭血粉丝汤#全家福鸭血粉丝汤 很好吃诶 推荐', 'https://gitee.com/simex1746/myfiles/raw/master/18bb87795e6ce6e58.png', '', '', 4, '2023-11-10', 1, '2', 'D1699604188382743113');
INSERT INTO `score` VALUES (17, '#全家福鸭血粉丝汤 好好好', 'https://gitee.com/simex1746/myfiles/raw/master/18bb87f9ffdfb5af1.png', 'https://gitee.com/simex1746/myfiles/raw/master/18bb87fb33dd56a0b.png', '', 4, '2023-11-10', 1, '2', 'D1699607413307813588');
INSERT INTO `score` VALUES (18, '#全家福鸭血粉丝汤 好吃', 'https://gitee.com/simex1746/myfiles/raw/master/18bb881a7b0c32734.png', 'https://gitee.com/simex1746/myfiles/raw/master/18bb881bcc2787a56.png', '', 5, '2023-11-10', 1, '2', 'D1699607413307813588');
INSERT INTO `score` VALUES (19, '#全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 ', 'https://gitee.com/simex1746/myfiles/raw/master/18bba027abe91e939.png', '', '', 5, '2023-11-10', 1, '2', 'D1699607413307813588');
INSERT INTO `score` VALUES (20, '#全家福鸭血粉丝汤 测试一下#全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 ', 'https://gitee.com/simex1746/myfiles/raw/master/18bba20af8d2ccf32.png', 'https://gitee.com/simex1746/myfiles/raw/master/18bba20bb906cbe48.png', 'https://gitee.com/simex1746/myfiles/raw/master/18bba20e36fff499d.png', 3, '2023-11-10', 1, '2', 'D1699607413307813588');
INSERT INTO `score` VALUES (21, '', '', '', '', 3, '2023-11-10', 1, '2', 'D1699607413307813588');
INSERT INTO `score` VALUES (22, '#全家福鸭血粉丝汤 #全家福鸭血粉丝汤 #全家福鸭血粉丝汤 ', '', '', '', 5, '2023-11-10', 1, '2', 'D1699607413307813588');
INSERT INTO `score` VALUES (23, '', '', '', '', 4, '2023-11-10', 1, '2', 'D1699607413307813588');
INSERT INTO `score` VALUES (31, '不好吃 难吃死了#全家福鸭血粉丝汤 ', '', '', '', 1, '2023-11-11', 1, '2', 'D1699603966870123791');
INSERT INTO `score` VALUES (32, '#全家福鸭血粉丝汤 一般般', 'https://gitee.com/simex1746/myfiles/raw/master/18bc7c1531fd37816.png', '', '', 2, '2023-11-13', 9, '2', 'D1699863387025457910');
INSERT INTO `score` VALUES (33, '', '', '', '', 3, '2023-11-13', 10, '1', 'D1699865866362132897');
INSERT INTO `score` VALUES (34, '', '', '', '', 2, '2023-11-13', 10, '1', 'D1699865845549036107');
INSERT INTO `score` VALUES (35, '色香味俱全#全家福鸭血粉丝汤 #全家福鸭血粉丝汤 ', 'https://gitee.com/simex1746/myfiles/raw/master/18bc7e84e523de9d2.png', '', '', 4, '2023-11-13', 10, '2', 'D1699865925066287325');
INSERT INTO `score` VALUES (36, '#薯条 ', 'https://gitee.com/simex1746/myfiles/raw/master/18bd776bd529fa5d4.png', 'https://gitee.com/simex1746/myfiles/raw/master/18bd776da0810c15e.png', '', 3, '2023-11-16', 1, '1', 'D1700126796831485607');
INSERT INTO `score` VALUES (37, '', '', '', '', 4, '2023-11-17', 1, '1', 'D1700240116424411523');
INSERT INTO `score` VALUES (38, '', '', '', '', 4, '2023-12-02', 9, '1', 'D1701541083599041826');
INSERT INTO `score` VALUES (39, '', 'https://gitee.com/simex1746/myfiles/raw/master/18c2ed8238e83ccbc.png', '', '', 5, '2023-12-03', 9, '1', 'D1701592471918327139');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `shop_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺名',
  `score` float(2, 1) NOT NULL COMMENT '评分',
  `sales` int NOT NULL COMMENT '销量',
  `time` int NOT NULL COMMENT '配送时间',
  `distance` double NOT NULL COMMENT '配送距离',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺照片',
  `chara` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺介绍',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺状态',
  `qs_fee` int NOT NULL COMMENT '起送费',
  `ps_fee` int NOT NULL COMMENT '配送费',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺联系电话',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '店铺管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, '艾味客炸鸡汉堡（工程学院店）', 4.5, 3000, 30, 0.3, 'https://i.postimg.cc/SNXwjdr3/1696774066992.jpg', '新学期，新气象，工程学院外卖配送啊，欢迎各位同学下单', '1', 10, 1, '123456789');
INSERT INTO `shop` VALUES (2, '南京鸭血粉丝汤（康德食堂店）', 4.5, 700, 61, 1.2, 'https://i.postimg.cc/KvMyhNwq/1699062730880.jpg', '新店开业，优惠多多！欢迎您光临本店尝鲜，如有不足之处，请您多多包涵并提出宝贵意见，我们将全力提供优质服务！', '1', 10, 1, '19914987966');

-- ----------------------------
-- Table structure for shopers
-- ----------------------------
DROP TABLE IF EXISTS `shopers`;
CREATE TABLE `shopers`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `shop_id` int NULL DEFAULT NULL COMMENT '商家店铺',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商家管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopers
-- ----------------------------
INSERT INTO `shopers` VALUES (1, '17876755727', '123456', 1);

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size`  (
  `size_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规格名称',
  `style_id` int NOT NULL COMMENT '类型id',
  PRIMARY KEY (`size_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '规格管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES (1, '香辣', 1);
INSERT INTO `size` VALUES (2, '孜然', 1);
INSERT INTO `size` VALUES (3, '常温', 2);
INSERT INTO `size` VALUES (4, '冰镇', 2);
INSERT INTO `size` VALUES (5, '中辣', 3);
INSERT INTO `size` VALUES (6, '微辣', 3);
INSERT INTO `size` VALUES (7, '不辣', 3);

-- ----------------------------
-- Table structure for style
-- ----------------------------
DROP TABLE IF EXISTS `style`;
CREATE TABLE `style`  (
  `style_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型名称',
  `food_id` int NOT NULL COMMENT '商品id',
  PRIMARY KEY (`style_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '类型管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of style
-- ----------------------------
INSERT INTO `style` VALUES (1, '口味', 1);
INSERT INTO `style` VALUES (2, '温度选择', 3);
INSERT INTO `style` VALUES (3, '辣度', 1);

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('311f10bf-007c-458b-8fe0-02591f2cef5a', '46fyg', '2023-12-19 15:55:52');
INSERT INTO `sys_captcha` VALUES ('b98f6155-87d0-4e8c-8fc9-9a7b2954bd05', 'p848c', '2023-12-19 01:47:31');
INSERT INTO `sys_captcha` VALUES ('d90d713b-2635-4357-8400-2226814a3383', '5bcfg', '2023-11-21 13:48:40');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":1,\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"qiniuBucketName\":\"ios-app\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"普通管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[15,19,4,23,24,25,26,6,7,8,9,10,11,12,13,14,27,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,96,97,98,99,100,29,-666666,1,2,3],\"createTime\":\"Nov 21, 2023 2:10:56 PM\"}]', 184, '0:0:0:0:0:0:0:1', '2023-11-21 14:10:57');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"商家\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[36,37,38,39,40,46,47,48,49,50,72,77,78,79,81,82,83,84,85,86,87,88,89,90,-666666,1,71,76],\"createTime\":\"Nov 21, 2023 2:12:52 PM\"}]', 43, '0:0:0:0:0:0:0:1', '2023-11-21 14:12:53');
INSERT INTO `sys_log` VALUES (3, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":101,\"parentId\":36,\"name\":\"上传\",\"url\":\"\",\"perms\":\"11\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 6, '0:0:0:0:0:0:0:1', '2023-11-21 14:13:54');
INSERT INTO `sys_log` VALUES (4, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[101]', 12, '0:0:0:0:0:0:0:1', '2023-11-21 14:15:51');
INSERT INTO `sys_log` VALUES (5, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"admin1\",\"password\":\"95e2a711cca1b44b102069c4a9603a8a1d516953241b140a9ea6873b725fc420\",\"salt\":\"X68Noamsm6CnJ7hQhU98\",\"email\":\"111@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Nov 21, 2023 2:17:00 PM\"}]', 9, '0:0:0:0:0:0:0:1', '2023-11-21 14:17:01');
INSERT INTO `sys_log` VALUES (6, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"shop\",\"salt\":\"X68Noamsm6CnJ7hQhU98\",\"email\":\"111@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 23, '0:0:0:0:0:0:0:1', '2023-11-21 22:19:44');
INSERT INTO `sys_log` VALUES (7, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":102,\"parentId\":1,\"name\":\"商家管理\",\"url\":\"generator/shopers\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":6,\"list\":[]}]', 22, '0:0:0:0:0:0:0:1', '2023-12-19 13:26:09');
INSERT INTO `sys_log` VALUES (8, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":76,\"parentId\":1,\"name\":\"店铺管理\",\"url\":\"generator/shop\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":6,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2023-12-19 13:26:33');
INSERT INTO `sys_log` VALUES (9, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":96,\"parentId\":1,\"name\":\"用户管理\",\"url\":\"generator/users\",\"type\":0,\"icon\":\"admin\",\"orderNum\":6,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 13:27:49');
INSERT INTO `sys_log` VALUES (10, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":96,\"parentId\":1,\"name\":\"用户管理\",\"url\":\"generator/users\",\"type\":1,\"icon\":\"xiangqufill\",\"orderNum\":6,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 13:28:29');
INSERT INTO `sys_log` VALUES (11, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":61,\"parentId\":1,\"name\":\"订单管理\",\"url\":\"generator/orders\",\"type\":1,\"icon\":\"job\",\"orderNum\":6,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 13:28:59');
INSERT INTO `sys_log` VALUES (12, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":86,\"parentId\":1,\"name\":\"类型管理\",\"url\":\"generator/style\",\"type\":1,\"icon\":\"sousuo\",\"orderNum\":6,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-12-19 13:29:13');
INSERT INTO `sys_log` VALUES (13, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":81,\"parentId\":1,\"name\":\"规格管理\",\"url\":\"generator/size\",\"type\":1,\"icon\":\"editor\",\"orderNum\":6,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 13:29:43');
INSERT INTO `sys_log` VALUES (14, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":71,\"parentId\":1,\"name\":\"评论管理\",\"url\":\"generator/score\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":6,\"list\":[]}]', 6, '0:0:0:0:0:0:0:1', '2023-12-19 13:30:10');
INSERT INTO `sys_log` VALUES (15, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":66,\"parentId\":1,\"name\":\"记录管理\",\"url\":\"generator/record\",\"type\":1,\"icon\":\"log\",\"orderNum\":6,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 13:30:29');
INSERT INTO `sys_log` VALUES (16, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":56,\"parentId\":1,\"name\":\"订单详情管理\",\"url\":\"generator/orderdetail\",\"type\":1,\"icon\":\"editor\",\"orderNum\":6,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-12-19 13:30:49');
INSERT INTO `sys_log` VALUES (17, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":1,\"name\":\"首页管理\\r\\n\",\"url\":\"generator/home\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":6,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-12-19 13:31:06');
INSERT INTO `sys_log` VALUES (18, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":1,\"name\":\"商品管理\",\"url\":\"generator/food\",\"type\":1,\"icon\":\"tixing\",\"orderNum\":6,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 13:31:40');
INSERT INTO `sys_log` VALUES (19, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":1,\"name\":\"收藏管理\",\"url\":\"generator/collect\",\"type\":1,\"icon\":\"shoucangfill\",\"orderNum\":6,\"list\":[]}]', 14, '0:0:0:0:0:0:0:1', '2023-12-19 13:31:58');
INSERT INTO `sys_log` VALUES (20, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":1,\"name\":\"分类管理\",\"url\":\"generator/category\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":6,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-12-19 13:32:16');
INSERT INTO `sys_log` VALUES (21, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":1,\"name\":\"地址管理\",\"url\":\"generator/address\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":6,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-12-19 13:32:33');
INSERT INTO `sys_log` VALUES (22, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":107,\"parentId\":0,\"name\":\"系统管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"editor\",\"orderNum\":0,\"list\":[]}]', 20, '0:0:0:0:0:0:0:1', '2023-12-19 15:22:06');
INSERT INTO `sys_log` VALUES (23, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"数据管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":0,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2023-12-19 15:23:00');
INSERT INTO `sys_log` VALUES (24, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"数据管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":0,\"list\":[]}]', 1, '0:0:0:0:0:0:0:1', '2023-12-19 15:23:00');
INSERT INTO `sys_log` VALUES (25, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":2,\"parentId\":107,\"name\":\"管理员列表\",\"url\":\"sys/user\",\"type\":1,\"icon\":\"admin\",\"orderNum\":1,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2023-12-19 15:23:56');
INSERT INTO `sys_log` VALUES (26, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":4,\"parentId\":1,\"name\":\"菜单管理\",\"url\":\"sys/menu\",\"type\":0,\"icon\":\"menu\",\"orderNum\":3,\"list\":[]}]', 5, '0:0:0:0:0:0:0:1', '2023-12-19 15:25:02');
INSERT INTO `sys_log` VALUES (27, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":4,\"parentId\":0,\"name\":\"菜单管理\",\"url\":\"sys/menu\",\"type\":0,\"icon\":\"menu\",\"orderNum\":0,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2023-12-19 15:25:33');
INSERT INTO `sys_log` VALUES (28, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":108,\"parentId\":0,\"name\":\"权限管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"role\",\"orderNum\":0,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 15:26:19');
INSERT INTO `sys_log` VALUES (29, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":2,\"parentId\":108,\"name\":\"管理员列表\",\"url\":\"sys/user\",\"type\":1,\"icon\":\"admin\",\"orderNum\":1,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2023-12-19 15:26:40');
INSERT INTO `sys_log` VALUES (30, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":3,\"parentId\":108,\"name\":\"角色管理\",\"url\":\"sys/role\",\"type\":1,\"icon\":\"role\",\"orderNum\":2,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2023-12-19 15:27:02');
INSERT INTO `sys_log` VALUES (31, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":5,\"parentId\":107,\"name\":\"SQL监控\",\"url\":\"http://localhost:8080/renren-fast/druid/sql.html\",\"type\":1,\"icon\":\"sql\",\"orderNum\":4,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 15:27:42');
INSERT INTO `sys_log` VALUES (32, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":27,\"parentId\":107,\"name\":\"参数管理\",\"url\":\"sys/config\",\"perms\":\"sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete\",\"type\":1,\"icon\":\"config\",\"orderNum\":6,\"list\":[]}]', 13, '0:0:0:0:0:0:0:1', '2023-12-19 15:27:56');
INSERT INTO `sys_log` VALUES (33, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":30,\"parentId\":107,\"name\":\"文件上传\",\"url\":\"oss/oss\",\"perms\":\"sys:oss:all\",\"type\":1,\"icon\":\"oss\",\"orderNum\":6,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 15:28:11');
INSERT INTO `sys_log` VALUES (34, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":6,\"parentId\":107,\"name\":\"定时任务\",\"url\":\"job/schedule\",\"type\":1,\"icon\":\"job\",\"orderNum\":5,\"list\":[]}]', 6, '0:0:0:0:0:0:0:1', '2023-12-19 15:28:24');
INSERT INTO `sys_log` VALUES (35, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":29,\"parentId\":107,\"name\":\"系统日志\",\"url\":\"sys/log\",\"perms\":\"sys:log:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":7,\"list\":[]}]', 5, '0:0:0:0:0:0:0:1', '2023-12-19 15:28:45');
INSERT INTO `sys_log` VALUES (36, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":4,\"parentId\":0,\"name\":\"菜单管理\",\"url\":\"sys/menu\",\"type\":0,\"icon\":\"menu\",\"orderNum\":4,\"list\":[]}]', 6, '0:0:0:0:0:0:0:1', '2023-12-19 15:29:24');
INSERT INTO `sys_log` VALUES (37, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"数据管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":1,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2023-12-19 15:29:36');
INSERT INTO `sys_log` VALUES (38, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":108,\"parentId\":0,\"name\":\"权限管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"role\",\"orderNum\":2,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2023-12-19 15:29:48');
INSERT INTO `sys_log` VALUES (39, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":107,\"parentId\":0,\"name\":\"系统管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"editor\",\"orderNum\":3,\"list\":[]}]', 4, '0:0:0:0:0:0:0:1', '2023-12-19 15:29:59');
INSERT INTO `sys_log` VALUES (40, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":1,\"name\":\"收藏管理\",\"url\":\"generator/collect\",\"type\":1,\"icon\":\"shoucang\",\"orderNum\":6,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 16:13:55');
INSERT INTO `sys_log` VALUES (41, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":96,\"parentId\":1,\"name\":\"用户管理\",\"url\":\"generator/users\",\"type\":1,\"icon\":\"xiangqu\",\"orderNum\":6,\"list\":[]}]', 6, '0:0:0:0:0:0:0:1', '2023-12-19 16:14:10');
INSERT INTO `sys_log` VALUES (42, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":4,\"parentId\":0,\"name\":\"菜单管理\",\"url\":\"sys/menu\",\"type\":0,\"icon\":\"zonghe\",\"orderNum\":4,\"list\":[]}]', 9, '0:0:0:0:0:0:0:1', '2023-12-19 16:15:00');
INSERT INTO `sys_log` VALUES (43, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"数据管理\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":1,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2023-12-19 16:15:14');
INSERT INTO `sys_log` VALUES (44, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":107,\"parentId\":0,\"name\":\"系统管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"sql\",\"orderNum\":3,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-12-19 16:15:28');
INSERT INTO `sys_log` VALUES (45, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"工程女仆\",\"password\":\"cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]', 172, '0:0:0:0:0:0:0:1', '2023-12-19 16:24:14');
INSERT INTO `sys_log` VALUES (46, '工程女仆', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"Ace\",\"password\":\"cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]', 13, '0:0:0:0:0:0:0:1', '2023-12-19 16:25:04');
INSERT INTO `sys_log` VALUES (47, 'Ace', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"Ace\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[2,1],\"createUserId\":1}]', 17, '0:0:0:0:0:0:0:1', '2023-12-19 16:25:15');
INSERT INTO `sys_log` VALUES (48, 'Ace', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":3,\"roleName\":\"超级管理员\",\"remark\":\"拥有本后台管理系统的最高权限\",\"createUserId\":1,\"menuIdList\":[1,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,96,97,98,99,100,102,103,104,105,106,108,2,15,16,17,18,3,19,20,21,22,107,5,6,7,8,9,10,11,12,13,14,27,30,29,4,23,24,25,26,-666666],\"createTime\":\"Dec 19, 2023 5:02:18 PM\"}]', 108, '0:0:0:0:0:0:0:1', '2023-12-19 17:02:19');
INSERT INTO `sys_log` VALUES (49, 'Ace', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"商家\",\"remark\":\"web端商家版(仅可查看数据)\",\"createUserId\":1,\"menuIdList\":[32,37,42,47,52,57,62,67,72,77,82,87,97,-666666,1,31,36,41,46,51,56,61,66,71,76,81,86,96]}]', 30, '0:0:0:0:0:0:0:1', '2023-12-19 17:04:26');
INSERT INTO `sys_log` VALUES (50, 'Ace', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"普通管理员\",\"remark\":\"拥有数据管理 部分系统权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,96,97,98,99,100,15,19,5,7,14,29,23,-666666,1,108,2,3,107,6,4]}]', 79, '0:0:0:0:0:0:0:1', '2023-12-19 17:07:34');
INSERT INTO `sys_log` VALUES (51, 'Ace', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"admin\",\"password\":\"c1cd5b8ea910d88ca53ec4c6674770b2a5ade195583ad01cff4cc7741773ae88\",\"salt\":\"X68Noamsm6CnJ7hQhU98\",\"email\":\"111@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 13, '0:0:0:0:0:0:0:1', '2023-12-19 17:08:09');
INSERT INTO `sys_log` VALUES (52, 'Ace', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":4,\"username\":\"shop\",\"password\":\"222eacb0a9833ea71ea3952d30e16680e205c7b6ed24e1859023050628d320ed\",\"salt\":\"keLfrToZzjgpJRBSXl88\",\"email\":\"1@qq.com\",\"mobile\":\"17111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Dec 19, 2023 5:09:00 PM\"}]', 7, '0:0:0:0:0:0:0:1', '2023-12-19 17:09:00');
INSERT INTO `sys_log` VALUES (53, 'Ace', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[[1]]', 19, '0:0:0:0:0:0:0:1', '2023-12-19 17:27:43');
INSERT INTO `sys_log` VALUES (54, 'Ace', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[[1]]', 7, '0:0:0:0:0:0:0:1', '2023-12-19 17:27:49');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '数据管理', NULL, NULL, 0, 'zhedie', 1);
INSERT INTO `sys_menu` VALUES (2, 108, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 108, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 0, '菜单管理', 'sys/menu', NULL, 0, 'zonghe', 4);
INSERT INTO `sys_menu` VALUES (5, 107, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 107, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 107, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 107, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 107, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, 1, '地址管理', 'generator/address', NULL, 1, 'daohang', 6);
INSERT INTO `sys_menu` VALUES (32, 31, '查看', NULL, 'generator:address:list,generator:address:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (33, 31, '新增', NULL, 'generator:address:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (34, 31, '修改', NULL, 'generator:address:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (35, 31, '删除', NULL, 'generator:address:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (36, 1, '分类管理', 'generator/category', NULL, 1, 'mudedi', 6);
INSERT INTO `sys_menu` VALUES (37, 36, '查看', NULL, 'generator:category:list,generator:category:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (38, 36, '新增', NULL, 'generator:category:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (39, 36, '修改', NULL, 'generator:category:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (40, 36, '删除', NULL, 'generator:category:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (41, 1, '收藏管理', 'generator/collect', NULL, 1, 'shoucang', 6);
INSERT INTO `sys_menu` VALUES (42, 41, '查看', NULL, 'generator:collect:list,generator:collect:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (43, 41, '新增', NULL, 'generator:collect:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (44, 41, '修改', NULL, 'generator:collect:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (45, 41, '删除', NULL, 'generator:collect:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (46, 1, '商品管理', 'generator/food', NULL, 1, 'tixing', 6);
INSERT INTO `sys_menu` VALUES (47, 46, '查看', NULL, 'generator:food:list,generator:food:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (48, 46, '新增', NULL, 'generator:food:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (49, 46, '修改', NULL, 'generator:food:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (50, 46, '删除', NULL, 'generator:food:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (51, 1, '首页管理\r\n', 'generator/home', NULL, 1, 'shouye', 6);
INSERT INTO `sys_menu` VALUES (52, 51, '查看', NULL, 'generator:home:list,generator:home:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (53, 51, '新增', NULL, 'generator:home:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (54, 51, '修改', NULL, 'generator:home:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (55, 51, '删除', NULL, 'generator:home:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (56, 1, '订单详情管理', 'generator/orderdetail', NULL, 1, 'editor', 6);
INSERT INTO `sys_menu` VALUES (57, 56, '查看', NULL, 'generator:orderdetail:list,generator:orderdetail:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (58, 56, '新增', NULL, 'generator:orderdetail:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (59, 56, '修改', NULL, 'generator:orderdetail:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (60, 56, '删除', NULL, 'generator:orderdetail:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (61, 1, '订单管理', 'generator/orders', NULL, 1, 'job', 6);
INSERT INTO `sys_menu` VALUES (62, 61, '查看', NULL, 'generator:orders:list,generator:orders:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (63, 61, '新增', NULL, 'generator:orders:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (64, 61, '修改', NULL, 'generator:orders:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (65, 61, '删除', NULL, 'generator:orders:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (66, 1, '记录管理', 'generator/record', NULL, 1, 'log', 6);
INSERT INTO `sys_menu` VALUES (67, 66, '查看', NULL, 'generator:record:list,generator:record:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (68, 66, '新增', NULL, 'generator:record:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (69, 66, '修改', NULL, 'generator:record:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (70, 66, '删除', NULL, 'generator:record:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (71, 1, '评论管理', 'generator/score', NULL, 1, 'tubiao', 6);
INSERT INTO `sys_menu` VALUES (72, 71, '查看', NULL, 'generator:score:list,generator:score:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (73, 71, '新增', NULL, 'generator:score:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (74, 71, '修改', NULL, 'generator:score:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (75, 71, '删除', NULL, 'generator:score:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (76, 1, '店铺管理', 'generator/shop', NULL, 1, 'pinglun', 6);
INSERT INTO `sys_menu` VALUES (77, 76, '查看', NULL, 'generator:shop:list,generator:shop:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (78, 76, '新增', NULL, 'generator:shop:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (79, 76, '修改', NULL, 'generator:shop:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (80, 76, '删除', NULL, 'generator:shop:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (81, 1, '规格管理', 'generator/size', NULL, 1, 'editor', 6);
INSERT INTO `sys_menu` VALUES (82, 81, '查看', NULL, 'generator:size:list,generator:size:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (83, 81, '新增', NULL, 'generator:size:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (84, 81, '修改', NULL, 'generator:size:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (85, 81, '删除', NULL, 'generator:size:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (86, 1, '类型管理', 'generator/style', NULL, 1, 'sousuo', 6);
INSERT INTO `sys_menu` VALUES (87, 86, '查看', NULL, 'generator:style:list,generator:style:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (88, 86, '新增', NULL, 'generator:style:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (89, 86, '修改', NULL, 'generator:style:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (90, 86, '删除', NULL, 'generator:style:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (96, 1, '用户管理', 'generator/users', NULL, 1, 'xiangqu', 6);
INSERT INTO `sys_menu` VALUES (97, 96, '查看', NULL, 'generator:users:list,generator:users:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (98, 96, '新增', NULL, 'generator:users:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (99, 96, '修改', NULL, 'generator:users:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (100, 96, '删除', NULL, 'generator:users:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (102, 1, '商家管理', 'generator/shopers', NULL, 1, 'bianji', 6);
INSERT INTO `sys_menu` VALUES (103, 102, '查看', NULL, 'generator:shopers:list,generator:shopers:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (104, 102, '新增', NULL, 'generator:shopers:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (105, 102, '修改', NULL, 'generator:shopers:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (106, 102, '删除', NULL, 'generator:shopers:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (107, 0, '系统管理', '', '', 0, 'sql', 3);
INSERT INTO `sys_menu` VALUES (108, 0, '权限管理', '', '', 0, 'role', 2);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '普通管理员', '拥有数据管理 部分系统权限', 1, '2023-11-21 14:10:57');
INSERT INTO `sys_role` VALUES (2, '商家', 'web端商家版(仅可查看数据)', 1, '2023-11-21 14:12:53');
INSERT INTO `sys_role` VALUES (3, '超级管理员', '拥有本后台管理系统的最高权限', 1, '2023-12-19 17:02:19');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (117, 3, 1);
INSERT INTO `sys_role_menu` VALUES (118, 3, 31);
INSERT INTO `sys_role_menu` VALUES (119, 3, 32);
INSERT INTO `sys_role_menu` VALUES (120, 3, 33);
INSERT INTO `sys_role_menu` VALUES (121, 3, 34);
INSERT INTO `sys_role_menu` VALUES (122, 3, 35);
INSERT INTO `sys_role_menu` VALUES (123, 3, 36);
INSERT INTO `sys_role_menu` VALUES (124, 3, 37);
INSERT INTO `sys_role_menu` VALUES (125, 3, 38);
INSERT INTO `sys_role_menu` VALUES (126, 3, 39);
INSERT INTO `sys_role_menu` VALUES (127, 3, 40);
INSERT INTO `sys_role_menu` VALUES (128, 3, 41);
INSERT INTO `sys_role_menu` VALUES (129, 3, 42);
INSERT INTO `sys_role_menu` VALUES (130, 3, 43);
INSERT INTO `sys_role_menu` VALUES (131, 3, 44);
INSERT INTO `sys_role_menu` VALUES (132, 3, 45);
INSERT INTO `sys_role_menu` VALUES (133, 3, 46);
INSERT INTO `sys_role_menu` VALUES (134, 3, 47);
INSERT INTO `sys_role_menu` VALUES (135, 3, 48);
INSERT INTO `sys_role_menu` VALUES (136, 3, 49);
INSERT INTO `sys_role_menu` VALUES (137, 3, 50);
INSERT INTO `sys_role_menu` VALUES (138, 3, 51);
INSERT INTO `sys_role_menu` VALUES (139, 3, 52);
INSERT INTO `sys_role_menu` VALUES (140, 3, 53);
INSERT INTO `sys_role_menu` VALUES (141, 3, 54);
INSERT INTO `sys_role_menu` VALUES (142, 3, 55);
INSERT INTO `sys_role_menu` VALUES (143, 3, 56);
INSERT INTO `sys_role_menu` VALUES (144, 3, 57);
INSERT INTO `sys_role_menu` VALUES (145, 3, 58);
INSERT INTO `sys_role_menu` VALUES (146, 3, 59);
INSERT INTO `sys_role_menu` VALUES (147, 3, 60);
INSERT INTO `sys_role_menu` VALUES (148, 3, 61);
INSERT INTO `sys_role_menu` VALUES (149, 3, 62);
INSERT INTO `sys_role_menu` VALUES (150, 3, 63);
INSERT INTO `sys_role_menu` VALUES (151, 3, 64);
INSERT INTO `sys_role_menu` VALUES (152, 3, 65);
INSERT INTO `sys_role_menu` VALUES (153, 3, 66);
INSERT INTO `sys_role_menu` VALUES (154, 3, 67);
INSERT INTO `sys_role_menu` VALUES (155, 3, 68);
INSERT INTO `sys_role_menu` VALUES (156, 3, 69);
INSERT INTO `sys_role_menu` VALUES (157, 3, 70);
INSERT INTO `sys_role_menu` VALUES (158, 3, 71);
INSERT INTO `sys_role_menu` VALUES (159, 3, 72);
INSERT INTO `sys_role_menu` VALUES (160, 3, 73);
INSERT INTO `sys_role_menu` VALUES (161, 3, 74);
INSERT INTO `sys_role_menu` VALUES (162, 3, 75);
INSERT INTO `sys_role_menu` VALUES (163, 3, 76);
INSERT INTO `sys_role_menu` VALUES (164, 3, 77);
INSERT INTO `sys_role_menu` VALUES (165, 3, 78);
INSERT INTO `sys_role_menu` VALUES (166, 3, 79);
INSERT INTO `sys_role_menu` VALUES (167, 3, 80);
INSERT INTO `sys_role_menu` VALUES (168, 3, 81);
INSERT INTO `sys_role_menu` VALUES (169, 3, 82);
INSERT INTO `sys_role_menu` VALUES (170, 3, 83);
INSERT INTO `sys_role_menu` VALUES (171, 3, 84);
INSERT INTO `sys_role_menu` VALUES (172, 3, 85);
INSERT INTO `sys_role_menu` VALUES (173, 3, 86);
INSERT INTO `sys_role_menu` VALUES (174, 3, 87);
INSERT INTO `sys_role_menu` VALUES (175, 3, 88);
INSERT INTO `sys_role_menu` VALUES (176, 3, 89);
INSERT INTO `sys_role_menu` VALUES (177, 3, 90);
INSERT INTO `sys_role_menu` VALUES (178, 3, 96);
INSERT INTO `sys_role_menu` VALUES (179, 3, 97);
INSERT INTO `sys_role_menu` VALUES (180, 3, 98);
INSERT INTO `sys_role_menu` VALUES (181, 3, 99);
INSERT INTO `sys_role_menu` VALUES (182, 3, 100);
INSERT INTO `sys_role_menu` VALUES (183, 3, 102);
INSERT INTO `sys_role_menu` VALUES (184, 3, 103);
INSERT INTO `sys_role_menu` VALUES (185, 3, 104);
INSERT INTO `sys_role_menu` VALUES (186, 3, 105);
INSERT INTO `sys_role_menu` VALUES (187, 3, 106);
INSERT INTO `sys_role_menu` VALUES (188, 3, 108);
INSERT INTO `sys_role_menu` VALUES (189, 3, 2);
INSERT INTO `sys_role_menu` VALUES (190, 3, 15);
INSERT INTO `sys_role_menu` VALUES (191, 3, 16);
INSERT INTO `sys_role_menu` VALUES (192, 3, 17);
INSERT INTO `sys_role_menu` VALUES (193, 3, 18);
INSERT INTO `sys_role_menu` VALUES (194, 3, 3);
INSERT INTO `sys_role_menu` VALUES (195, 3, 19);
INSERT INTO `sys_role_menu` VALUES (196, 3, 20);
INSERT INTO `sys_role_menu` VALUES (197, 3, 21);
INSERT INTO `sys_role_menu` VALUES (198, 3, 22);
INSERT INTO `sys_role_menu` VALUES (199, 3, 107);
INSERT INTO `sys_role_menu` VALUES (200, 3, 5);
INSERT INTO `sys_role_menu` VALUES (201, 3, 6);
INSERT INTO `sys_role_menu` VALUES (202, 3, 7);
INSERT INTO `sys_role_menu` VALUES (203, 3, 8);
INSERT INTO `sys_role_menu` VALUES (204, 3, 9);
INSERT INTO `sys_role_menu` VALUES (205, 3, 10);
INSERT INTO `sys_role_menu` VALUES (206, 3, 11);
INSERT INTO `sys_role_menu` VALUES (207, 3, 12);
INSERT INTO `sys_role_menu` VALUES (208, 3, 13);
INSERT INTO `sys_role_menu` VALUES (209, 3, 14);
INSERT INTO `sys_role_menu` VALUES (210, 3, 27);
INSERT INTO `sys_role_menu` VALUES (211, 3, 30);
INSERT INTO `sys_role_menu` VALUES (212, 3, 29);
INSERT INTO `sys_role_menu` VALUES (213, 3, 4);
INSERT INTO `sys_role_menu` VALUES (214, 3, 23);
INSERT INTO `sys_role_menu` VALUES (215, 3, 24);
INSERT INTO `sys_role_menu` VALUES (216, 3, 25);
INSERT INTO `sys_role_menu` VALUES (217, 3, 26);
INSERT INTO `sys_role_menu` VALUES (218, 3, -666666);
INSERT INTO `sys_role_menu` VALUES (219, 2, 32);
INSERT INTO `sys_role_menu` VALUES (220, 2, 37);
INSERT INTO `sys_role_menu` VALUES (221, 2, 42);
INSERT INTO `sys_role_menu` VALUES (222, 2, 47);
INSERT INTO `sys_role_menu` VALUES (223, 2, 52);
INSERT INTO `sys_role_menu` VALUES (224, 2, 57);
INSERT INTO `sys_role_menu` VALUES (225, 2, 62);
INSERT INTO `sys_role_menu` VALUES (226, 2, 67);
INSERT INTO `sys_role_menu` VALUES (227, 2, 72);
INSERT INTO `sys_role_menu` VALUES (228, 2, 77);
INSERT INTO `sys_role_menu` VALUES (229, 2, 82);
INSERT INTO `sys_role_menu` VALUES (230, 2, 87);
INSERT INTO `sys_role_menu` VALUES (231, 2, 97);
INSERT INTO `sys_role_menu` VALUES (232, 2, -666666);
INSERT INTO `sys_role_menu` VALUES (233, 2, 1);
INSERT INTO `sys_role_menu` VALUES (234, 2, 31);
INSERT INTO `sys_role_menu` VALUES (235, 2, 36);
INSERT INTO `sys_role_menu` VALUES (236, 2, 41);
INSERT INTO `sys_role_menu` VALUES (237, 2, 46);
INSERT INTO `sys_role_menu` VALUES (238, 2, 51);
INSERT INTO `sys_role_menu` VALUES (239, 2, 56);
INSERT INTO `sys_role_menu` VALUES (240, 2, 61);
INSERT INTO `sys_role_menu` VALUES (241, 2, 66);
INSERT INTO `sys_role_menu` VALUES (242, 2, 71);
INSERT INTO `sys_role_menu` VALUES (243, 2, 76);
INSERT INTO `sys_role_menu` VALUES (244, 2, 81);
INSERT INTO `sys_role_menu` VALUES (245, 2, 86);
INSERT INTO `sys_role_menu` VALUES (246, 2, 96);
INSERT INTO `sys_role_menu` VALUES (247, 1, 31);
INSERT INTO `sys_role_menu` VALUES (248, 1, 32);
INSERT INTO `sys_role_menu` VALUES (249, 1, 33);
INSERT INTO `sys_role_menu` VALUES (250, 1, 34);
INSERT INTO `sys_role_menu` VALUES (251, 1, 35);
INSERT INTO `sys_role_menu` VALUES (252, 1, 36);
INSERT INTO `sys_role_menu` VALUES (253, 1, 37);
INSERT INTO `sys_role_menu` VALUES (254, 1, 38);
INSERT INTO `sys_role_menu` VALUES (255, 1, 39);
INSERT INTO `sys_role_menu` VALUES (256, 1, 40);
INSERT INTO `sys_role_menu` VALUES (257, 1, 41);
INSERT INTO `sys_role_menu` VALUES (258, 1, 42);
INSERT INTO `sys_role_menu` VALUES (259, 1, 43);
INSERT INTO `sys_role_menu` VALUES (260, 1, 44);
INSERT INTO `sys_role_menu` VALUES (261, 1, 45);
INSERT INTO `sys_role_menu` VALUES (262, 1, 46);
INSERT INTO `sys_role_menu` VALUES (263, 1, 47);
INSERT INTO `sys_role_menu` VALUES (264, 1, 48);
INSERT INTO `sys_role_menu` VALUES (265, 1, 49);
INSERT INTO `sys_role_menu` VALUES (266, 1, 50);
INSERT INTO `sys_role_menu` VALUES (267, 1, 51);
INSERT INTO `sys_role_menu` VALUES (268, 1, 52);
INSERT INTO `sys_role_menu` VALUES (269, 1, 53);
INSERT INTO `sys_role_menu` VALUES (270, 1, 54);
INSERT INTO `sys_role_menu` VALUES (271, 1, 55);
INSERT INTO `sys_role_menu` VALUES (272, 1, 56);
INSERT INTO `sys_role_menu` VALUES (273, 1, 57);
INSERT INTO `sys_role_menu` VALUES (274, 1, 58);
INSERT INTO `sys_role_menu` VALUES (275, 1, 59);
INSERT INTO `sys_role_menu` VALUES (276, 1, 60);
INSERT INTO `sys_role_menu` VALUES (277, 1, 61);
INSERT INTO `sys_role_menu` VALUES (278, 1, 62);
INSERT INTO `sys_role_menu` VALUES (279, 1, 63);
INSERT INTO `sys_role_menu` VALUES (280, 1, 64);
INSERT INTO `sys_role_menu` VALUES (281, 1, 65);
INSERT INTO `sys_role_menu` VALUES (282, 1, 66);
INSERT INTO `sys_role_menu` VALUES (283, 1, 67);
INSERT INTO `sys_role_menu` VALUES (284, 1, 68);
INSERT INTO `sys_role_menu` VALUES (285, 1, 69);
INSERT INTO `sys_role_menu` VALUES (286, 1, 70);
INSERT INTO `sys_role_menu` VALUES (287, 1, 71);
INSERT INTO `sys_role_menu` VALUES (288, 1, 72);
INSERT INTO `sys_role_menu` VALUES (289, 1, 73);
INSERT INTO `sys_role_menu` VALUES (290, 1, 74);
INSERT INTO `sys_role_menu` VALUES (291, 1, 75);
INSERT INTO `sys_role_menu` VALUES (292, 1, 76);
INSERT INTO `sys_role_menu` VALUES (293, 1, 77);
INSERT INTO `sys_role_menu` VALUES (294, 1, 78);
INSERT INTO `sys_role_menu` VALUES (295, 1, 79);
INSERT INTO `sys_role_menu` VALUES (296, 1, 80);
INSERT INTO `sys_role_menu` VALUES (297, 1, 81);
INSERT INTO `sys_role_menu` VALUES (298, 1, 82);
INSERT INTO `sys_role_menu` VALUES (299, 1, 83);
INSERT INTO `sys_role_menu` VALUES (300, 1, 84);
INSERT INTO `sys_role_menu` VALUES (301, 1, 85);
INSERT INTO `sys_role_menu` VALUES (302, 1, 86);
INSERT INTO `sys_role_menu` VALUES (303, 1, 87);
INSERT INTO `sys_role_menu` VALUES (304, 1, 88);
INSERT INTO `sys_role_menu` VALUES (305, 1, 89);
INSERT INTO `sys_role_menu` VALUES (306, 1, 90);
INSERT INTO `sys_role_menu` VALUES (307, 1, 96);
INSERT INTO `sys_role_menu` VALUES (308, 1, 97);
INSERT INTO `sys_role_menu` VALUES (309, 1, 98);
INSERT INTO `sys_role_menu` VALUES (310, 1, 99);
INSERT INTO `sys_role_menu` VALUES (311, 1, 100);
INSERT INTO `sys_role_menu` VALUES (312, 1, 15);
INSERT INTO `sys_role_menu` VALUES (313, 1, 19);
INSERT INTO `sys_role_menu` VALUES (314, 1, 5);
INSERT INTO `sys_role_menu` VALUES (315, 1, 7);
INSERT INTO `sys_role_menu` VALUES (316, 1, 14);
INSERT INTO `sys_role_menu` VALUES (317, 1, 29);
INSERT INTO `sys_role_menu` VALUES (318, 1, 23);
INSERT INTO `sys_role_menu` VALUES (319, 1, -666666);
INSERT INTO `sys_role_menu` VALUES (320, 1, 1);
INSERT INTO `sys_role_menu` VALUES (321, 1, 108);
INSERT INTO `sys_role_menu` VALUES (322, 1, 2);
INSERT INTO `sys_role_menu` VALUES (323, 1, 3);
INSERT INTO `sys_role_menu` VALUES (324, 1, 107);
INSERT INTO `sys_role_menu` VALUES (325, 1, 6);
INSERT INTO `sys_role_menu` VALUES (326, 1, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'Ace', 'cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (3, 'admin', 'c1cd5b8ea910d88ca53ec4c6674770b2a5ade195583ad01cff4cc7741773ae88', 'X68Noamsm6CnJ7hQhU98', '111@qq.com', '11111111111', 1, 1, '2023-11-21 14:17:01');
INSERT INTO `sys_user` VALUES (4, 'shop', '222eacb0a9833ea71ea3952d30e16680e205c7b6ed24e1859023050628d320ed', 'keLfrToZzjgpJRBSXl88', '1@qq.com', '17111111111', 1, 1, '2023-12-19 17:09:00');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (3, 1, 2);
INSERT INTO `sys_user_role` VALUES (4, 1, 1);
INSERT INTO `sys_user_role` VALUES (5, 3, 1);
INSERT INTO `sys_user_role` VALUES (6, 4, 2);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'token',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, 'd03d26d7d86120a6f373711bddc3a530', '2023-12-20 05:17:31', '2023-12-19 17:17:31');
INSERT INTO `sys_user_token` VALUES (3, 'b495fdd1bab7776f63dbff8eb03b2e18', '2023-12-20 05:09:20', '2023-12-19 17:09:20');
INSERT INTO `sys_user_token` VALUES (4, '69a79a4a17b90075d1b1fa059eaa7974', '2023-12-20 05:11:00', '2023-12-19 17:11:00');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户性别',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户地区',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Ace', '女', '广东省-广州市-越秀区', '19174108912', 'lyq0416.', 'https://gitee.com/simex1746/myfiles/raw/master/18c3ad343a4ce6445.png');
INSERT INTO `users` VALUES (9, '阿泽', '男', '北京市-北京市-东城区', '17876755727', '123456', 'https://gitee.com/simex1746/myfiles/raw/master/18bc7bf35cd50f365.png');
INSERT INTO `users` VALUES (10, '工程新生', '男', '广东省-广州市-天河区', '18029957323', '123456', 'https://gitee.com/simex1746/myfiles/raw/master/18bba20af8d2ccf32.png');

SET FOREIGN_KEY_CHECKS = 1;
