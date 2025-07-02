SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `ku` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `cat_name` varchar(100) DEFAULT NULL,
  `content` text,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `details` text,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `shot_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `ku` (`id`, `product_name`, `cat_name`, `content`, `create_by`, `create_time`, `details`, `img`, `price`, `shot_desc`, `status`, `update_time`) VALUES
(5, '华为1', '加工类', '', '管理员新增', NULL, NULL, '/pubfile/download/imgs?fileName=20250105213348742614.png', '123456.00', '平平无奇的加工储备厂', 0, '2025-01-11 10:02:24'),
(6, '荣耀1', '原料类', '', '管理员新增', NULL, NULL, '/pubfile/download/imgs?fileName=20250105213414210549.jpeg', '55588.00', '平平无奇的原料厂', 0, '2025-01-11 10:02:20');


CREATE TRIGGER `after_delete_warehouse` AFTER DELETE ON `ku` FOR EACH ROW BEGIN
    DECLARE existing_count INT;

    -- 检查 ku1 表中是否有相应的 product_name
    SELECT COUNT(*) INTO existing_count 
    FROM ku1 
    WHERE product_name = OLD.product_name;

    IF existing_count > 0 THEN
        -- 如果存在，则减少数量
        UPDATE ku1 
        SET num = num - 1 
        WHERE product_name = OLD.product_name;

        -- 可选：如果数量减至0，可以选择删除该条记录
        IF (SELECT num FROM ku1 WHERE product_name = OLD.product_name) <= 0 THEN
            DELETE FROM ku1 WHERE product_name = OLD.product_name;
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_warehouse1` AFTER INSERT ON `ku` FOR EACH ROW BEGIN
    DECLARE existing_count INT;

    -- 检查 ku1 表中是否已经存在相同的 product_name
    SELECT COUNT(*) INTO existing_count 
    FROM ku1 
    WHERE product_name = NEW.product_name;

    IF existing_count > 0 THEN
        -- 如果存在，则更新数量
        UPDATE ku1 
        SET num = num + 1 
        WHERE product_name = NEW.product_name;
    ELSE
        -- 如果不存在，则插入新的记录
        INSERT INTO ku1 (product_name, num) 
        VALUES (NEW.product_name, 1);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `ku1`
--

