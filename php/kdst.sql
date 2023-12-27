/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : kdst

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 20/06/2023 18:48:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地址',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '默认地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1025 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '唐僧', '160-2027-0969', '中国中山乐丰六路936号25楼', '0');
INSERT INTO `address` VALUES (2, '蒋嘉伦', '188-1885-8638', '中国北京市海淀区清河中街68号103号36楼', '0');
INSERT INTO `address` VALUES (3, '向云熙', '769-201-4341', '中国东莞珊瑚路261号32栋', '0');
INSERT INTO `address` VALUES (5, '邹致远', '20-105-2288', '中国广州市白云区机场路棠苑街五巷852号11号楼', '0');
INSERT INTO `address` VALUES (7, '孔睿', '755-603-7049', '中国深圳罗湖区田贝一路909号19室', '1');
INSERT INTO `address` VALUES (8, '朱震南', '131-1086-1461', '中国北京市海淀区清河中街68号825号41室', '0');
INSERT INTO `address` VALUES (9, '毛子', '10-046-8346', '中国北京市西城区复兴门内大街182号华润大厦12室', '0');
INSERT INTO `address` VALUES (10, '崔杰宏', '153-6415-6155', '中国深圳罗湖区蔡屋围深南东路317号华润大厦26室', '0');
INSERT INTO `address` VALUES (11, '谢云熙', '194-2792-9113', '中国中山天河区大信商圈大信南路369号3号楼', '0');
INSERT INTO `address` VALUES (12, '阎晓', '187-0298-2000', '中国东莞珊瑚路718号华润大厦7室', '0');
INSERT INTO `address` VALUES (13, '向云熙', '28-7161-6328', '中国成都市成华区双庆路219号4栋', '0');
INSERT INTO `address` VALUES (14, '严詩涵', '199-7712-9951', '中国广州市白云区机场路棠苑街五巷94号39号楼', '0');
INSERT INTO `address` VALUES (15, '向詩涵', '28-492-4757', '中国成都市成华区玉双路6号417号华润大厦47室', '0');
INSERT INTO `address` VALUES (1024, '55', '87789', '8*9898', '0');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单名',
  `create_time` datetime NOT NULL COMMENT '创建订单时间',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `order_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '订单状态\r\n\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (55, '本驰太阳能供电车载空气净化器负离子加湿香薰 除尘去异味清洁空气黑色', '2023-06-10 01:13:16', 'D1686417196590020012', '1');
INSERT INTO `order` VALUES (56, 'Edifier/漫步者 R201T08 多媒体有源2.1电脑音箱 木质低音炮音响', '2023-06-12 17:13:59', 'D1686561239380054756', '1');
INSERT INTO `order` VALUES (57, 'PANDORA/潘多拉 心形蛇骨基础手链 590727CZ等2件商品', '2023-06-12 17:14:35', 'D1686561275637534274', '1');
INSERT INTO `order` VALUES (58, '创维（Skyworth）42X6 42英寸10核智能酷开网络平板液晶电视（黑色）', '2023-06-16 09:40:13', 'D1686879613316977371', '1');
INSERT INTO `order` VALUES (59, '创维（Skyworth）42X6 42英寸10核智能酷开网络平板液晶电视（黑色）', '2023-06-16 10:14:04', 'D1686881644673208597', '1');
INSERT INTO `order` VALUES (60, 'YN跃能汽车擦车泥火山泥清洁美容用品工具漆面去飞漆橡皮泥去污泥洗车泥', '2023-06-16 10:52:47', 'D1686883967738891120', '1');
INSERT INTO `order` VALUES (61, 'YN跃能汽车擦车泥火山泥清洁美容用品工具漆面去飞漆橡皮泥去污泥洗车泥', '2023-06-16 10:53:22', 'D1686884002643329418', '0');
INSERT INTO `order` VALUES (62, 'YN跃能汽车擦车泥火山泥清洁美容用品工具漆面去飞漆橡皮泥去污泥洗车泥', '2023-06-16 10:55:03', 'D1686884103975233332', '0');
INSERT INTO `order` VALUES (63, 'YN跃能汽车擦车泥火山泥清洁美容用品工具漆面去飞漆橡皮泥去污泥洗车泥', '2023-06-20 16:42:29', 'D1687250549105781104', '1');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `goods_id` int NOT NULL COMMENT '商品id',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品图片',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `goods_num` int NOT NULL COMMENT '商品数量',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `totalPrice` decimal(10, 2) NOT NULL COMMENT '商品总价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (51, 129, '本驰太阳能供电车载空气净化器负离子加湿香薰 除尘去异味清洁空气黑色', 'http://image5.suning.cn/uimg/b2c/newcatentries/0070083251-000000000124779759_1_400x400.jpg', 128.00, 1, 'D1686417196590020012', 128.00);
INSERT INTO `order_detail` VALUES (52, 27523, 'Edifier/漫步者 R201T08 多媒体有源2.1电脑音箱 木质低音炮音响', 'http://image1.suning.cn/uimg/b2c/newcatentries/0000000000-000000000616816727_1_800x800.jpg', 219.00, 1, 'D1686561239380054756', 219.00);
INSERT INTO `order_detail` VALUES (53, 26311, 'PANDORA/潘多拉 心形蛇骨基础手链 590727CZ', 'http://image2.suning.cn/uimg/b2c/newcatentries/0070088060-000000000604651942_2_400x400.jpg', 639.00, 1, 'D1686561275637534274', 1984.00);
INSERT INTO `order_detail` VALUES (54, 24399, '七夕情人节生日女生礼物送女友圣诞节创意礼品 浪漫实用520表白礼物可刻字 S925银花季手链', 'http://image3.suning.cn/uimg/b2c/newcatentries/0070092227-000000000625125101_2_400x400.jpg', 269.00, 5, 'D1686561275637534274', 1984.00);
INSERT INTO `order_detail` VALUES (55, 57444, '创维（Skyworth）42X6 42英寸10核智能酷开网络平板液晶电视（黑色）', 'http://image2.suning.cn/uimg/b2c/newcatentries/0070078057-000000000634917020_1_800x800.jpg', 1899.00, 1, 'D1686879613316977371', 1899.00);
INSERT INTO `order_detail` VALUES (56, 57444, '创维（Skyworth）42X6 42英寸10核智能酷开网络平板液晶电视（黑色）', 'http://image2.suning.cn/uimg/b2c/newcatentries/0070078057-000000000634917020_1_800x800.jpg', 1899.00, 1, 'D1686881644673208597', 1899.00);
INSERT INTO `order_detail` VALUES (57, 57193, 'YN跃能汽车擦车泥火山泥清洁美容用品工具漆面去飞漆橡皮泥去污泥洗车泥', 'http://image3.suning.cn/uimg/b2c/newcatentries/0070162011-000000000614383904_2_800x800.jpg', 23.00, 1, 'D1686883967738891120', 23.00);
INSERT INTO `order_detail` VALUES (58, 57193, 'YN跃能汽车擦车泥火山泥清洁美容用品工具漆面去飞漆橡皮泥去污泥洗车泥', 'http://image3.suning.cn/uimg/b2c/newcatentries/0070162011-000000000614383904_2_400x400.jpg', 23.00, 1, 'D1686884002643329418', 23.00);
INSERT INTO `order_detail` VALUES (59, 57193, 'YN跃能汽车擦车泥火山泥清洁美容用品工具漆面去飞漆橡皮泥去污泥洗车泥', 'http://image3.suning.cn/uimg/b2c/newcatentries/0070162011-000000000614383904_2_800x800.jpg', 23.00, 1, 'D1686884103975233332', 23.00);
INSERT INTO `order_detail` VALUES (60, 57193, 'YN跃能汽车擦车泥火山泥清洁美容用品工具漆面去飞漆橡皮泥去污泥洗车泥', 'http://image3.suning.cn/uimg/b2c/newcatentries/0070162011-000000000614383904_2_800x800.jpg', 23.00, 1, 'D1687250549105781104', 23.00);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `goods_id` int NOT NULL COMMENT '商品id',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品图片',
  `scan_time` date NOT NULL COMMENT '浏览日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (92, 27523, 'Edifier/漫步者 R201T08 多媒体有源2.1电脑音箱 木质低音炮音响', 219.00, 'http://image1.suning.cn/uimg/b2c/newcatentries/0000000000-000000000616816727_1_400x400.jpg', '2023-06-20');

SET FOREIGN_KEY_CHECKS = 1;
