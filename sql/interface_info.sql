/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : api

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 04/09/2025 10:26:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for interface_info
-- ----------------------------
DROP TABLE IF EXISTS `interface_info`;
CREATE TABLE `interface_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接口地址',
  `requestHeader` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求头',
  `responseHeader` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '响应头',
  `status` int NOT NULL DEFAULT 0 COMMENT '接口状态（0-关闭，1-开启）',
  `method` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求类型',
  `userId` bigint NOT NULL COMMENT '创建人',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
  `requestParams` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '接口信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interface_info
-- ----------------------------
INSERT INTO `interface_info` VALUES (1, '获取用户信息', '根据用户ID获取详细信息', '/api/v1/user/get', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 1001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (2, '创建用户', '创建新用户账户', '/api/v1/user/create', '{\"Content-Type\": \"application/json\", \"Authorization\": \"Bearer token\"}', '{\"Content-Type\": \"application/json\"}', 1, 'POST', 1002, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (3, '更新用户信息', '更新现有用户信息', '/api/v1/user/update', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'PUT', 1003, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (4, '删除用户', '根据ID删除用户', '/api/v1/user/delete', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 0, 'DELETE', 1001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (5, '用户登录', '用户登录认证', '/api/v1/user/login', '{\"Content-Type\": \"application/x-www-form-urlencoded\"}', '{\"Content-Type\": \"application/json\", \"Set-Cookie\": \"session_id\"}', 0, 'POST', 1002, '2025-09-02 16:25:42', '2025-09-03 14:46:51', 0, '');
INSERT INTO `interface_info` VALUES (6, '用户登出', '用户退出登录', '/api/v1/user/logout', '{\"Content-Type\": \"application/json\", \"Cookie\": \"session_id\"}', '{\"Content-Type\": \"application/json\"}', 1, 'POST', 1003, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (7, '重置密码', '重置用户密码', '/api/v1/user/password/reset', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'POST', 1001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (8, '查询用户列表', '分页查询用户列表', '/api/v1/user/list', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 1002, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (9, '用户权限验证', '验证用户操作权限', '/api/v1/user/permission/check', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 0, 'GET', 1003, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (10, '用户资料上传', '上传用户头像等资料', '/api/v1/user/upload', '{\"Content-Type\": \"multipart/form-data\"}', '{\"Content-Type\": \"application/json\"}', 1, 'POST', 1001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (11, '获取产品详情', '根据ID获取产品信息', '/api/v1/product/get', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 2001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (12, '创建产品', '添加新产品', '/api/v1/product/create', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'POST', 2002, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (13, '更新产品信息', '更新产品详细信息', '/api/v1/product/update', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'PUT', 2003, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (14, '删除产品', '根据ID删除产品', '/api/v1/product/delete', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 0, 'DELETE', 2001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (15, '产品列表查询', '分页查询产品列表', '/api/v1/product/list', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 2002, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (16, '产品搜索', '根据关键词搜索产品', '/api/v1/product/search', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 2003, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (17, '产品分类获取', '获取产品分类信息', '/api/v1/product/category', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 2001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (18, '产品库存检查', '检查产品库存状态', '/api/v1/product/stock/check', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 2002, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (19, '产品评论获取', '获取产品评论列表', '/api/v1/product/reviews', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 2003, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (20, '产品推荐', '获取产品推荐列表', '/api/v1/product/recommendations', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 0, 'GET', 2001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (21, '创建订单', '生成新订单', '/api/v1/order/create', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'POST', 3001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (22, '查询订单详情', '根据订单ID查询详情', '/api/v1/order/get', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 3002, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (23, '更新订单状态', '更新订单状态信息', '/api/v1/order/status/update', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'PUT', 3003, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (24, '取消订单', '取消指定订单', '/api/v1/order/cancel', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'POST', 3001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (25, '订单列表查询', '分页查询用户订单', '/api/v1/order/list', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 3002, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (26, '订单支付', '处理订单支付', '/api/v1/order/payment', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 0, 'POST', 3003, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (27, '订单发货', '更新订单发货信息', '/api/v1/order/ship', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'POST', 3001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (28, '订单统计', '获取订单统计信息', '/api/v1/order/stats', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 3002, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (29, '订单导出', '导出订单数据', '/api/v1/order/export', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/csv\"}', 1, 'GET', 3003, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (30, '订单退款', '处理订单退款请求', '/api/v1/order/refund', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 0, 'POST', 3001, '2025-09-02 16:25:42', '2025-09-02 16:25:42', 0, '');
INSERT INTO `interface_info` VALUES (31, '获取用户信息', '返回用户基本信息', '/api/user/info', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'GET', 1, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (32, '更新用户资料', '修改用户个人资料', '/api/user/update', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 2, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (33, '删除用户', '永久删除用户账户', '/api/user/delete', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 0, 'POST', 3, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (34, '查询订单', '根据条件查询订单列表', '/api/orders', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'GET', 4, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (35, '创建订单', '生成一个新的订单', '/api/orders/create', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 5, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (36, '支付订单', '处理订单支付', '/api/orders/pay', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 1, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (37, '取消订单', '取消待处理订单', '/api/orders/cancel', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 2, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (38, '获取商品列表', '返回所有商品信息', '/api/products', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'GET', 3, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (39, '添加商品', '添加新商品到库存', '/api/products/add', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 0, 'POST', 4, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (40, '更新商品', '修改商品信息', '/api/products/update', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 5, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (41, '删除商品', '从库存移除商品', '/api/products/delete', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 0, 'POST', 1, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (42, '用户登录', '处理用户登录请求', '/api/auth/login', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 2, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (43, '用户注册', '处理新用户注册', '/api/auth/register', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 3, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (44, '重置密码', '重置用户密码', '/api/auth/reset', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 4, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (45, '获取配置', '读取系统配置', '/api/config', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'GET', 5, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (46, '更新配置', '修改系统配置', '/api/config/update', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 0, 'POST', 1, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (47, '日志查询', '查询系统日志', '/api/logs', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'GET', 2, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (48, '生成报告', '生成统计报告', '/api/reports/generate', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 3, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (49, '下载报告', '下载生成的报告', '/api/reports/download', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'GET', 4, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (50, '消息推送', '向用户推送消息', '/api/notifications/send', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 0, 'POST', 5, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (51, '获取消息', '获取用户消息列表', '/api/notifications', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'GET', 1, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (52, '标记已读', '标记消息为已读', '/api/notifications/mark-read', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 2, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (53, '上传文件', '处理文件上传', '/api/upload', '{\"Content-Type\":\"multipart/form-data\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 3, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (54, '下载文件', '下载文件', '/api/download', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/octet-stream\"}', 1, 'GET', 4, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (55, '权限验证', '验证用户权限', '/api/permissions/check', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'POST', 5, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (56, '获取角色', '获取用户角色', '/api/roles', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'GET', 1, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (57, '分配角色', '为用户分配角色', '/api/roles/assign', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 0, 'POST', 2, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (58, '数据统计', '获取业务数据统计', '/api/statistics', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'GET', 3, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (59, '清理数据', '清理过期数据', '/api/cleanup', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 0, 'POST', 4, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (60, '系统健康', '检查系统健康状态', '/api/health', '{\"Content-Type\":\"application/json\"}', '{\"Content-Type\":\"application/json\"}', 1, 'GET', 5, '2025-09-02 16:25:53', '2025-09-02 16:25:53', 0, '');
INSERT INTO `interface_info` VALUES (61, '测试调用', '测试', 'http://localhost:8123/name/user', '1', '1', 1, 'GET', 1, '2025-09-03 15:08:41', '2025-09-03 15:08:41', 0, '{\"name\":\"username\",\"type\":\"string\"}');

SET FOREIGN_KEY_CHECKS = 1;
