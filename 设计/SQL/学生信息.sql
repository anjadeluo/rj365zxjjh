drop table if exists student;
CREATE TABLE `student` (
	`id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`name` VARCHAR(50) NOT NULL COMMENT '姓名',
	`sex` INT(3) NOT NULL COMMENT '性别（dict_sex）',
	`age` INT(3) NOT NULL COMMENT '年龄',
	`id_card_number` VARCHAR(20) NOT NULL COMMENT '身份证号码',
	`id_card_start_date` DATE NOT NULL COMMENT '身份证有效起始时间',
	`id_card_end_date` DATE NOT NULL COMMENT '身份证有效结束时间',
	`nation` INT(3) NOT NULL COMMENT '民族',
	`announce_type` INT NOT NULL COMMENT '户口性质',
	`native_place` varchar(50) NOT NULL COMMENT '籍贯',
	`announce_address` VARCHAR(200) NULL DEFAULT NULL COMMENT '户籍所在地',
	`phone_number` VARCHAR(15) NOT NULL COMMENT '手机号',
	`weixin_number` VARCHAR(15) NOT NULL COMMENT '微信号',
	`qq_number` VARCHAR(15) NULL DEFAULT NULL COMMENT 'QQ号',
	`email` VARCHAR(50) NULL DEFAULT NULL COMMENT '电子邮箱',
	`mail_number` VARCHAR(10) NULL DEFAULT NULL COMMENT '邮政编码',
	`relat_address` VARCHAR(200) NOT NULL COMMENT '通讯地址',
	`home_address` VARCHAR(200) NULL DEFAULT NULL COMMENT '家庭住址',
	`username` VARCHAR(100) NOT NULL COMMENT '用户名',
	`create_date` DATE NOT NULL COMMENT '创建时间',
	`update_date` DATE NULL DEFAULT NULL COMMENT '更新时间',
	`update_user` VARCHAR(100) NULL DEFAULT NULL COMMENT '更新人',
	`update_reason` VARCHAR(500) NULL DEFAULT NULL COMMENT '更新理由',
	`remarks` VARCHAR(500) NULL DEFAULT NULL COMMENT '备注',
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci' ENGINE=InnoDB COMMENT='学生信息表';


drop table if exists student_guardian ;
CREATE TABLE `student_guardian` (
	`id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`name` VARCHAR(50) NOT NULL COMMENT '姓名',
	`relation` VARCHAR(50) NOT NULL COMMENT '与学生关系',
	`student_id` INT(11) NOT NULL COMMENT '学生ID',
	`age` INT(3) NULL DEFAULT NULL COMMENT '年龄',
	`id_card_number` VARCHAR(20) NOT NULL COMMENT '身份证号码',
	`phone_number` VARCHAR(15) NOT NULL COMMENT '联系电话',
	`weixin_number` VARCHAR(20) NULL DEFAULT NULL COMMENT '微信号',
	`qq_number` VARCHAR(15) NULL DEFAULT NULL COMMENT 'QQ号',
	`email` VARCHAR(50) NULL DEFAULT NULL COMMENT '电子邮箱',
	`workspace` VARCHAR(200) NULL DEFAULT NULL COMMENT '工作单位',
	`relat_address` VARCHAR(200) NULL DEFAULT NULL COMMENT '通讯地址',
	`username` VARCHAR(100) NOT NULL COMMENT '用户名',
	`create_date` DATE NOT NULL COMMENT '创建时间',
	`update_date` DATE NULL DEFAULT NULL COMMENT '更新时间',
	`update_user` VARCHAR(100) NULL DEFAULT NULL COMMENT '更新人',
	`update_reason` VARCHAR(500) NULL DEFAULT NULL COMMENT '更新理由',
	`remarks` VARCHAR(500) NULL DEFAULT NULL COMMENT '备注',
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci' ENGINE=InnoDB COMMENT='学生监护人信息';


drop table if exists student_school_info;
CREATE TABLE `student_school_info` (
	`id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`student_id` INT(11) NOT NULL COMMENT '学生ID',
	`school_name` VARCHAR(50) NOT NULL COMMENT '学校名称',
	`college_name` varchar(50) NULL DEFAULT NULL COMMENT '学院名称（没有就不填）',
	`academic_class` INT(3) NULL DEFAULT NULL COMMENT '学科类别',
	`grade` INT(3) NOT NULL COMMENT '年级',
	`school_class` VARCHAR(20) NOT NULL COMMENT '班级',
	`school_number` VARCHAR(10) NOT NULL COMMENT '学号',
	`class_teacher_name` VARCHAR(20) NOT NULL COMMENT '班主任名称',
	`class_teacher_sex` INT(2) NULL DEFAULT NULL COMMENT '班主任性别',
	`class_teacher_phone` VARCHAR(15) NOT NULL COMMENT '班主任联系电话',
	`class_teacher_weixin` VARCHAR(20) NULL DEFAULT NULL COMMENT '班主任微信号',
	`school_address` VARCHAR(200) NULL DEFAULT NULL COMMENT '通讯地址',
	`username` VARCHAR(100) NOT NULL COMMENT '用户名',
	`create_date` DATE NOT NULL COMMENT '创建时间',
	`update_date` DATE NULL DEFAULT NULL COMMENT '更新时间',
	`update_user` VARCHAR(100) NULL DEFAULT NULL COMMENT '更新人',
	`update_reason` VARCHAR(500) NULL DEFAULT NULL COMMENT '更新理由',
	`remarks` VARCHAR(500) NULL DEFAULT NULL COMMENT '备注',
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci' ENGINE=InnoDB COMMENT='学生就学信息';


drop table if exists student_bank_info;
CREATE TABLE `student_bank_info` (
	`id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`student_id` INT(11) NOT NULL COMMENT '学生ID',
	`bank_name` VARCHAR(50) NOT NULL COMMENT '开户银行名称',
	`bank_user_name` varchar(50) NOT NULL COMMENT '开户人姓名',
	`bank_card_id` varchar(20) NOT NULL COMMENT '银行卡号',
	`description` varchar(500) NULL DEFAULT NULL COMMENT '备注',
	`username` VARCHAR(100) NOT NULL COMMENT '用户名',
	`create_date` DATE NOT NULL COMMENT '创建时间',
	`update_date` DATE NULL DEFAULT NULL COMMENT '更新时间',
	`update_user` VARCHAR(100) NULL DEFAULT NULL COMMENT '更新人',
	`update_reason` VARCHAR(500) NULL DEFAULT NULL COMMENT '更新理由',
	`remarks` VARCHAR(500) NULL DEFAULT NULL COMMENT '备注',
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci' ENGINE=InnoDB COMMENT='学生银行帐户信息';
