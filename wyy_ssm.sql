/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm`;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `nickName` varchar(25) DEFAULT NULL COMMENT '昵称',
  `phoneNum` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `member` */

insert  into `member`(`id`,`name`,`nickName`,`phoneNum`,`email`) values (1,'张三','小三','1388888888','zhangsan@QQ.com'),(2,'李四','小四','1554457785','12362517@qq.com');

/*Table structure for table `order_traveller` */

DROP TABLE IF EXISTS `order_traveller`;

CREATE TABLE `order_traveller` (
  `orderId` varchar(32) DEFAULT NULL,
  `travellerId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_traveller` */

insert  into `order_traveller`(`orderId`,`travellerId`) values ('1','1'),('2','2'),('3','1'),('4','1'),('5','2'),('6','1'),('7','2'),('8','1'),('9','2');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NULL DEFAULT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_o_p` (`productId`) USING BTREE,
  KEY `fk_o_m` (`memberId`) USING BTREE,
  CONSTRAINT `fk_o_m` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`),
  CONSTRAINT `fk_o_p` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `orders` */

insert  into `orders`(`id`,`orderNum`,`orderTime`,`peopleCount`,`orderDesc`,`payType`,`orderStatus`,`productId`,`memberId`) values (1,'12345','2018-02-03 00:00:00',2,'没什么',0,1,1,1),(2,'12346','2020-04-15 11:15:17',2,'没什么',0,1,2,2),(3,'12347','2018-02-03 00:00:00',5,'免费游玩，想去',0,1,3,2),(4,'12348','2020-07-15 11:14:11',12,'集体出游',0,1,4,1),(5,'12349','2020-07-02 11:14:44',4,'家庭聚会',0,1,5,1),(6,'12350','2020-07-01 11:15:17',6,'邀请亲朋好友一起玩',0,1,6,2);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23531 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `permission` */

insert  into `permission`(`id`,`permissionName`,`url`) values (107,'角色管理权限','/role/findAll.do'),(1943,'资源权限管理','/permission/findAll.do'),(23527,'用户管理权限','/user/findAll.do'),(23528,'商品管理权限','/product/findAll.do'),(23529,'日志管理权限','/sysLog/findAll.do'),(23530,'查询全部角色权限','/role/findAll.do');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` date DEFAULT NULL,
  `productPrice` double(11,0) DEFAULT NULL,
  `productDesc` varchar(250) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `product` */

