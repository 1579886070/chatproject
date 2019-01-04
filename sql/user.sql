

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` int(11) NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '小信', 1579886070, '1579886070', '1579886070@qq.com');
INSERT INTO `users` VALUES (2, '桂桂', 123456, '123456', '123@qq.com');
INSERT INTO `users` VALUES (3, '小信', 2222, '2222', '123456@qq.com');
INSERT INTO `users` VALUES (4, '111', 111, '111', '111@qq.com');
INSERT INTO `users` VALUES (5, '888', 888, '888', '888@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
