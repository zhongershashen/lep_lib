CREATE TABLE `lep_permission_table` (
                                        `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                        `permission_name` varchar(255) NOT NULL COMMENT '权限名称',
                                        `permission_key` varchar(255) NOT NULL COMMENT '权限Key值',
                                        `permission_desc` text COMMENT '描述-备注',
                                        `extra` text COMMENT '扩展字段',
                                        `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除; 1-已删除',
                                        `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                            PRIMARY KEY (`id`),
                                        KEY `idx_key` (`permission_key`)
) ENGINE=InnoDB AUTO_INCREMENT=20056 DEFAULT CHARSET=utf8mb4 COMMENT='系统权限'

CREATE TABLE `lep_role_table` (
                                  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
                                  `role_key`  varchar(255) NOT NULL COMMENT '角色key',
                                  `role_desc` text COMMENT '描述-备注',
                                  `extra` text COMMENT '扩展字段',
                                  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除; 1-已删除',
                                  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
                                      PRIMARY KEY (`id`),
                                  KEY `idx_key` (`role_key`)
) ENGINE=InnoDB AUTO_INCREMENT=20056 DEFAULT CHARSET=utf8mb4 COMMENT='角色表'

CREATE TABLE `lep_role_permission_table` (
                                  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                  `role_key`  varchar(255) NOT NULL COMMENT '角色key',
                                  `permission_key`  varchar(255) NOT NULL COMMENT '权限key',
                                  `extra` text COMMENT '扩展字段',
                                  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除; 1-已删除',
                                  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
                                      PRIMARY KEY (`id`),
                                  KEY `idx_key` (`role_key`),
                                  KEY `idx_key` (`permission_key`)
) ENGINE=InnoDB AUTO_INCREMENT=20056 DEFAULT CHARSET=utf8mb4 COMMENT='角色-权限表'

CREATE TABLE `lep_user_table` (
                                  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                  `phone` varchar(255) NOT NULL COMMENT '手机号',
                                  `password` varchar(255) NOT NULL COMMENT '密码，加密版',
                                  `user_name` varchar(255) NOT NULL COMMENT '用户名',
                                  `user_avatar` text NOT NULL COMMENT '用户头像',
                                  `role_key` varchar(255) NOT NULL COMMENT '用户角色',
                                  `extra` text COMMENT '扩展字段',
                                  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除; 1-已删除',
                                  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
                                      PRIMARY KEY (`id`),
                                  KEY `idx_key` (`role_key`)
) ENGINE=InnoDB AUTO_INCREMENT=20056 DEFAULT CHARSET=utf8mb4 COMMENT='用户表'

CREATE TABLE `lep_material_table` (
                                      `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                      `user_id` bigint(20) NOT NULL COMMENT '用户id',
                                      `material_type` tinyint(4) NOT NULL COMMENT '物料类型',
                                      `material_key` varchar(255) NOT NULL COMMENT '物料key',
                                      `material_value` text  COMMENT '物料值',
                                      `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除; 1-已删除',
                                      `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
                                          PRIMARY KEY (`id`),
                                      KEY `idx_user` (`user_id`),
                                      KEY `idx_key` (`material_key`)
) ENGINE=InnoDB AUTO_INCREMENT=20056 DEFAULT CHARSET=utf8mb4 COMMENT='物料表'

CREATE TABLE `lep_audit_table` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                   `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                                   `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
                                   `audit_type` int NOT NULL DEFAULT '0' COMMENT '审核类型，业务自定义',
                                   `applicant` varchar(64) NOT NULL DEFAULT '' COMMENT '申请人',
                                   `target_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '审核目标ID',
                                   `apply_info` text COMMENT '附加申请信息',
                                   `audit_status` tinyint NOT NULL DEFAULT '0' COMMENT '审核状态：1-待审核，2-审核通过，3-审核驳回',
                                   `biz_status` int NOT NULL DEFAULT '0' COMMENT '业务自定义status',
                                   `auditor` varchar(64) NOT NULL DEFAULT '' COMMENT '审核人',
                                   `reason` varchar(512) NOT NULL DEFAULT '' COMMENT '驳回原因',
                                   `apply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
                                   `audit_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
                                   `extra` text COMMENT '扩展信息',
                                   `is_test` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否测试数据，1是，0不是',
                                   PRIMARY KEY (`id`),
                                   KEY `idx_third` (`third_id`),
                                   KEY `idx_target` (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20768 DEFAULT CHARSET=utf8mb3 COMMENT='审核信息表'

CREATE TABLE `lep_product_table` (
                                     `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                     `user_id` bigint(20) NOT NULL COMMENT '用户id',
                                     `product_name` varchar(255) NOT NULL COMMENT '产品名称',
                                     `evaluate_standard` varchar(255)  COMMENT '测试标准',
                                     `evaluate_case` text  COMMENT '相关测试case',
                                     `evaluate_data` text  COMMENT '相关测试数据集',
                                     `extra` text COMMENT '扩展信息',
                                     `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除; 1-已删除',
                                     `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
                                         PRIMARY KEY (`id`),
                                     KEY `idx_user` (`user_id`),
                                     KEY `idx_name` (`product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20056 DEFAULT CHARSET=utf8mb4 COMMENT='需求表'

CREATE TABLE `lep_result_table` (
                                    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                    `user_id` bigint(20) NOT NULL COMMENT '用户id',
                                    `result_type` tinyint(4) NOT NULL COMMENT '测试case类型',
                                    `result_key` varchar(255) NOT NULL COMMENT '测试case-key',
                                    `result_value` text  COMMENT '测试case-值',
                                    `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除; 1-已删除',
                                    `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
                                        PRIMARY KEY (`id`),
                                    KEY `idx_user` (`user_name`),
                                    KEY `idx_key` (`material_key`)
) ENGINE=InnoDB AUTO_INCREMENT=20056 DEFAULT CHARSET=utf8mb4 COMMENT='测试结果'