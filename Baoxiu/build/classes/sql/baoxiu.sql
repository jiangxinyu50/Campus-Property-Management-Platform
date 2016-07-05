CREATE TABLE `baoxiu` (
  `id` varchar(255) NOT NULL,
  `time` datetime DEFAULT NULL COMMENT '报修时间',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `name` varchar(255) DEFAULT NULL COMMENT '报修人',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `excepted_time` datetime DEFAULT NULL COMMENT '期望维修时间',
  `location` varchar(255) DEFAULT NULL COMMENT '地点',
  `URL` varchar(255) DEFAULT NULL,
  `state` char(1) DEFAULT '0' COMMENT '维修状态',
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;