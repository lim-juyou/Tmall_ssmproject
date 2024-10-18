/*
Navicat MySQL Data Transfer

Source Server         : jery
Source Server Version : 80036
Source Host           : localhost:3306
Source Database       : tmall_ssm

Target Server Type    : MYSQL
Target Server Version : 80036
File Encoding         : 65001

Date: 2024-10-18 17:58:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) NOT NULL COMMENT '分类的名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '女装 /内衣');
INSERT INTO `category` VALUES ('2', '男装 /运动户外');
INSERT INTO `category` VALUES ('3', '女鞋 /男鞋 /箱包');
INSERT INTO `category` VALUES ('4', '美妆 /个人护理');
INSERT INTO `category` VALUES ('5', '腕表 /眼镜 /珠宝饰品');
INSERT INTO `category` VALUES ('6', '手机 /数码 /电脑办公');
INSERT INTO `category` VALUES ('7', '母婴玩具');
INSERT INTO `category` VALUES ('8', '零食 /茶酒 /进口食品');
INSERT INTO `category` VALUES ('9', '生鲜水果');
INSERT INTO `category` VALUES ('10', '大家电 /生活电器');
INSERT INTO `category` VALUES ('11', '家具建材');
INSERT INTO `category` VALUES ('12', '汽车 /配件 /用品');
INSERT INTO `category` VALUES ('13', '家纺 /家饰 /鲜花');
INSERT INTO `category` VALUES ('14', '医药保健');
INSERT INTO `category` VALUES ('15', '厨具 /收纳 /宠物');
INSERT INTO `category` VALUES ('16', '图书音像');

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `order_code` varchar(255) NOT NULL COMMENT '订单号',
  `address` varchar(255) NOT NULL COMMENT '收货地址',
  `post` varchar(255) NOT NULL COMMENT '邮编',
  `receiver` varchar(255) NOT NULL COMMENT '收货人姓名',
  `mobile` varchar(255) NOT NULL COMMENT '手机号码',
  `user_message` varchar(255) NOT NULL COMMENT '用户备注的信息',
  `create_date` datetime NOT NULL COMMENT '订单创建时间',
  `pay_date` datetime DEFAULT NULL COMMENT '订单支付时间',
  `delivery_date` datetime DEFAULT NULL COMMENT '发货日期',
  `confirm_date` datetime DEFAULT NULL COMMENT '确认收货日期',
  `user_id` int DEFAULT NULL COMMENT '对应的用户id',
  `status` varchar(255) NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES ('1', '123456', '地球村', '', '陈雷', '19283218921', '', '1996-11-30 00:00:00', '2018-04-29 00:00:00', '2024-09-04 00:00:00', '2024-09-08 00:00:00', '1', 'delete');
INSERT INTO `order_` VALUES ('10', '20180506143826504', '123123', '', '周沿雄', '18984219921', '', '2018-05-06 00:00:00', '2018-05-06 00:00:00', '2024-09-24 17:32:28', '2024-09-27 17:32:40', '1', 'delete');
INSERT INTO `order_` VALUES ('11', '20180507092435428', '详细地址', '', '赵正泽', '12345678910', '卖家留言', '2022-01-01 00:00:00', '2024-09-01 00:00:00', '2024-09-18 17:31:42', '2024-10-20 17:32:22', '1', 'delete');
INSERT INTO `order_` VALUES ('12', '20180507180327444', '123', '', '赵正泽', '12345678910', '', '2024-09-03 00:00:00', '2023-08-01 00:00:00', '2024-09-21 00:00:00', '2024-09-25 00:00:00', '1', 'delete');
INSERT INTO `order_` VALUES ('13', '20180507205110309', '地球', '', '周沿雄', '18984219921', '', '2024-09-04 00:00:00', '2024-10-18 00:00:00', '2024-10-01 17:31:19', '2024-10-05 17:31:33', '1', 'delete');
INSERT INTO `order_` VALUES ('14', '20180716093257383', '火星', '', '陈雷', '19283218921', '', '2024-09-27 00:00:00', '2024-10-11 00:00:00', '2024-10-07 22:18:27', '2024-10-11 17:31:10', '4', 'waitConfirm');
INSERT INTO `order_` VALUES ('15', '20241007220630788', 'no where', '', '李福海', '17879706805', '', '2024-10-07 22:06:31', '2024-10-14 17:30:17', '2024-10-15 17:30:27', '2024-10-23 21:31:01', '1', 'waitPay');
INSERT INTO `order_` VALUES ('16', '20241007220700609', '人民大道58号\r\n19栋学生公寓', '0000', '李福海', '17879706805', '', '2024-10-07 00:00:00', '2024-10-07 22:07:02', '2024-10-08 17:30:34', '2024-10-15 17:30:43', '1', 'waitDelivery');
INSERT INTO `order_` VALUES ('17', '20241018171738298', '人民大道58号\r\n19栋学生公寓', '0000', '李福海', '17879706805', '', '2024-10-18 00:00:00', '2024-10-18 00:00:00', '2024-10-18 17:23:07', '2024-10-18 17:28:58', '6', 'waitConfirm');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int NOT NULL COMMENT '对应产品id',
  `order_id` int DEFAULT NULL COMMENT '对应订单id',
  `user_id` int NOT NULL COMMENT '对应用户id',
  `number` int DEFAULT NULL COMMENT '对应产品购买的数量',
  PRIMARY KEY (`id`),
  KEY `fk_order_item_product` (`product_id`),
  KEY `fk_order_item_order` (`order_id`),
  KEY `fk_order_item_user` (`user_id`),
  CONSTRAINT `fk_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `order_` (`id`),
  CONSTRAINT `fk_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_order_item_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('14', '5', '11', '1', '1');
INSERT INTO `order_item` VALUES ('15', '6', '11', '1', '1');
INSERT INTO `order_item` VALUES ('16', '4', null, '1', '6');
INSERT INTO `order_item` VALUES ('17', '4', '12', '1', '1');
INSERT INTO `order_item` VALUES ('18', '8', '13', '1', '1');
INSERT INTO `order_item` VALUES ('19', '5', '14', '4', '1');
INSERT INTO `order_item` VALUES ('20', '4', '16', '1', '1');
INSERT INTO `order_item` VALUES ('21', '5', null, '6', '2');
INSERT INTO `order_item` VALUES ('22', '5', '17', '6', '1');
INSERT INTO `order_item` VALUES ('23', '4', null, '6', '1');
INSERT INTO `order_item` VALUES ('24', '33', null, '6', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) NOT NULL COMMENT '产品的名称',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '小标题',
  `price` float DEFAULT NULL COMMENT '价格',
  `sale` int DEFAULT NULL COMMENT '销量',
  `stock` int DEFAULT NULL COMMENT '库存',
  `category_id` int DEFAULT NULL COMMENT '对应的分类id',
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('4', 'ARDENCODE明星同款大宽松休闲廓形白色西装外套OS宽肩西服 X1版', 'ARDENCODE取自法语中的ARDENT意为“燃烧”、“破坏”', '960', '999', '9999', '1');
INSERT INTO `product` VALUES ('5', '\r\n【戈聲代购】现货葬送的芙莉莲 AVIOT TE-Q3-FRR 联名蓝牙TWS耳机', '葬送的芙莉莲', '1399', '999', '9999', '6');
INSERT INTO `product` VALUES ('6', '【畅玩黑悟空】华硕天选5 Pro 14代英特尔i9酷睿HX 16英寸游戏本笔记本电脑RTX4060显卡天选4学生设计电竞本', '华硕天选5pro', '8999', '999', '9999', '6');
INSERT INTO `product` VALUES ('7', '\r\n优衣库女装刺绣衬衫/7分袖休闲衬衣收腰插肩袖上衣24新款469443', '1件装99元！收藏加购优先发货！', '99', '999', '9999', '1');
INSERT INTO `product` VALUES ('8', '\r\nLACOSTE法国鳄鱼男女同款24夏季新款时尚印花纯棉短袖T恤|TH0135', '致敬Lacotse深厚传承和标志性的鳄鱼文化', '890', '999', '9999', '1');
INSERT INTO `product` VALUES ('9', '\r\n【帅克衫】CK Jeans24秋季男士休闲复古宽松凉感牛仔夹克J326068', 'Calvin Klein', '1380', '999', '999', '2');
INSERT INTO `product` VALUES ('10', 'Play\r\n00:06\r\n00:20\r\n\r\nICH MODE 美式复古重磅连帽卫衣开衫女宽松百搭休闲外套秋季新款', '宽松型 棉60%，聚酯纤维40%', '138', '999', '99999', '1');
INSERT INTO `product` VALUES ('11', '\r\n【徐若晗同款】CGUK蝴蝶印花打底背心百搭修身吊带背心', '修身型 棉99.4% 氨纶4.6%', '280', '999', '10000', '1');
INSERT INTO `product` VALUES ('12', '\r\n【舒适纯棉】Hazzys哈吉斯24夏季短袖polo休闲潮流简约撞色T恤男', '其他休闲', '710', '999', '9999', '2');
INSERT INTO `product` VALUES ('13', '\r\nPlay\r\n00:05\r\n00:16\r\n\r\n【防晒】Hazzys哈吉斯2024夏季新款男士裤子休闲短裤潮流运动裤子', '', '990', '999', '1000', '2');
INSERT INTO `product` VALUES ('14', '\r\nLACOSTE法国鳄鱼男女同款24夏季新款商务休闲短袖T恤POLO|PH3450', '', '1390', '999', '800', '2');
INSERT INTO `product` VALUES ('15', 'LACOSTE法国鳄鱼男装24夏季新款时尚logo印花拼色短袖衬衫|CH7225', '', '1390', '999', '880', '2');
INSERT INTO `product` VALUES ('16', '安踏飞梦丨革网软底跑步鞋女秋冬轻便减震慢跑运动鞋通勤鞋子女鞋', '', '149', '999', '9999', '3');
INSERT INTO `product` VALUES ('17', '\r\nFILA 斐乐官方帕尼尼女鞋运动鞋男鞋篮球鞋休闲老爹鞋PANINI鞋子', '', '599', '999', '99999', '3');
INSERT INTO `product` VALUES ('18', '\r\n【品牌授权】COACH/蔻驰女士新款麻将包质感小挎包手提斜挎包正品', '', '1120', '999', '9999', '3');
INSERT INTO `product` VALUES ('19', '日本直邮[高 1000 日元优惠券] Roncato 行李箱手提包男式女式 63', '', '9319', '999', '9999', '3');
INSERT INTO `product` VALUES ('20', '\r\n骏辰体育正品泉州r仓NikeAir Monarch 4男鞋运动老爹鞋AV6676-100', '', '9999', '999', '1000', '3');
INSERT INTO `product` VALUES ('21', '双11加购】OLAY玉兰油超抗美白水乳精华夏季抗氧补水爽肤水乳液', '', '499', '999', '9999', '4');
INSERT INTO `product` VALUES ('22', '\r\n【双11抢先加购】YSL圣罗兰高定皮革四色眼影 塞纳河的夜800', '', '680', '999', '9999', '4');
INSERT INTO `product` VALUES ('23', '抢先加购】CHANEL 香奈儿魅力丝绒唇膏 哑光滋润口红黑管63/58', null, '400', '999', '9999', '4');
INSERT INTO `product` VALUES ('24', '\r\n【双11抢先加购】阿玛尼黑钥匙乳霜轻盈修护面霜抗老紧致抗皱正品', null, '3380', '999', '99999', '4');
INSERT INTO `product` VALUES ('25', '送抗脱洗发水｜章小惠myorganics有机抗脱活力安瓶固发头皮精油', null, '599', '999', '9999', '4');
INSERT INTO `product` VALUES ('26', '劳力士绿水鬼潜航者型正品男表自动机械手表男士腕表', null, '115800', '999', '88888', '5');
INSERT INTO `product` VALUES ('27', '正品雅典闹铃大教堂鎏金系列玫瑰金自动机械男士腕表', null, '98700', '999', '99999', '5');
INSERT INTO `product` VALUES ('28', '苹果Apple Vision Pro美行正品M2芯片全新R1芯片头戴显示器VR眼镜', null, '25000', '999', '99999', '5');
INSERT INTO `product` VALUES ('29', '\r\nTAOHUA/素颜大方框 遮脸显瘦！24s玳瑁色 黑色方框素颜眼镜 #1874', null, '9999', '999', '99999', '5');
INSERT INTO `product` VALUES ('30', '【QUEENA.Z】 罗马之恋 大师级意大利工坊美松项链', null, '1000000000', '999', '9999', '5');
INSERT INTO `product` VALUES ('31', 'Apple/苹果 iPhone 16 Pro', null, '7999', '999', '999', '6');
INSERT INTO `product` VALUES ('32', '\r\nLeica/徕卡M11-D莱卡M11D旁轴数码相机单反专业全画幅微单', null, '73800', '999', '999', '6');
INSERT INTO `product` VALUES ('33', '华为三折叠手机非凡大师matext折叠手机新款华为matext三折叠手机', null, '29999', '999', '999', '6');
INSERT INTO `product` VALUES ('34', '\r\n【阿里官方自营】Pura 70 Pro手机华为官方旗舰店鸿蒙系统 北斗卫星消息 华为官方旗舰店华为P70旗舰手机', null, '5999', '999', '999', '6');
INSERT INTO `product` VALUES ('35', '\r\n【至高优惠500元】小米14Ultra手机新品新款上市小米徕卡联合研发小米官方旗舰店官网正品高通骁龙8Gen3', null, '5999', '999', '999', '6');
INSERT INTO `product` VALUES ('36', '\r\n【至高享24期免息】Samsung/三星 Galaxy S24 Ultra 拍照游戏AI大屏商用智能手机 2亿像素 旗舰新品', null, '9699', '999', '9999', '6');
INSERT INTO `product` VALUES ('37', '【24期免息】vivo X100 Ultra新品旗舰蔡司2亿APO超级长焦第三代骁龙8闪充拍照手机官网官方vivox100ultra', null, '6199', '999', '9999', '6');
INSERT INTO `product` VALUES ('38', 'OPPO Find X7 Ultra旗舰手机oppo官方旗舰店oppo手机官网商务曲面屏oppofindx7ultra卫星通信 5.5G拍照AI手机', null, '5999', '999', '9999', '6');
INSERT INTO `product` VALUES ('39', '【购机立减600元】HONOR/荣耀Magic6 Pro 5G手机 第三代骁龙8芯片/荣耀鸿燕通信/荣耀巨犀玻璃/官方旗舰店', null, '5699', '999', '9999', '6');
INSERT INTO `product` VALUES ('40', '\r\n华为MateBook GT 14酷睿Ultra 115W高性能上午学生游戏笔记本电脑', null, '6999', '999', '9999', '6');
INSERT INTO `product` VALUES ('41', '外星人M18R2笔记本电脑代购X16Alienware游戏本4090美行2024', null, '24999', '999', '9999', '6');
INSERT INTO `product` VALUES ('42', '\r\nROG幻14 Air锐龙R9-8945HS RTX4060 14英寸2.8K OLED星云屏120Hz轻薄游戏笔记本电脑玩家国度', null, '14999', '999', '9999', '6');
INSERT INTO `product` VALUES ('43', 'kaichi凯驰新生儿手摇铃礼盒宝宝0-1岁3月磨牙胶可咬安抚婴儿玩具', null, '199', '999', '9999', '7');
INSERT INTO `product` VALUES ('44', '\r\n【150ml金桂梅见】12度桂花酒低度微醺梅子酒梅酒晚安果酒伴手礼', null, '19.9', '999', '9999', '8');
INSERT INTO `product` VALUES ('45', '【新鲜水果】福建爱媛28号红美人果冻橙3斤装果径65mm起美味多汁', null, '29.9', '999', '9999', '9');
INSERT INTO `product` VALUES ('46', '\r\nHitachi/日立 R-ZXC750KC/ZX750KC/GWC670TC日本原装进口家用冰箱', null, '22500', '999', '9999', '10');
INSERT INTO `product` VALUES ('47', '喜临门奶油风无床头悬浮床现代简约轻奢实木床婚床主卧大床仙女床', null, '3940', '999', '9999', '11');
INSERT INTO `product` VALUES ('48', '\r\n购车订金Volvo S90 沃尔沃汽车', null, '2000', '999', '9999', '12');
INSERT INTO `product` VALUES ('49', '罗莱家纺航天控温95鹅绒羽绒被春秋夏凉空调被芯防钻绒单双人床', null, '3329', '999', '9999', '13');
INSERT INTO `product` VALUES ('50', '\r\n【希爱力】他达拉非片 5mg*28片/盒', null, '529', '999', '9999', '14');
INSERT INTO `product` VALUES ('51', '\r\n美国DLOVE 【无须肝代谢】宠物辅酶Q10猫咪狗医心脏肥大犬用保健', null, '139', '999', '9999', '15');
INSERT INTO `product` VALUES ('52', '\r\n光与影视觉书系列 会动的3D立体图片书 极地 英文原版 Polar A Photicular Book 买极地赠愉快【中商原版】', null, '137', '999', '9999', '16');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int DEFAULT NULL COMMENT '对应的产品id',
  PRIMARY KEY (`id`),
  KEY `fk_product_image_product` (`product_id`),
  CONSTRAINT `fk_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('11', '4');
INSERT INTO `product_image` VALUES ('12', '4');
INSERT INTO `product_image` VALUES ('13', '4');
INSERT INTO `product_image` VALUES ('14', '4');
INSERT INTO `product_image` VALUES ('15', '4');
INSERT INTO `product_image` VALUES ('16', '5');
INSERT INTO `product_image` VALUES ('17', '5');
INSERT INTO `product_image` VALUES ('18', '5');
INSERT INTO `product_image` VALUES ('19', '5');
INSERT INTO `product_image` VALUES ('20', '5');
INSERT INTO `product_image` VALUES ('21', '6');
INSERT INTO `product_image` VALUES ('22', '6');
INSERT INTO `product_image` VALUES ('23', '6');
INSERT INTO `product_image` VALUES ('24', '6');
INSERT INTO `product_image` VALUES ('25', '6');
INSERT INTO `product_image` VALUES ('26', '7');
INSERT INTO `product_image` VALUES ('27', '7');
INSERT INTO `product_image` VALUES ('28', '7');
INSERT INTO `product_image` VALUES ('29', '7');
INSERT INTO `product_image` VALUES ('30', '7');
INSERT INTO `product_image` VALUES ('31', '8');
INSERT INTO `product_image` VALUES ('32', '8');
INSERT INTO `product_image` VALUES ('33', '8');
INSERT INTO `product_image` VALUES ('34', '8');
INSERT INTO `product_image` VALUES ('35', '8');
INSERT INTO `product_image` VALUES ('36', '9');
INSERT INTO `product_image` VALUES ('37', '9');
INSERT INTO `product_image` VALUES ('38', '9');
INSERT INTO `product_image` VALUES ('39', '9');
INSERT INTO `product_image` VALUES ('40', '9');
INSERT INTO `product_image` VALUES ('41', '10');
INSERT INTO `product_image` VALUES ('42', '10');
INSERT INTO `product_image` VALUES ('43', '10');
INSERT INTO `product_image` VALUES ('44', '10');
INSERT INTO `product_image` VALUES ('45', '10');
INSERT INTO `product_image` VALUES ('46', '11');
INSERT INTO `product_image` VALUES ('47', '11');
INSERT INTO `product_image` VALUES ('48', '11');
INSERT INTO `product_image` VALUES ('49', '11');
INSERT INTO `product_image` VALUES ('50', '11');
INSERT INTO `product_image` VALUES ('51', '12');
INSERT INTO `product_image` VALUES ('52', '12');
INSERT INTO `product_image` VALUES ('53', '12');
INSERT INTO `product_image` VALUES ('54', '12');
INSERT INTO `product_image` VALUES ('55', '12');
INSERT INTO `product_image` VALUES ('56', '13');
INSERT INTO `product_image` VALUES ('57', '13');
INSERT INTO `product_image` VALUES ('58', '13');
INSERT INTO `product_image` VALUES ('59', '13');
INSERT INTO `product_image` VALUES ('60', '13');
INSERT INTO `product_image` VALUES ('61', '14');
INSERT INTO `product_image` VALUES ('62', '14');
INSERT INTO `product_image` VALUES ('63', '14');
INSERT INTO `product_image` VALUES ('64', '14');
INSERT INTO `product_image` VALUES ('65', '14');
INSERT INTO `product_image` VALUES ('66', '15');
INSERT INTO `product_image` VALUES ('67', '15');
INSERT INTO `product_image` VALUES ('68', '15');
INSERT INTO `product_image` VALUES ('69', '15');
INSERT INTO `product_image` VALUES ('70', '15');
INSERT INTO `product_image` VALUES ('71', '16');
INSERT INTO `product_image` VALUES ('72', '16');
INSERT INTO `product_image` VALUES ('73', '16');
INSERT INTO `product_image` VALUES ('74', '16');
INSERT INTO `product_image` VALUES ('75', '16');
INSERT INTO `product_image` VALUES ('76', '17');
INSERT INTO `product_image` VALUES ('77', '17');
INSERT INTO `product_image` VALUES ('78', '17');
INSERT INTO `product_image` VALUES ('79', '17');
INSERT INTO `product_image` VALUES ('80', '17');
INSERT INTO `product_image` VALUES ('81', '18');
INSERT INTO `product_image` VALUES ('82', '18');
INSERT INTO `product_image` VALUES ('83', '18');
INSERT INTO `product_image` VALUES ('84', '18');
INSERT INTO `product_image` VALUES ('85', '18');
INSERT INTO `product_image` VALUES ('86', '19');
INSERT INTO `product_image` VALUES ('87', '19');
INSERT INTO `product_image` VALUES ('88', '19');
INSERT INTO `product_image` VALUES ('89', '19');
INSERT INTO `product_image` VALUES ('90', '19');
INSERT INTO `product_image` VALUES ('91', '20');
INSERT INTO `product_image` VALUES ('92', '20');
INSERT INTO `product_image` VALUES ('93', '20');
INSERT INTO `product_image` VALUES ('94', '20');
INSERT INTO `product_image` VALUES ('95', '20');
INSERT INTO `product_image` VALUES ('96', '21');
INSERT INTO `product_image` VALUES ('97', '21');
INSERT INTO `product_image` VALUES ('98', '21');
INSERT INTO `product_image` VALUES ('99', '21');
INSERT INTO `product_image` VALUES ('100', '21');
INSERT INTO `product_image` VALUES ('101', '22');
INSERT INTO `product_image` VALUES ('102', '22');
INSERT INTO `product_image` VALUES ('103', '22');
INSERT INTO `product_image` VALUES ('104', '22');
INSERT INTO `product_image` VALUES ('105', '22');

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `category_id` int NOT NULL COMMENT '对应的分类id',
  PRIMARY KEY (`id`),
  KEY `fk_property_category` (`category_id`),
  CONSTRAINT `fk_property_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('1', '尺寸', '1');
INSERT INTO `property` VALUES ('2', '厚薄', '1');
INSERT INTO `property` VALUES ('3', '材质成分', '1');
INSERT INTO `property` VALUES ('4', '货号', '1');
INSERT INTO `property` VALUES ('5', '基础风格', '1');
INSERT INTO `property` VALUES ('6', '品牌', '1');

-- ----------------------------
-- Table structure for property_value
-- ----------------------------
DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int NOT NULL COMMENT '对应产品id',
  `property_id` int NOT NULL COMMENT '对应属性id',
  `value` varchar(255) DEFAULT NULL COMMENT '具体的属性值',
  PRIMARY KEY (`id`),
  KEY `fk_property_value_property` (`property_id`),
  KEY `fk_property_value_product` (`product_id`),
  CONSTRAINT `fk_property_value_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_property_value_property` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of property_value
-- ----------------------------
INSERT INTO `property_value` VALUES ('1', '4', '1', 'L M XL XLL');
INSERT INTO `property_value` VALUES ('2', '4', '2', '常规');
INSERT INTO `property_value` VALUES ('3', '4', '3', '棉66% 聚酯纤维34%');
INSERT INTO `property_value` VALUES ('4', '4', '4', 'UQ404133000');
INSERT INTO `property_value` VALUES ('5', '4', '5', '其他');
INSERT INTO `property_value` VALUES ('6', '4', '6', 'Uniqlo/优衣库');

-- ----------------------------
-- Table structure for referal_link
-- ----------------------------
DROP TABLE IF EXISTS `referal_link`;
CREATE TABLE `referal_link` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `text` varchar(255) NOT NULL COMMENT '超链显示的文字',
  `link` varchar(255) NOT NULL COMMENT '超链的地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of referal_link
-- ----------------------------
INSERT INTO `referal_link` VALUES ('1', '天猫超市', 'https://chaoshi.tmall.com/?targetPage=index&spm=a21bo.tmall%2Fa.201859.2.6614c3d5EEiinR');
INSERT INTO `referal_link` VALUES ('2', '电器城', '#nowhere');
INSERT INTO `referal_link` VALUES ('3', '喵鲜生', '#nowhere');
INSERT INTO `referal_link` VALUES ('4', '医药馆', '#nowhere');
INSERT INTO `referal_link` VALUES ('5', '营业厅', '#nowhere');
INSERT INTO `referal_link` VALUES ('6', '魅力惠', '#nowhere');
INSERT INTO `referal_link` VALUES ('7', '飞猪旅游', '#nowhere');
INSERT INTO `referal_link` VALUES ('8', '苏宁易购', '#nowhere');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `content` varchar(4000) DEFAULT NULL COMMENT '评价内容',
  `user_id` int NOT NULL COMMENT '对应的用户id',
  `product_id` int NOT NULL COMMENT '对应的产品id',
  `createDate` datetime DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`),
  KEY `fk_review_product` (`product_id`),
  KEY `fk_review_user` (`user_id`),
  CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('2', '这款短袖T恤不错哦，没想到买的号码挺准。上身效果好看，特别时尚休闲。和图片上的一样，没色差，衣服料子很好，没线头，布料是棉的，摸起来舒服，比想象的要厚实。朋友们都说好看，款式简洁大方。真的是超级赞，以后就认准这家啦，有想买的亲赶快下手哦。我是这的老顾客了，这家产品确实一直棒棒的哦。', '1', '4', '2024-09-01 10:24:02');
INSERT INTO `review` VALUES ('3', '比较轻薄，质量蛮好的，穿起来还是比较舒适，很合身，价格也实惠！', '1', '4', '2024-09-08 10:42:07');
INSERT INTO `review` VALUES ('6', '上身效果很好', '3', '6', '2024-09-17 10:49:09');
INSERT INTO `review` VALUES ('7', '评价一个', '1', '6', '2024-09-20 11:01:06');
INSERT INTO `review` VALUES ('8', 'qw54e5qwe4qw6eq4eqewq', '1', '4', '2024-09-29 18:05:09');
INSERT INTO `review` VALUES ('9', '当评价完成之后，可以看到其他用户的评价信息', '1', '4', '2024-10-01 20:59:49');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) NOT NULL COMMENT '用户名称',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Luc', '12345678');
INSERT INTO `user` VALUES ('2', 'JOJO', '123');
INSERT INTO `user` VALUES ('3', '测试账号', '123');
INSERT INTO `user` VALUES ('4', 'zyx', '123');
INSERT INTO `user` VALUES ('5', 'Lim', '123456');
INSERT INTO `user` VALUES ('6', 'json', '1234');