CREATE TABLE `ku1` (
  `product_name` varchar(100) NOT NULL,
  `num` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `ku1`
--

INSERT INTO `ku1` (`product_name`, `num`) VALUES
('华为1', 1),
('荣耀1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ku2`
--

CREATE TABLE `ku2` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `cat_name` varchar(100) DEFAULT NULL,
  `content` text,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `details` text,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `shot_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `ku2`
--

INSERT INTO `ku2` (`id`, `product_name`, `cat_name`, `content`, `create_by`, `create_time`, `details`, `img`, `price`, `shot_desc`, `status`, `update_time`) VALUES
(5, '华为1', '加工类', '', '管理员新增', NULL, NULL, '/pubfile/download/imgs?fileName=20250105213348742614.png', '123456.00', '平平无奇的加工储备厂', 0, '2025-01-11 10:02:24'),
(6, '荣耀1', '原料类', '', '管理员新增', NULL, NULL, '/pubfile/download/imgs?fileName=20250105213414210549.jpeg', '55588.00', '平平无奇的原料厂', 0, '2025-01-11 10:02:20'),
(7, 'OPPO1', '能源类', '', '管理员新增', NULL, NULL, '/pubfile/download/imgs?fileName=20250105213449888475.jpeg', '774112.00', '平平无奇的能源厂', 0, '2025-01-11 10:02:15');

-- --------------------------------------------------------

--
-- 表的结构 `login_log`
--

CREATE TABLE `login_log` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `login_log`
--

INSERT INTO `login_log` (`id`, `browser`, `date`, `email`, `ip`, `status`) VALUES
('07a7dbbe-14b8-4212-9039-99609ece4c88', 'Chrome', '2024-10-14 21:43:32.948000', '123@qq.com', '127.0.0.1', 0),
('09586207-4946-42b2-8a8e-28b09fcbbee3', 'Chrome', '2024-10-14 21:44:13.947000', '123456@qq.com', '127.0.0.1', 1),
('0fc41c49-c310-43a3-9b43-c6dfa0ce2150', 'Chrome', '2024-01-31 15:25:40.086000', 'full_stack_white@163.com', '127.0.0.1', 0),
('121ae1ef-be5d-443a-b1de-6578302d9934', 'Chrome', '2022-12-06 15:05:58.830000', 'admin@qq.com', '127.0.0.1', 1),
('172195ea-48da-492c-93f2-ede5ab83046f', 'Chrome', '2024-06-02 10:43:55.004000', 'admin@163.com', '127.0.0.1', 1),
('1af75d04-fca0-49a1-89d7-95aa9212a24d', 'Chrome', '2022-12-17 23:15:17.620000', 'admin@qq.com', '127.0.0.1', 1),
('1cd90c0f-8b99-40b9-9778-e667c30d9bbf', 'Chrome', '2022-12-18 11:28:31.718000', 'admin@qq.com', '127.0.0.1', 1),
('1daa6894-a083-4818-91d1-4abff8fddf03', 'Chrome', '2024-10-27 18:00:11.942000', '123456@qq.com', '127.0.0.1', 1),
('1e40c9c1-d2c1-481e-a451-a317e0df00dc', 'Chrome', '2024-06-02 11:17:50.161000', '527085608@qq.com', '127.0.0.1', 1),
('2ca87389-a97a-446e-bf50-6778f461331b', 'Chrome', '2024-01-31 16:06:49.825000', 'admin@163.com', '127.0.0.1', 1),
('36b25d1b-ba49-4673-abd0-16a136930305', 'Chrome', '2022-12-14 19:56:04.265000', 'admin@qq.com', '127.0.0.1', 1),
('3f9b2ecf-fac0-4f52-aa7f-0a202f09a841', 'Chrome', '2022-12-19 13:10:24.253000', 'admin@qq.com', '127.0.0.1', 1),
('40b51d68-749e-4859-b72f-45fc635f9d0a', 'Chrome', '2022-12-13 12:00:23.181000', 'admin@qq.com', '127.0.0.1', 1),
('4695c7d3-7085-4fe5-9a6e-aa7f22899b68', 'Chrome', '2024-10-27 20:23:42.058000', '123456@qq.com', '127.0.0.1', 1),
('4c3fe589-07c2-4003-b463-dfd5f96d6722', 'Chrome', '2023-02-03 10:08:02.093000', 'admin@qq.com', '127.0.0.1', 1),
('5406b83e-7aa0-425a-a83a-993d57b25e20', 'Chrome', '2024-10-14 21:48:41.351000', '1234567@qq.com', '127.0.0.1', 1),
('5eaba42f-d29d-44e8-9019-729f7139110b', 'Chrome', '2024-01-31 15:29:35.237000', 'full_stack_white@163.com', '127.0.0.1', 1),
('67be2645-7a02-4f08-9861-6269f876e1ec', 'Chrome', '2024-06-02 10:43:34.902000', 'admin@163.com', '127.0.0.1', 0),
('68fcf025-02c5-47a7-83b6-cf984591affb', 'Chrome', '2024-01-31 15:14:46.214000', 'cxs2014501@163.com', '127.0.0.1', 1),
('6cbe1050-6f2b-4b70-b761-e7997e01a9dc', 'Chrome', '2023-01-11 13:34:48.773000', 'admin@qq.com', '127.0.0.1', 1),
('774a8a9d-6742-4cd8-becc-05a5fdd4603c', 'Chrome', '2024-01-31 15:41:45.879000', 'admin@163.com', '127.0.0.1', 1),
('7dfccafe-b5e7-42f6-9d1b-e2e56f06ba67', 'Chrome', '2024-01-31 14:58:19.968000', 'admin@163.com', '127.0.0.1', 1),
('85301f24-d3e7-4349-8d2b-27c3ac3ee0d2', 'Chrome', '2022-12-13 14:26:11.472000', 'abc@qq.com', '127.0.0.1', 1),
('879f7917-8182-4b98-94d3-081a9497e89b', 'Chrome', '2022-12-18 11:27:24.102000', 'admin@qq.com', '127.0.0.1', 1),
('8915ba3f-74dc-434b-af25-cf07dac74ded', 'Chrome', '2022-12-12 23:37:24.703000', 'admin@qq.com', '127.0.0.1', 0),
('899f8c58-0d5b-46e0-a784-1c3f448719e7', 'Chrome', '2022-12-17 23:47:52.145000', 'admin@qq.com', '127.0.0.1', 1),
('8d46124b-548e-4f8c-8719-56cf3226c55b', 'Chrome', '2022-12-18 17:09:53.910000', 'admin@qq.com', '127.0.0.1', 1),
('917934f4-9f8e-48aa-b59e-d174248ed7b6', 'Chrome', '2023-02-16 10:30:12.742000', 'admin@qq.com', '127.0.0.1', 1),
('93467357-7699-42f2-957b-a0a1a4cdc13d', 'Chrome', '2022-12-06 15:34:35.701000', 'adc@qq.com', '127.0.0.1', 1),
('93b213c5-e2ec-4558-af3e-12b2bc8f5217', 'Chrome', '2022-12-14 17:51:18.412000', 'admin@qq.com', '127.0.0.1', 1),
('947b62e7-aeb1-46c3-9b0b-8e257cc72aac', 'Chrome', '2023-01-11 10:15:23.854000', 'admin@qq.com', '127.0.0.1', 1),
('9482f3dd-7e8a-444b-ae95-596076056592', 'Chrome', '2022-12-12 23:37:31.175000', 'admin@qq.com', '127.0.0.1', 1),
('97db4f45-e842-4822-9410-54fb04bfb042', 'Chrome', '2022-12-17 11:47:49.852000', 'admin@qq.com', '127.0.0.1', 1),
('9961cc66-63ad-47c6-9c1e-c81cb08ed949', 'Chrome', '2023-02-15 20:57:44.695000', 'admin@qq.com', '127.0.0.1', 1),
('9d827736-01fd-4d3e-b971-4554944c9356', 'Chrome', '2022-12-17 23:06:03.771000', 'admin@qq.com', '127.0.0.1', 1),
('a149603d-ac88-4b85-a860-188036776615', 'Chrome', '2023-01-11 13:43:06.172000', '123@qq.com', '127.0.0.1', 1),
('a82f5725-da5d-49b3-b7b5-90b544ae1296', 'Chrome', '2023-01-11 09:22:38.737000', 'admin@qq.com', '127.0.0.1', 1),
('b30b9c6f-251b-49a1-9835-c8536f5c23bb', 'Chrome', '2022-12-12 23:36:42.313000', 'admin@qq.com', '127.0.0.1', 1),
('b7dfe8d4-8195-422e-92d1-356f800fa52d', 'Chrome', '2024-10-14 21:43:29.070000', '123@qq.com', '127.0.0.1', 0),
('b965a1cb-a354-41db-8099-b217505c4dc4', 'Chrome', '2022-12-06 15:10:23.878000', 'admin@qq.com', '127.0.0.1', 1),
('bc1d25a6-db1b-41cc-aae6-66bf1526f1e0', 'Chrome', '2024-06-02 10:56:46.342000', '527085608@qq.com', '127.0.0.1', 1),
('c0a719d8-bcea-4f74-b507-f2f9c408125b', 'Chrome', '2024-01-31 15:25:13.590000', 'full_stack_white@163.com', '127.0.0.1', 0),
('c1f7f2e3-6355-4c91-91f2-58cacae7e463', 'Chrome', '2023-01-11 09:10:50.767000', 'admin@qq.com', '127.0.0.1', 1),
('c779c5a9-647d-4fc3-b117-66f29fcd11c6', 'Chrome', '2024-01-31 15:25:03.138000', 'full_stack_white@163.com', '127.0.0.1', 1),
('c7e666b4-bdac-45e8-8731-05f3274f7787', 'Chrome', '2022-12-14 17:37:48.504000', 'admin@qq.com', '127.0.0.1', 1),
('ca38e16e-ba6f-45e7-8a46-fb78abbbf9cc', 'Chrome', '2023-02-03 09:43:42.628000', 'admin@qq.com', '127.0.0.1', 1),
('cbf4e04f-2d40-4384-87dd-7767ae103c6b', 'Chrome', '2022-12-06 15:09:47.524000', 'admin@qq.com', '127.0.0.1', 1),
('cc34263b-7082-4e24-805f-947d289c3c61', 'Chrome', '2023-02-20 19:50:49.392000', 'admin@qq.com', '127.0.0.1', 1),
('d55f21f4-01e6-45a5-abb9-a9d61de1f4da', 'Chrome', '2023-02-20 19:50:41.017000', 'admin@qq.com', '127.0.0.1', 0),
('d7971d2d-01f1-42b6-a617-d88e3af22a82', 'Chrome', '2024-06-02 10:43:31.371000', 'admin@163.com', '127.0.0.1', 0),
('dc6237c6-c852-42e4-857a-8d711e5a0d10', 'Chrome', '2024-01-31 16:23:25.940000', 'admin@163.com', '127.0.0.1', 1),
('e1a5b794-2f16-4bf3-8db1-924755326af0', 'Chrome', '2022-12-17 23:33:24.419000', 'admin@qq.com', '127.0.0.1', 1),
('e2bf13bc-76d4-47c9-84be-65be0c96fd18', 'Chrome', '2024-01-31 15:13:58.115000', 'cxs2014501@163.com', '127.0.0.1', 0),
('e5252049-8cec-4a8b-b97b-b217d0d5c0b4', 'Chrome', '2024-01-16 11:20:00.975000', 'admin@qq.com', '127.0.0.1', 1),
('e6678543-7f24-4c3f-ba66-96bf97f83243', 'Chrome', '2022-12-06 15:31:35.868000', 'adc@qq.com', '127.0.0.1', 1),
('e9483a37-3f80-44f4-8e7f-867c6a72aa10', 'Chrome', '2024-01-16 11:17:58.447000', 'admin@qq.com', '127.0.0.1', 1),
('ea676457-0dde-4e7b-8fec-e01837c12333', 'Chrome', '2023-01-11 09:20:22.825000', 'admin@qq.com', '127.0.0.1', 1),
('eaa7939a-833a-487e-81c9-10ad128f1d93', 'Chrome', '2022-12-02 20:27:24.135000', 'admin@qq.com', '127.0.0.1', 1),
('eb531c48-ea7b-4ef3-9517-1224c26f62e8', 'Chrome', '2022-12-18 11:37:31.447000', 'abc@qq.com', '127.0.0.1', 1),
('f0b74467-4143-4c85-b536-6ea9ec5e1996', 'Chrome', '2024-01-31 15:25:46.182000', 'full_stack_white@163.com', '127.0.0.1', 1),
('f32bc9de-3d76-4db9-8d71-96d6ef145dca', 'Chrome', '2022-12-12 13:54:11.044000', 'admin@qq.com', '127.0.0.1', 1),
('f3bbce9d-13eb-47c6-8038-c6862c477642', 'Chrome', '2024-06-02 10:43:27.279000', 'admin@163.com', '127.0.0.1', 0),
('f4376b40-d7b1-4d94-9295-9829b243ec5b', 'Chrome', '2024-10-27 20:26:19.350000', '123456@qq.com', '127.0.0.1', 1),
('f6984802-1a3a-44fb-b09f-f5ae31802c0d', 'Chrome', '2024-06-02 10:50:48.953000', 'cccccc@qq.com', '127.0.0.1', 1),
('f719c3e7-1547-43ee-8416-a9939c504f6f', 'Chrome', '2022-12-13 14:25:14.960000', 'jack@qq.com', '127.0.0.1', 0),
('f7366eaf-7cb4-4a90-a94a-09c1fbabf61d', 'Chrome', '2024-06-02 11:29:01.736000', '527085608@qq.com', '127.0.0.1', 1),
('f8384696-b37a-4f1b-9456-1f224427cf25', 'Chrome', '2022-12-18 10:54:04.371000', 'admin@qq.com', '127.0.0.1', 1),
('f97fd7af-5a59-42ad-bbfb-b5fd065c0c1f', 'Chrome', '2022-12-18 11:28:02.712000', 'abc@qq.com', '127.0.0.1', 1),
('fc5588a9-287c-41e7-9adc-36c925d74418', 'Chrome', '2022-12-12 23:37:20.666000', 'admin@qq.com', '127.0.0.1', 0),
('fe4e4ea1-41af-406e-b246-2e1e48eb045d', 'Chrome', '2023-01-11 11:04:37.010000', 'admin@qq.com', '127.0.0.1', 1),
('ffb1b09f-b259-42ad-9781-c0e0e95c2048', 'Chrome', '2024-01-31 15:29:08.838000', 'full_stack_white@163.com', '127.0.0.1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `cat_name` varchar(100) DEFAULT NULL,
  `content` text,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `details` text,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `shot_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `product_name`, `cat_name`, `content`, `create_by`, `create_time`, `details`, `img`, `price`, `shot_desc`, `status`, `update_time`) VALUES
(17, '华为', '手机', '<p style=\"box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; scrollbar-color: var(--color, #000000) var(--color_bg, #999999) !important; white-space: pre-wrap; color: #24292f; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Noto Sans\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\'; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #f4f6f8; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; margin: 0px !important 0px 16px 0px; border: 0px solid #e5e7eb;\">华为手机作为中国知名的智能手机品牌，凭借其先进的技术和优质的产品受到全球用户的青睐。华为手机在设计上注重美学与实用性的结合，外观造型独特，采用高品质的材料，手感舒适，给人以高端大气的印象。</p>\n<p style=\"box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; scrollbar-color: var(--color, #000000) var(--color_bg, #999999) !important; white-space: pre-wrap; color: #24292f; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Noto Sans\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\'; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #f4f6f8; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; margin: 0px !important 0px 16px 0px; border: 0px solid #e5e7eb;\"><img src=\"/pubfile/download/imgs?fileName=20241226151904411477.jpeg\" alt=\"\"></p>', '管理员新增', '2024-12-26 14:51:18', NULL, '/pubfile/download/imgs?fileName=20241226144704606432.jpeg', '3999.00', '一部拍照高清手机', 1, '2024-12-26 22:54:49'),
(18, '小米', '手机', '<p><span style=\"color: #24292f; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Noto Sans\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\'; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #f4f6f8; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">小米手机以高性价比著称，结合先进的硬件与智能化的软件体验。其产品线丰富，从入门级到旗舰机型均有覆盖，满足不同用户需求。小米手机搭载MIUI系统，界面友好且功能多样，支持深度定制。影像方面，小米手机配备多摄像头系统，拍照效果优异。此外，长续航和快速充电技术使得使用体验更加便捷。凭借出色的性能和合理的价格，小米手机在全球市场上取得了显著的成功。<img src=\"/pubfile/download/imgs?fileName=20241226152021002827.jpg\" alt=\"\"></span></p>', '管理员新增', '2024-12-26 14:54:41', NULL, '/pubfile/download/imgs?fileName=20241226145412432553.jpg', '2399.00', '小米手机性价比高', 1, '2024-12-26 15:20:24'),
(19, '荣耀80', '手机', '<p><span style=\"color: #24292f; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Noto Sans\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\'; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #f4f6f8; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"><img src=\"/pubfile/download/imgs?fileName=20241226225436921114.jpg\" alt=\"\">荣耀（Honor）品牌是华为旗下的智能手机系列，以年轻化和高性价比著称。荣耀手机设计时尚，注重创新，适合追求个性与性能的用户。其搭载的Magic UI系统流畅且易于操作，提供丰富的功能与个性化选项。荣耀手机在拍照、游戏性能及续航方面表现出色，尤其是针对年轻人的需求进行优化。凭借实惠的价格和强大的配置，荣耀在国内外市场上逐渐赢得了广泛的用户基础。</span></p>', '管理员新增', '2024-12-26 14:55:43', NULL, '/pubfile/download/imgs?fileName=20241226145517039350.jpg', '9999.00', '未来科技手机', 1, '2024-12-26 22:54:40'),
(20, '锤子手机', '手机', '<p><span style=\"color: #24292f; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Noto Sans\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\'; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #f4f6f8; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">锤子手机是中国创新品牌，由罗永浩创立，以其独特的设计和用户体验而闻名。锤子手机注重简约与实用，搭载Smartisan OS系统，提供直观、易用的操作界面，强调人性化设计。其产品在拍照、音质及工艺上都有良好表现，尤其适合追求个性化与品质的用户。虽然市场份额相对较小，但锤子手机凭借独特的品牌文化和忠实的用户群体，一直在智能手机行业中保持着鲜明的<img src=\"/pubfile/download/imgs?fileName=20241226225331723898.jpg\" alt=\"\">特色。</span></p>', '管理员新增', '2024-12-26 14:56:46', NULL, '/pubfile/download/imgs?fileName=20241226145617550697.jpg', '2888.00', '远古品牌', 1, '2024-12-26 22:54:26'),
(21, '红米手机', '手机', '<p><span style=\"color: #24292f; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Noto Sans\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\'; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #f4f6f8; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">红米手机是小米旗下的子品牌，专注于提供高性价比的智能手机。其产品定位于中低端市场，旨在满足广泛用户的基本需求。红米手机设计简约、耐用，通常搭载MIUI系统，操作流畅且易于使用。配备大容量电池和合理的性能配置，使得红米手机在续航和日常使用上表现出色。凭借价格优势和稳定的性能，红米手机已经成为许多消费者的首选，尤其是在预算有限的情况下。<img src=\"/pubfile/download/imgs?fileName=20241226151922906969.jpg\" alt=\"\"></span></p>', '管理员新增', '2024-12-26 14:57:45', NULL, '/pubfile/download/imgs?fileName=20241226145720472864.jpg', '1808.00', '更远古的手机', 1, '2024-12-26 15:19:26'),
(22, '华为xx', '手机', '<p><span style=\"color: #24292f; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Noto Sans\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\'; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #f4f6f8; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">在硬件配置方面，华为手机通常搭载自家研发的麒麟处理器，具备强大的性能和优秀的能效表现。同时，华为手机的内存和存储选项丰富，可以满足不同用户的需求。此外，华为在影像技术上持续创新，许多型号配备了多摄像头系统，支持高倍变焦、超广角和夜景拍摄，能够轻松捕捉各种场景，拍出更加细腻的照片。<img src=\"/pubfile/download/imgs?fileName=20241226152005984386.jpg\" alt=\"\"></span></p>', '管理员新增', '2024-12-26 14:58:31', NULL, '/pubfile/download/imgs?fileName=20241226145820750359.jpg', '6999.00', '定价随意', 1, '2024-12-26 15:20:09'),
(23, 'oppo', '手机', '<p><span style=\"color: #24292f; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Noto Sans\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\'; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #f4f6f8; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">OPPO是一家以创新和时尚设计闻名的智能手机品牌，致力于提供高品质的移动设备。该品牌在拍照技术上尤为突出，许多机型配备先进的摄像头系统，支持超清晰自拍和夜景模式，深受年轻用户喜爱。OPPO手机运行ColorOS，界面友好且功能丰富，提供流畅的使用体验。此外，OPPO还注重快速充电技术，通过VOOC闪充等技术大幅提升充电效率，使用户能够更快恢复使用。凭借卓越的性能和出色的外观设计，OPPO在全球市场中占据了一席之地。<img src=\"/pubfile/download/imgs?fileName=20241226151951808633.jpg\" alt=\"\"></span></p>', '管理员新增', '2024-12-26 14:59:38', NULL, '/pubfile/download/imgs?fileName=20241226145918370334.jpg', '8888.00', '好用相对实惠', 1, '2024-12-26 15:19:54'),
(30, '大哥大', '手机', '<p>大哥大，早年间的王牌甄选，值得你拥有</p>', '管理员新增', NULL, NULL, '/pubfile/download/imgs?fileName=20250107205721409915.jpeg', '588.00', '远古大哥大手机遥遥领先', 0, '2025-01-08 10:54:49');

-- --------------------------------------------------------

--
-- 表的结构 `purchase_info`
--

CREATE TABLE `purchase_info` (
  `product_id` int(11) NOT NULL,
  `buyer` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `purchase_log`
--

CREATE TABLE `purchase_log` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `buyer` varchar(255) NOT NULL,
  `purchase_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `sys_dd`
--

CREATE TABLE `sys_dd` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `cat_name` varchar(100) DEFAULT NULL,
  `content` text,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `details` text,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `shot_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `sys_dd`
--

INSERT INTO `sys_dd` (`id`, `product_name`, `cat_name`, `content`, `create_by`, `create_time`, `details`, `img`, `price`, `shot_desc`, `status`, `update_time`) VALUES
(2, '华为22', '手机', '', '管理员新增', NULL, NULL, '/pubfile/download/imgs?fileName=20250107150350541963.jpg', '5200.00', '5000', 1, NULL),
(3, '荣耀50', '手机', '', '管理员新增', NULL, NULL, '/pubfile/download/imgs?fileName=20250107203501898518.jpeg', '1288.00', '80+', 1, NULL),
(4, NULL, NULL, NULL, '管理员新增', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, '管理员新增', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, '管理员新增', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, '管理员新增', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '格力空调', '家电', '', '管理员新增', NULL, NULL, '/pubfile/download/imgs?fileName=20250108111057500805.png', '6999.00', '没有太多需求', 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_gys`
--

CREATE TABLE `sys_gys` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `cat_name` varchar(100) DEFAULT NULL,
  `content` text,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `details` text,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `shot_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `sys_gys`
--

INSERT INTO `sys_gys` (`id`, `product_name`, `cat_name`, `content`, `create_by`, `create_time`, `details`, `img`, `price`, `shot_desc`, `status`, `update_time`) VALUES
(2, '酌希', '稳定型', '', '管理员新增', '2025-01-02 21:31:05', NULL, '/pubfile/download/imgs?fileName=20250102213114049101.jpeg', '456465.00', '稳定的供应商', 1, '2025-01-02 21:31:16'),
(3, '物益佳', '领头型', '', '管理员新增', '2025-01-02 21:32:08', NULL, '/pubfile/download/imgs?fileName=20250102213218722620.jpeg', '8855220.00', '领头的供应商', 1, '2025-01-02 21:32:20'),
(4, '铭诚', '特殊型', '', '管理员新增', '2025-01-02 21:33:06', NULL, '/pubfile/download/imgs?fileName=20250102213305291576.jpeg', '445566.00', '特殊的供应商', 1, NULL),
(5, '寰宇国际', '先进技术型', '<p>4654</p>', '管理员新增', '2025-01-02 21:33:59', NULL, '/pubfile/download/imgs?fileName=20250102213357873618.jpeg', '9999.00', '先进技术的供应商', 1, '2025-01-12 16:58:03');

-- --------------------------------------------------------

--
-- 表的结构 `sys_user`
--

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL,
  `login_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系方式',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '1admin 2普通用户',
  `avator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图像',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sys_user`
--

INSERT INTO `sys_user` (`id`, `login_name`, `password`, `user_name`, `gender`, `tel`, `age`, `type`, `avator`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `email`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', 'M', '164531346', 22, 'admin', NULL, NULL, NULL, NULL, '2024-12-05 20:30:09', NULL, NULL),
(2, 'admin1', '4851ac89692cb73cdf6842f8fe6b761c', '超级管理员1', 'MM', '15571258520', 21, 'admin', NULL, NULL, '2024-12-05 20:29:43', NULL, NULL, '使用MyBatis插入的数据', '520@qq.com'),
(3, 'admin2', '22c8de7fedce230997254639d927f7ca', '超级管理员3', 'MMa', '15571258520a', 22, 'admin', NULL, NULL, '2024-12-05 20:37:57', NULL, NULL, '使用MyBatis插入的数据a', '520@qq.coma'),
(21, 'qwq', 'e10adc3949ba59abbe56e057f20f883e', 'qwq', 'M', '46546', 20, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'hui', NULL, 'hui', 'F', '123456', 18, 'user', NULL, NULL, NULL, NULL, NULL, 'aaa', NULL),
(12, 'pkq3', 'e10adc3949ba59abbe56e057f20f883e', 'pkq3', 'M', '45613', 13, 'user', NULL, NULL, NULL, NULL, NULL, 'wu', NULL),
(7, 'pkq', NULL, 'pkq', 'M', 'pkq', 222, 'user', NULL, NULL, NULL, 'admin', '2025-01-05 21:35:19', '无', NULL),
(8, 'pkq1', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员55', 'MMa', '15571258520a', 22, 'admin', NULL, NULL, '2025-01-02 12:32:36', NULL, NULL, '', '520@qq.coma'),
(9, 'pkq2', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', 'MMa', '123456789', 22, 'admin', NULL, NULL, '2025-01-02 13:19:32', NULL, NULL, '', ''),
(10, 'phl', 'e10adc3949ba59abbe56e057f20f883e', 'phl', 'M', '125478963', 13, 'user', NULL, NULL, NULL, 'admin', '2025-01-05 21:35:24', 'wuwuwu', NULL),
(11, 'lll', 'e10adc3949ba59abbe56e057f20f883e', 'lll', 'M', '1231231', 14, 'user', NULL, NULL, NULL, NULL, NULL, 'meiyou', NULL),
(13, 'bks', NULL, 'bks', 'M', '13443', 12, 'admin', NULL, NULL, NULL, NULL, NULL, '', NULL),
(14, 'lllq', 'e10adc3949ba59abbe56e057f20f883e', 'lllq', 'M', '123456', 10, 'user', NULL, NULL, NULL, NULL, NULL, 'wu', NULL),
(15, 'admin11', 'e10adc3949ba59abbe56e057f20f883e', 'admin11', 'M', '13213', 10, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'hui1', NULL, 'hui1', 'F', '123', 18, 'admin', NULL, NULL, NULL, NULL, NULL, 'wu', NULL),
(22, 'ymy', 'e10adc3949ba59abbe56e057f20f883e', 'ymy', 'F', '415415', 17, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'root', 'e10adc3949ba59abbe56e057f20f883e', 'ro', 'M', '23465465', 18, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'poi', 'e10adc3949ba59abbe56e057f20f883e', 'poi', 'M', '123465498', 19, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'kafa', 'e10adc3949ba59abbe56e057f20f883e', 'kafa', 'M', '1668852', 15, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'ggb', 'e10adc3949ba59abbe56e057f20f883e', 'ggb', 'M', '134446461', 18, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'ggb1', 'e10adc3949ba59abbe56e057f20f883e', 'ggb1', 'M', '134446461', 18, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- 转储表的索引
--

--
-- 表的索引 `ku`
--
ALTER TABLE `ku`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ku1`
--
ALTER TABLE `ku1`
  ADD PRIMARY KEY (`product_name`);

--
-- 表的索引 `ku2`
--
ALTER TABLE `ku2`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `login_log`
--
ALTER TABLE `login_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `purchase_info`
--
ALTER TABLE `purchase_info`
  ADD PRIMARY KEY (`product_id`);

--
-- 表的索引 `purchase_log`
--
ALTER TABLE `purchase_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_dd`
--
ALTER TABLE `sys_dd`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_gys`
--
ALTER TABLE `sys_gys`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `login_name` (`login_name`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ku`
--
ALTER TABLE `ku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `ku2`
--
ALTER TABLE `ku2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- 使用表AUTO_INCREMENT `purchase_info`
--
ALTER TABLE `purchase_info`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `purchase_log`
--
ALTER TABLE `purchase_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sys_dd`
--
ALTER TABLE `sys_dd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `sys_gys`
--
ALTER TABLE `sys_gys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;


