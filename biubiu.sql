/*
 Navicat Premium Data Transfer

 Source Server         : biubiu
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : zcdev.xyz:3306
 Source Schema         : biubiu

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 11/10/2017 13:37:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barrage
-- ----------------------------
DROP TABLE IF EXISTS `barrage`;
CREATE TABLE `barrage` (
  `barrage_id` char(10) NOT NULL,
  `barrage_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `video_time_print` float NOT NULL,
  `barrage_speed` int(11) NOT NULL,
  `barrage_content` varchar(200) NOT NULL,
  `barrage_color` varchar(30) NOT NULL,
  `barrage_font_size` int(11) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `video_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`barrage_id`),
  KEY `video_id_index` (`video_id`) USING BTREE,
  KEY `FK_barrage_user_userid` (`user_id`),
  KEY `FK_barrage_video_videoid` (`video_id`),
  CONSTRAINT `FK_barrage_user_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_barrage_video_videoid` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of barrage
-- ----------------------------
BEGIN;
INSERT INTO `barrage` VALUES ('bg00483911', '2017-01-08 10:32:53', 1.18288, 190, '你的名字名字是？', '#ffffff', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg01521318', '2016-12-30 23:10:45', 34.8675, 190, 'ヾ(o◕∀◕)ﾉヾヽ(✿ﾟ▽ﾟ)ノヾ(≧O≦)〃嗷~', '#CC0066', 22, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg02969972', '2017-09-24 15:28:12', 41.5677, 190, '女主漂亮', '#ffffff', 22, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg03491700', '2017-01-09 14:40:02', 0, 290, 'fsahgdfashgfdghas1', '#FF0000', 29, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg03938040', '2017-01-09 14:34:04', 3.638, 190, 'cx', '#ffffff', 22, '13310666332', 'av62813213');
INSERT INTO `barrage` VALUES ('bg04074602', '2017-01-08 10:31:43', 28.1062, 190, '有人mae', '#CC66FF', 29, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg08539618', '2017-09-24 15:23:23', 134.971, 190, 'lalallalallalalalal', '#ffffff', 22, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg08563328', '2016-12-30 23:06:40', 39.8574, 190, '君名', '#CC0000', 22, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg08951793', '2017-01-08 10:31:00', 84.5383, 190, '口嚼酒', '#FF3399', 29, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg13349922', '2017-09-27 00:54:56', 52.934, 190, '🤑฿🦊😍🍌🦁🚨📸☸️🇦🇿🇦🇪🇦🇱🇦🇹😉🤗💋👄👄', '#ffffff', 22, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg21494256', '2017-01-09 14:34:48', 4.116, 190, 'saasasasa', '#ffffff', 22, '13310666332', 'av62813213');
INSERT INTO `barrage` VALUES ('bg21542063', '2017-01-08 10:31:36', 20.8686, 190, '三叶', '#CC66FF', 29, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg23443176', '2017-01-08 10:29:38', 107.925, 190, '你的明知是？', '#ffffff', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg26963028', '2017-01-08 10:33:20', 27.6171, 190, '三叶', '#ffffff', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg28604905', '2017-01-08 10:33:59', 36.7551, 190, '开心开心开心开心咖', '#660066', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg29754299', '2016-12-30 23:10:37', 27.6679, 190, 'ヾ(o◕∀◕)ﾉヾヽ(✿ﾟ▽ﾟ)ノヾ(≧O≦)〃嗷~', '#ffffff', 22, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg32145723', '2017-01-08 10:32:58', 5.59679, 190, 'your', '#ffffff', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg42145683', '2017-01-08 10:30:16', 40.6487, 190, 'your ame？', '#CC3300', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg42180879', '2017-01-08 10:33:16', 23.2589, 190, '噢噢噢噢噢噢噢噢噢噢', '#ffffff', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg43578666', '2017-09-24 15:18:51', 134.971, 190, 'lalallalallalalalal', '#ffffff', 22, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg44172390', '2017-01-08 10:33:31', 9.03818, 190, '三叶', '#660066', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg45315975', '2017-01-08 10:33:50', 27.4816, 190, 'kkkkkkkl', '#660066', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg49770032', '2017-01-08 11:17:20', 72.9569, 100, '大家好', '#CC0033', 29, '13061282760', 'av62813213');
INSERT INTO `barrage` VALUES ('bg49963566', '2017-01-08 10:33:06', 13.4483, 190, '啦啦啦啦啦啦啦啦啦啦啦', '#ffffff', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg50593738', '2017-01-08 10:31:30', 14.614, 190, '三叶', '#0000CC', 29, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg54107507', '2017-01-08 10:32:11', 56.1253, 190, 'your ame', '#CC6666', 29, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg54112536', '2017-01-08 12:32:36', 92.6658, 100, '大家好', '#CC0000', 29, '13061285656', 'av62813213');
INSERT INTO `barrage` VALUES ('bg56164795', '2017-10-06 03:38:35', 74.2602, 190, '恢复出厂', '#ffffff', 22, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg56779465', '2017-01-08 10:31:50', 35.2467, 190, 'your ame', '#CC66FF', 29, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg64063171', '2017-10-10 00:55:04', 34.2303, 190, '建军大业！！！！', '#ffffff', 22, '13061282764', 'av90747804');
INSERT INTO `barrage` VALUES ('bg64675945', '2017-01-08 10:29:47', 11.0594, 190, 'llllla', '#990033', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg68399833', '2017-01-08 10:29:47', 91.2145, 190, '啦啦啦啦', '#ffffff', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg68900728', '2017-01-08 10:29:47', 15.7867, 190, 'laaaalal', '#990033', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg69737694', '2017-01-08 10:32:45', 18.2402, 190, '你的名字名字是？', '#ffffff', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg76359332', '2017-01-08 10:33:54', 31.3684, 190, '开机开机开机开机开机', '#660066', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg76719939', '2016-12-30 23:08:29', 88.7668, 190, '哦哦哦哦哦哦', '#3300CC', 22, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg84320118', '2017-01-09 14:35:00', 16.436, 190, 'fdsfdsfdsfds', '#FFFF00', 29, '13310666332', 'av62813213');
INSERT INTO `barrage` VALUES ('bg85385091', '2017-01-08 10:29:59', 23.5209, 190, 'lalallal', '#CC3300', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg85891523', '2017-01-08 10:29:59', 65.1185, 190, '你的名字是？', '#CC6666', 29, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg86221422', '2017-01-08 10:33:00', 7.5899, 190, 'ame', '#ffffff', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg93482189', '2017-01-08 10:31:15', 17.3081, 190, '君明', '#FF3399', 29, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg94346189', '2016-12-30 23:06:54', 54.2149, 190, 'you name ?', '#CC0000', 29, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg96291668', '2016-12-30 23:07:04', 3.91595, 190, 'lalallall', '#ffffff', 22, '13061282767', 'av62813213');
INSERT INTO `barrage` VALUES ('bg98400595', '2017-01-08 10:33:41', 18.9914, 190, 'gongshui三叶', '#660066', 22, '13061282764', 'av62813213');
INSERT INTO `barrage` VALUES ('bg98400599', '2017-09-24 15:12:15', 134.971, 190, 'lalallalallalalalal', '#ffffff', 22, '13061282767', 'av62813213');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_gender` varchar(5) NOT NULL DEFAULT '保密',
  `user_birthday` date NOT NULL DEFAULT '1990-01-01',
  `avatar` varchar(100) DEFAULT 'head_pic/default.jpg',
  `room_id` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主播房间号',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `room_unique` (`room_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('13061282760', '新花儿', '123', '13061282760@qq.com', '保密', '2017-01-08', 'avatar/default.jpg', 00001);
INSERT INTO `user` VALUES ('13061282764', '小帅', '123', '13061282764@qq.com', '保密', '2017-01-08', 'avatar/default.jpg', 00002);
INSERT INTO `user` VALUES ('13061282767', '小美', '123', '13061282767@qq.com', '保密', '2017-01-08', 'avatar/touxinag1483850711434.jpg', 00003);
INSERT INTO `user` VALUES ('13061282769', '小赵', '123', '13061282769@qq.com', '保密', '2017-01-08', 'avatar/default.jpg', 00004);
COMMIT;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `video_id` char(10) NOT NULL,
  `video_title` varchar(200) NOT NULL,
  `video_path` varchar(300) DEFAULT 'video_cover/default.jpg',
  `video_cover_path` varchar(300) DEFAULT NULL,
  `video_watch_count` int(11) NOT NULL DEFAULT '0',
  `video_type` varchar(10) DEFAULT NULL,
  `is_diy` char(5) DEFAULT '转载',
  `video_upload_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  KEY `FK_video_user_userid` (`user_id`),
  CONSTRAINT `FK_video_user_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of video
-- ----------------------------
BEGIN;
INSERT INTO `video` VALUES ('av00786725', '【兰陵王妃】[彭冠英 张含韵] 邕锁番外之花絮 - 2 CUT', 'video/yourname.mp4', 'video_cover/【兰陵王妃】[彭冠英 张含韵] 邕锁番外之花絮 - 2 CUT1483002275898.jpg', 5, 'douga', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av01632818', '梦灯笼', 'video/yourname.mp4', 'video_cover/梦灯笼1483082580273.jpg', 5, 'douga', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av03623783', '堪比整容级别的瘦脸秘籍，1分钟淋巴按摩简单又有神效！', 'video/yourname.mp4', 'video_cover/堪比整容级别的瘦脸秘籍，1分钟淋巴按摩简单又有神效！1482981434262.jpg', 1, 'life', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av04351982', '广场11111', 'video/yourname.mp4', 'video_cover/VID_20150508_2007271483850728027.jpg', 2, 'life', '自制', '2017-01-01 14:34:48', '13061282767');
INSERT INTO `video` VALUES ('av04440025', '【楽小漫】Sis puella magica! 魔法少女小圆 【原创编舞】', 'video/yourname.mp4', 'video_cover/【楽小漫】Sis puella magica! 魔法少女小圆 【原创编舞】1482985110035.jpg', 1, 'fanju', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av05286507', '三星S8将用8G大内存，小米6或情人节发布，沪昆高铁开通—', 'video/yourname.mp4', 'video_cover/三星S8将用8G大内存，小米6或情人节发布，沪昆高铁开通—1482946909965.jpg', 18, 'technology', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av06910553', '就利达这段蝴蝶步我能看八百遍！！！', 'video/yourname.mp4', 'video_cover/就利达这段蝴蝶步我能看八百遍！！！1483009227205.jpg', 0, 'ent', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av07579621', '四分钟带你看完《我唾弃你的坟墓》一个极度残忍的复仇故事', 'video/yourname.mp4', 'video_cover/四分钟带你看完《我唾弃你的坟墓》一个极度残忍的复仇故事1483002277938.jpg', 45, 'douga', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av07770812', '【东京塔】生命之名 千与千寻【缅怀童年】', 'video/yourname.mp4', 'video_cover/【东京塔】生命之名 千与千寻【缅怀童年】1482989838357.jpg', 1, 'fashion', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av09231697', '【Top 10】伊万卡永远不想让你瞄到的十张照片@油兔不二字幕组', 'video/yourname.mp4', 'video_cover/【Top 10】伊万卡永远不想让你瞄到的十张照片@油兔不二字幕组1483009225256.jpg', 1, 'fashion', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av10127998', '梦灯笼', 'video/yourname.mp4', 'video_cover/梦灯笼1483019698148.jpg', 0, 'fashion', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av10943344', '【微小微】呼伦贝尔飞来一只布谷鸟', 'video/yourname.mp4', 'video_cover/【微小微】呼伦贝尔飞来一只布谷鸟1482985109735.jpg', 0, 'fashion', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av12045574', '【短篇】新海誠「某人的目光」【白月字幕组】', 'video/yourname.mp4', 'video_cover/【短篇】新海誠「某人的目光」【白月字幕组】1482910562070.jpg', 0, 'fanju', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av12339705', '新海诚啦啦啦', 'video/d092e3a8-aab4-4fb3-8397-545707776da9.mp4', 'video_cover/f9174298-8aa8-45e9-861b-7fa637ca5013.jpg', 2, 'douga', '转载', '2017-10-09 03:59:43', '13061282764');
INSERT INTO `video` VALUES ('av12779890', '【OW】你的守望先锋有这么燃吗？', 'video/yourname.mp4', 'video_cover/【OW】你的守望先锋有这么燃吗？1482920346490.jpg', 29, 'fanju', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av13526125', '买车家  Jeep全新指南者到底有没有广告中说的那么叼炸天？', 'video/yourname.mp4', 'video_cover/买车家  Jeep全新指南者到底有没有广告中说的那么叼炸天？1482946910104.jpg', 1, 'fanju', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av13709116', '四分钟告诉你：一个路人是如何因为《齐天大圣》对华晨宇转粉的！', 'video/yourname.mp4', 'video_cover/四分钟告诉你：一个路人是如何因为《齐天大圣》对华晨宇转粉的！1483009226674.jpg', 0, 'fanju', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av14326699', '《金刚狼之死》上', 'video/yourname.mp4', 'video_cover/《金刚狼之死》上1482910555252.jpg', 0, 'fanju', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av15159706', '齐木楠雄的灾难 第24话 ', 'video/yourname.mp4', 'video_cover/齐木楠雄的灾难 第24话 1482908854398.jpg', 0, 'fanju', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av16607384', '【迷之广告】你能猜出这是什么广告吗？2第五弹', 'video/yourname.mp4', 'video_cover/【迷之广告】你能猜出这是什么广告吗？2第五弹1482918958117.jpg', 0, 'fanju', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av18279642', '英雄联盟超燃大作', 'video/yourname.mp4', 'video_cover/英雄联盟超燃大作1483008242751.jpg', 1, 'dace', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av19548077', '【maka】恋dace❤️【逃避可耻但有用ED】', 'video/yourname.mp4', 'video_cover/%E3%80%90maka%E3%80%91%E6%81%8Bdance%E2%9D%A4%EF%B8%8F%E3%80%90%E9%80%83%E9%81%BF%E5%8F%AF%E8%80%BB%E4%BD%86%E6%9C%89%E7%94%A8ED%E3%80%911482985109405.jpg', 10, 'music', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av19967274', 'PPAP', 'video/yourname.mp4', 'video_cover/PPAP1482802961448.jpg', 3, 'music', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av19978495', '【突破次元壁】【第二弹】你可能从未见过如此真实的mmd', 'video/yourname.mp4', 'video_cover/【突破次元壁】【第二弹】你可能从未见过如此真实的mmd1482910562330.jpg', 0, 'music', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av20512979', '【华晨宇 齐天大圣】【大圣归来】生来为王，何惧风雨！', 'video/yourname.mp4', 'video_cover/【华晨宇 齐天大圣】【大圣归来】生来为王，何惧风雨！1483009226045.jpg', 0, 'music', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av22387582', '【爱情电影混剪】一百种方式说 我爱你', 'video/yourname.mp4', 'video_cover/【爱情电影混剪】一百种方式说 我爱你1483002276851.jpg', 0, 'music', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av22902106', '一头两用，鲁蛋数据线', 'video/yourname.mp4', 'video_cover/一头两用，鲁蛋数据线1482946909865.jpg', 2, 'music', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av22949720', '【你的名字非洲版】你叫什么？我的名字是Uvuvwevwevwe Oyeteyevwe ', 'video/yourname.mp4', 'video_cover/1482920346982.jpg', 25, 'douga', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av23762245', '【12月】封印者：Side Blacklambs 01', 'video/yourname.mp4', 'video_cover/【12月】封印者：Side Blacklambs 011482916929032.jpg', 0, 'music', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av24209678', '【Re-M!X】东京泰迪熊 （呐～你会爱这样的我吗？【原创编舞】', 'video/yourname.mp4', 'video_cover/【Re-M!X】东京泰迪熊 （呐～你会爱这样的我吗？【原创编舞】1482985109493.jpg', 0, 'dance', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av24210613', '要喝这可乐，需要勾搭人，实乃脱单神器', 'video/yourname.mp4', 'video_cover/要喝这可乐，需要勾搭人，实乃脱单神器1482946910351.jpg', 0, 'dance', '转载', '2017-01-01 14:34:48', '13061282769');
INSERT INTO `video` VALUES ('av25516496', '【初投稿】网骗养成，如何6分钟内靠化妆瘦10斤', 'video/yourname.mp4', 'video_cover/【初投稿】网骗养成，如何6分钟内靠化妆瘦10斤1482981431154.jpg', 0, 'dance', '转载', '2017-09-23 17:18:19', '13061282769');
INSERT INTO `video` VALUES ('av27284260', '百事17把乐带回家720P完整版 张一山杨紫 (2)', 'video/yourname.mp4', 'video_cover/百事17把乐带回家720P完整版 张一山杨紫 (2)1482918958314.jpg', 0, 'dance', '转载', '2017-09-23 17:18:19', '13061282769');
INSERT INTO `video` VALUES ('av30246246', '中国人在日本某学校表演空心书法，老师学生都说好厉害', 'video/yourname.mp4', 'video_cover/中国人在日本某学校表演空心书法，老师学生都说好厉害1482977829535.jpg', 0, 'dance', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av31525735', '【Ace阿册】《殊途·阴阳》——第一首原创单曲', 'video/yourname.mp4', 'video_cover/【Ace阿册】《殊途·阴阳》——第一首原创单曲1482989837489.jpg', 0, 'dance', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av31530077', '【绅士大概一分钟】山下33试做《你的名字。》中的口嚼酒，', 'video/yourname.mp4', 'video_cover/【绅士大概一分钟】山下33试做《你的名字。》中的口嚼酒，1482977829411.jpg', 23, 'dance', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av32019035', '韩国现实版“变形金刚”问世 或用于救灾行动', 'video/yourname.mp4', 'video_cover/韩国现实版“变形金刚”问世 或用于救灾行动1482946910590.jpg', 0, 'dance', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av32156386', '美国第一颗人造地球卫星探险者一号发射(丘比特C型火箭首飞)视频', 'video/yourname.mp4', 'video_cover/美国第一颗人造地球卫星探险者一号发射(丘比特C型火箭首飞)视频1482946910254.jpg', 0, 'game', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av32969952', '《天籁之战》第7期：神了！华晨宇魔性改编86版《西游记》', 'video/yourname.mp4', 'video_cover/《天籁之战》第7期：神了！华晨宇魔性改编86版《西游记》1482909519862.jpg', 0, 'game', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av33073515', '【1M舞室】May J合作Park虐狗浪漫情侣舞Say You Wo\'t Let Go', 'video/yourname.mp4', 'video_cover/%E3%80%901M%E8%88%9E%E5%AE%A4%E3%80%91May%20J%E5%90%88%E4%BD%9CPark%E8%99%90%E7%8B%97%E6%B5%AA%E6%BC%AB%E6%83%85%E4%BE%A3%E8%88%9ESay%20You%20Won%27t%20Let%20Go1482985109257.jpg', 1, 'game', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av33903442', '网络喷子的一天 - GTA5自制剧情短片', 'video/yourname.mp4', 'video_cover/网络喷子的一天 - GTA5自制剧情短片1483008241809.jpg', 0, 'game', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av39656472', '跑男第一套广播体操——梦想在召唤', 'video/yourname.mp4', 'video_cover/跑男第一套广播体操——梦想在召唤1483009227390.jpg', 1, 'technology', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av41512238', '广场123', 'video/yourname.mp4', 'video_cover/VID_20150509_1124011483842971221.jpg', 3, 'life', '自制', '2017-09-23 17:42:58', '13061282767');
INSERT INTO `video` VALUES ('av44526240', '【爱情公寓】HIGH歌', 'video/yourname.mp4', 'video_cover/【爱情公寓】HIGH歌1482920348335.jpg', 3, 'technology', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av45084061', '惊鸿一瞥--武侠江湖', 'video/yourname.mp4', 'video_cover/惊鸿一瞥--武侠江湖1483002278170.jpg', 1, 'technology', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av53521706', '【Ace阿册】《普通DISCO》', 'video/yourname.mp4', 'video_cover/【Ace阿册】《普通DISCO》1482989837016.jpg', 0, 'life', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av60886947', 'VID_20150508_200727', 'video/yourname.mp4', 'video_cover/VID_20150508_2007271482905012840.jpg', 1, 'kichiku', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av60967992', '我的滑板鞋', 'video/yourname.mp4', 'video_cover/我的滑板鞋1482802589021.jpg', 0, 'kichiku', '转载', '2017-09-23 17:18:19', '13061282769');
INSERT INTO `video` VALUES ('av62813213', '【你的名字极致画质1080p】超越时空的爱恋 只为寻找你的名字', 'video/yourname.mp4', 'video_cover/【你的名字极致画质1080p】超越时空的爱恋 只为寻找你的名字1482910555528.jpg', 528, 'douga', '转载', '2017-09-23 17:18:19', '13061282769');
INSERT INTO `video` VALUES ('av64798356', '两分钟看完《长城》 [DIVX 720p]', 'video/yourname.mp4', 'video_cover/两分钟看完《长城》 [DIVX 720p]1482974036480.jpg', 2, 'kichiku', '转载', '2017-09-23 17:18:19', '13061282769');
INSERT INTO `video` VALUES ('av65256901', '《天籁之战》第7期：神了！华晨宇魔性改编86版《西游记》', 'video/yourname.mp4', 'video_cover/《天籁之战》第7期：神了！华晨宇魔性改编86版《西游记》1483009224392.jpg', 0, 'ad', '转载', '2017-09-23 17:18:19', '13061282769');
INSERT INTO `video` VALUES ('av68054529', '【极乐净土】咬人猫有咩酱赤九玖❤155小分队o(≧▽≦)ツ', 'video/yourname.mp4', 'video_cover/【极乐净土】咬人猫有咩酱赤九玖❤155小分队o(≧▽≦)ツ1482985109846.jpg', 0, 'ad', '转载', '2017-09-23 17:18:19', '13061282769');
INSERT INTO `video` VALUES ('av68698752', '日本女子高中生跳逃跑可耻但有用 舞蹈', 'video/yourname.mp4', 'video_cover/日本女子高中生跳逃跑可耻但有用 舞蹈1482985110407.jpg', 0, 'ad', '转载', '2017-09-23 17:18:19', '13061282769');
INSERT INTO `video` VALUES ('av69017470', '秦时明月2 2', 'video/yourname.mp4', 'video_cover/秦时明月2 21482918958398.jpg', 0, 'ad', '转载', '2017-09-23 17:18:19', '13061282769');
INSERT INTO `video` VALUES ('av79318821', '两分钟看完《长城》 [DIVX 720p]', 'video/yourname.mp4', 'video_cover/两分钟看完《长城》 [DIVX 720p]1482853813398.jpg', 0, 'fashio', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av80548385', '2016康师傅加你加年味贺岁大片', 'video/yourname.mp4', 'video_cover/2016康师傅加你加年味贺岁大片1482918957682.jpg', 0, 'fashio', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av82050475', '【守望先锋】士兵76 VS 死神 - 说唱大战 - 作者JT Machiima', 'video/yourname.mp4', 'video_cover/【守望先锋】士兵76 VS 死神 - 说唱大战 - 作者JT Machiima1483008239907.jpg', 1, 'fashio', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av85063813', '【艦MMD】Lamb【島風】', 'video/yourname.mp4', 'video_cover/【艦MMD】Lamb【島風】1482910571770.jpg', 1, 'ent', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av85211061', 'VID_20150509_111933', 'video/yourname.mp4', 'video_cover/VID_20150509_1119331482860649246.jpg', 0, 'ent', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av85901610', '【党妹】逢年过节这么化，亲朋好友齐声夸！', 'video/yourname.mp4', 'video_cover/【党妹】逢年过节这么化，亲朋好友齐声夸！1482981430288.jpg', 0, 'ent', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av90747804', '建军大业(2017)', 'video/jianjundaye1.mp4', 'video_cover/13231242erwer.jpg', 9, 'film', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av93339739', '两分钟看完《长城》', 'video/yourname.mp4', 'video_cover/两分钟看完《长城》1483002277676.jpg', 0, 'film', '转载', '2017-09-23 17:42:58', '13061282769');
INSERT INTO `video` VALUES ('av94308519', '新物种——胖达兔～从来没见过这么胖的兔几！', 'video/yourname.mp4', 'video_cover/新物种——胖达兔～从来没见过这么胖的兔几！1482977829907.jpg', 0, 'film', '转载', '2017-09-23 17:42:58', '13061282769');
COMMIT;

-- ----------------------------
-- Table structure for video_favlist
-- ----------------------------
DROP TABLE IF EXISTS `video_favlist`;
CREATE TABLE `video_favlist` (
  `user_id` varchar(50) NOT NULL,
  `video_id` char(10) NOT NULL,
  `fav_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`video_id`),
  KEY `FK_videofavlist_video_videoid` (`video_id`),
  CONSTRAINT `FK_videofavlist_user_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_videofavlist_video_videoid` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for video_like
-- ----------------------------
DROP TABLE IF EXISTS `video_like`;
CREATE TABLE `video_like` (
  `user_id` varchar(50) NOT NULL,
  `video_id` char(10) NOT NULL,
  PRIMARY KEY (`user_id`,`video_id`),
  KEY `FK_videolike_video_videoid` (`video_id`),
  CONSTRAINT `FK_videolike_user_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_videolike_video_videoid` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
