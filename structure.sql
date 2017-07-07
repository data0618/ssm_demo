/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.18-log : Database - ssm_demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm_demo`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `department` varchar(50) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` int(4) unsigned zerofill DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`department`,`create_time`,`create_user`,`update_time`,`update_user`) values (0001,'部门一','2017-07-07 13:58:19',NULL,'2017-07-07 13:58:19',NULL),(0002,'部门二','2017-07-07 13:58:34',NULL,'2017-07-07 13:58:34',NULL),(0003,'部门三','2017-07-07 13:58:51',NULL,'2017-07-07 13:58:51',NULL);

/*Table structure for table `operation` */

DROP TABLE IF EXISTS `operation`;

CREATE TABLE `operation` (
  `id` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `operation` varchar(50) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` int(4) unsigned zerofill DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `operation` */

insert  into `operation`(`id`,`operation`,`create_time`,`create_user`,`update_time`,`update_user`) values (01,'添加','2017-07-07 13:41:43',NULL,'2017-07-07 13:41:43',NULL),(02,'修改','2017-07-07 13:41:52',NULL,'2017-07-07 13:41:52',NULL),(03,'删除','2017-07-07 13:42:14',NULL,'2017-07-07 13:42:14',NULL),(04,'查询','2017-07-07 13:42:21',NULL,'2017-07-07 13:42:21',NULL);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role` varchar(20) NOT NULL COMMENT '角色',
  `level` int(2) NOT NULL COMMENT '级别',
  `desc` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` int(4) unsigned zerofill DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role`,`level`,`desc`,`create_time`,`create_user`,`update_time`,`update_user`) values (001,'管理员',99,'我才是老大','2017-07-06 14:38:50',NULL,'2017-07-06 14:38:50',NULL),(002,'高级经理',6,NULL,'2017-07-06 14:39:59',NULL,'2017-07-06 14:39:59',NULL),(003,'中级经理',5,NULL,'2017-07-06 14:40:21',NULL,'2017-07-06 14:40:21',NULL),(004,'初级经理',4,NULL,'2017-07-06 15:06:32',NULL,'2017-07-06 15:06:32',NULL),(005,'高级职员',3,NULL,'2017-07-06 15:06:50',NULL,'2017-07-06 15:06:50',NULL),(006,'中级职员',2,NULL,'2017-07-06 15:07:01',NULL,'2017-07-06 15:07:01',NULL),(007,'初级职员',1,NULL,'2017-07-06 15:07:24',NULL,'2017-07-06 15:07:24',NULL);

/*Table structure for table `role_operation` */

DROP TABLE IF EXISTS `role_operation`;

CREATE TABLE `role_operation` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `role_id` int(3) unsigned zerofill NOT NULL,
  `operation` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` int(4) unsigned zerofill DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `role_operation` */

insert  into `role_operation`(`id`,`role_id`,`operation`,`create_time`,`create_user`,`update_time`,`update_user`) values (001,001,'01,02,03,04','2017-07-07 13:49:12',NULL,'2017-07-07 13:49:12',NULL),(002,002,'01,02,03,04','2017-07-07 14:03:32',NULL,'2017-07-07 14:03:32',NULL),(003,003,'01,02,04','2017-07-07 14:04:39',NULL,'2017-07-07 14:04:39',NULL),(004,004,'01,02,04','2017-07-07 15:36:20',NULL,'2017-07-07 15:36:20',NULL),(005,005,'02,04','2017-07-07 15:37:49',NULL,'2017-07-07 15:37:49',NULL),(006,006,'02,04','2017-07-07 15:37:52',NULL,'2017-07-07 15:37:52',NULL),(007,007,'04','2017-07-07 15:37:58',NULL,'2017-07-07 15:37:58',NULL);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned zerofill NOT NULL,
  `role_id` int(3) unsigned zerofill NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` int(4) unsigned zerofill DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`user_id`,`role_id`,`create_time`,`create_user`,`update_time`,`update_user`) values (0001,0001,001,'2017-07-07 13:36:59',NULL,'2017-07-07 13:36:59',NULL),(0002,0003,005,'2017-07-07 13:37:32',NULL,'2017-07-07 13:37:32',NULL),(0003,0004,007,'2017-07-07 13:38:07',NULL,'2017-07-07 13:38:07',NULL),(0004,0006,007,'2017-07-07 13:38:12',NULL,'2017-07-07 13:38:12',NULL),(0005,0008,003,'2017-07-07 13:38:17',NULL,'2017-07-07 13:38:17',NULL),(0006,0009,004,'2017-07-07 13:38:22',NULL,'2017-07-07 13:38:22',NULL),(0007,0005,002,'2017-07-07 13:38:27',NULL,'2017-07-07 13:38:27',NULL),(0008,0002,004,'2017-07-07 13:38:39',NULL,'2017-07-07 13:38:39',NULL),(0009,0007,006,'2017-07-07 13:39:04',NULL,'2017-07-07 13:39:04',NULL),(0010,0010,006,'2017-07-07 13:39:17',NULL,'2017-07-07 13:39:17',NULL);

/*Table structure for table `user_t` */

DROP TABLE IF EXISTS `user_t`;

CREATE TABLE `user_t` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(60) NOT NULL COMMENT '用户名',
  `password` varchar(60) NOT NULL COMMENT '密码',
  `age` int(4) unsigned DEFAULT NULL COMMENT '年龄',
  `department` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `user_t` */

insert  into `user_t`(`id`,`user_name`,`password`,`age`,`department`) values (0001,'user1','user1',1,0002),(0002,'user2','user2',2,0003),(0003,'user3','user3',3,0004),(0004,'user4','user4',4,0003),(0005,'user5','user5',5,0001),(0006,'user6','user6',6,0004),(0007,'user7','user7',7,0003),(0008,'user8','user8',8,0004),(0009,'user9','user9',9,0001),(0010,'user10','user10',10,0002);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