insert  into `product`(`id`,`productNum`,`productName`,`cityName`,`DepartureTime`,`productPrice`,`productDesc`,`productStatus`) values (1,'001','云南一日游','云南','2020-04-07',2100,'云南欢迎你',0),(2,'002','昆明三日游','昆明','2020-06-06',1800,'昆明欢迎你',1),(3,'003','上海一日游','上海','2020-05-08',3800,'魔都欢迎你',1),(4,'004','北京三日游','北京','2020-05-09',5800,'北京我来了',1),(5,'005','深圳七日游','昆明','2020-04-07',18000,'深圳欢迎你',1),(6,'006','昭通一日游','昭通','2020-05-08',1200,'昭通大山包',0),(7,'007','丽江一日游','昆明','2020-06-04',1500,'丽江古镇',0),(8,'111','女儿国一日游','大唐','1920-06-07',1314,'免费游玩',1),(9,'9','临港一日游','上海','2021-03-05',100,'阿萨德',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  `roleDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `role` */

insert  into `role`(`id`,`roleName`,`roleDesc`) values (1,'ADMIN','系统管理员'),(2,'USER','普通用户'),(3,'King','总统权限(无视一切防御)'),(4,'guest','测试账户');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`) USING BTREE,
  KEY `r_id` (`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `role_permission` */

insert  into `role_permission`(`permissionId`,`roleId`) values (107,1),(1943,1),(23527,1),(23528,1),(23528,2),(107,3),(1943,3),(23527,3),(23528,3),(23529,3),(107,4),(23529,4),(23530,4);

/*Table structure for table `syslog` */

DROP TABLE IF EXISTS `syslog`;

CREATE TABLE `syslog` (
  `id` int(70) NOT NULL AUTO_INCREMENT,
  `visitTime` datetime DEFAULT NULL COMMENT '访问时间',
  `username` varchar(50) DEFAULT NULL COMMENT '操作者用户名',
  `ip` varchar(40) DEFAULT NULL COMMENT '访问ip',
  `url` varchar(40) DEFAULT NULL COMMENT '访问资源url',
  `executionTime` int(11) DEFAULT NULL COMMENT '执行时长',
  `method` varchar(255) DEFAULT NULL COMMENT '访问方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `syslog` */

insert  into `syslog`(`id`,`visitTime`,`username`,`ip`,`url`,`executionTime`,`method`) values (94,'2020-07-18 10:58:57','user','0:0:0:0:0:0:0:1','/product/findAll.do',8,'[类名] com.lindaifeng.ssm.controller.ProductController[方法名] findAll'),(95,'2020-07-18 10:59:02','user','0:0:0:0:0:0:0:1','/orders/findAll.do',7,'[类名] com.lindaifeng.ssm.controller.OrderController[方法名] findAll'),(96,'2020-07-18 11:07:08','user','0:0:0:0:0:0:0:1','/orders/findAll.do',8,'[类名] com.lindaifeng.ssm.controller.OrderController[方法名] findAll'),(97,'2020-07-18 11:16:40','root','0:0:0:0:0:0:0:1','/role/findAll.do',9,'[类名] com.lindaifeng.ssm.controller.RoleController[方法名] findAll'),(98,'2021-03-07 21:46:30','tom','0:0:0:0:0:0:0:1','/product/findAll.do',37,'[类名] com.bsyc.ssm.controller.ProductController[方法名] findAll'),(99,'2021-03-07 21:57:33','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',44,'[类名] com.bsyc.ssm.controller.SysLogController[方法名] findAll'),(100,'2021-03-07 21:58:35','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',3,'[类名] com.bsyc.ssm.controller.SysLogController[方法名] findAll');

/*Table structure for table `traveller` */

DROP TABLE IF EXISTS `traveller`;

CREATE TABLE `traveller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL COMMENT '证件类型 0身份证 1护照 2军官证',
  `credentialsNum` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `travellerType` int(11) DEFAULT NULL COMMENT '旅客类型(人群) 0 成人 1 儿童',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `traveller` */

insert  into `traveller`(`id`,`name`,`sex`,`phoneNum`,`credentialsType`,`credentialsNum`,`travellerType`) values (1,'赵龙','男','13888888888',0,'123456789009876543',0),(2,'天猫','女','14516455587',0,'154563554425887745',0);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态0 未开启 1 开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20617 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`username`,`password`,`phoneNum`,`status`) values (1,'a@qq.com','admin','$2a$10$WOkSm4.XeroznuNnb8iY3O8IHbg85NwMMrl2OJPo8V0ZH0VX6/IDy','13888888888',1),(2,'adfa','tom','$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe','546514684',1),(3,'1847481@QQ.com','wBekvam','$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe','15752250992',1),(4,'11948939@qq.com','等灯','$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe','15752250992',0),(5,'a@qq.com','user','$2a$10$HLE1Mx88FzOk5121F6Vou.GMHEn0qHtObX7.UxYEY4.NESv0DuClO','54154151',1),(6,'a@qq.com','赵龙','$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe','13888888888',1),(6862,'11919@qq.com','hz','$2a$10$mEKoiccVd9lmBJh7czLgy.3bIzaGLiUmn1nsQ65mEvSlI7G3K.1J6','15752250992',1),(20614,'zhixing1010@163.com','root','$2a$10$pi2PBKxJhh6JwEV.XmUwQ.gNkc1cw0npZRctckfAe6gPV8HYcr26i','15752250992',1),(20615,'1149602023@qq.com','wyy','$2a$10$FYO.Bh.3ZPtaQZSI4xqywOBKt7Ndvg2nsIAA2SAfTnutDm/G6sv8y','19821257365',1),(20616,'201930310189@stu.shmtu.edu.cn','bsyc','$2a$10$YqwQ.qdrp1qBdBX5VjYX2OsPGePMJ6xS9D2joySF68T0FAWbnnGZ.','19821257365',1);

/*Table structure for table `users_role` */

DROP TABLE IF EXISTS `users_role`;

CREATE TABLE `users_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`) USING BTREE,
  KEY `roleId` (`roleId`) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `users_role` */

insert  into `users_role`(`userId`,`roleId`) values (1,1),(2,1),(6,1),(6862,1),(20615,1),(2,2),(3,2),(4,2),(5,2),(6,2),(6862,2),(20615,2),(20616,2),(20614,3),(20615,3),(20615,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
