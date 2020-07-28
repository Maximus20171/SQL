-- Generation time: Sun, 26 Jul 2020 14:34:58 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_17
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя - автора стратегии',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'название стратегии',
  `score_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на счет',
  `text_message` blob DEFAULT NULL COMMENT 'описание стратегии',
  `statistics` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Статистика по стратегии',
  `min_summa` int(10) unsigned NOT NULL COMMENT 'Минимальная рекоменованная сумма',
  `Profit` float NOT NULL DEFAULT 0 COMMENT 'доходность за весь срок',
  `prosadka` float NOT NULL DEFAULT 0 COMMENT 'Дата начала работы стратегии',
  `ita` float NOT NULL DEFAULT 0 COMMENT 'Индекс частоты сделок',
  `dopnik_avto_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на таблицу допников на автоследования',
  `avto_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Активна ли стратегия для подключения автоследования',
  `dopnik_signal_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на таблицу допников на сигналы',
  `signal_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Активна ли стратегия для подключения сигналов',
  `risk_profile` enum('Консервативный','Умеренный','Агрессивный') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Риск профиль',
  `begin_date` datetime DEFAULT current_timestamp() COMMENT 'Дата начала работы стратегии',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Список доп соглашений сигналов';

INSERT INTO `strategy` VALUES ('1','42','exercitationem','47','Ducimus itaque et asperiores accusantium nostrum. Et delectus placeat ea. Sed cum architecto fugit. Iste omnis et ut eum sint quo. Qui perspiciatis alias quisquam ipsum.','application/vnd.ahead.space','178','4','8','1','0','1','4','0','Умеренный','2000-08-11 15:32:17','1979-07-30 09:05:52'),
('2','84','aut','10','Sed expedita autem eos dolor perferendis. Odit temporibus dolore non quisquam dignissimos. Quia et est omnis qui quia maxime voluptatem sunt.','application/vnd.openxmlformats-officedocument.spreadsheetml.template','1467','6','3','1','10','0','5','0','Умеренный','1972-05-18 10:42:23','2014-01-21 06:23:38'),
('3','80','temporibus','70','Labore minus nemo non veniam iste quidem. Nihil perferendis vero neque quisquam in doloremque explicabo. Et mollitia ut dolorem explicabo.','image/x-freehand','334','2','2','6','8','0','6','0','Умеренный','1999-08-20 04:39:18','1992-07-18 05:11:52'),
('4','84','qui','58','Autem aliquid quia natus quia temporibus. Labore non iure modi laudantium neque. Ea adipisci magni aspernatur similique quasi ut distinctio. Beatae aut fuga est iste atque velit minima.','model/vnd.dwf','686','4','6','7','1','1','7','0','Консервативный','2016-03-27 00:17:52','2018-04-17 08:29:40'),
('5','69','aspernatur','32','Ad quo et aperiam nulla nulla. Inventore sunt vel labore id soluta asperiores modi. Est ut doloribus quidem est iusto quibusdam sed. Tempore exercitationem est dolor sint minus placeat et.','model/vnd.collada+xml','1545','6','5','8','3','0','0','0','Консервативный','1984-09-20 17:38:56','1991-10-03 03:34:36'),
('6','41','quo','42','Ullam rerum et quibusdam sunt natus similique. Nihil molestiae quia exercitationem. Temporibus fugiat vero nulla et voluptatum eos et. Consequatur qui omnis ducimus adipisci repellat.','application/vnd.kde.kivio','822','4','6','8','7','0','1','0','Консервативный','2013-06-15 07:44:53','2012-05-06 20:50:07'),
('7','37','sed','15','Aspernatur aliquid et esse explicabo dolorum vero dolores. Omnis voluptatem exercitationem inventore magni et voluptatum illo. Quae et similique illo est provident saepe. Est excepturi eos commodi nulla rerum tempore.','application/omdoc+xml','3021','6','7','6','4','1','1','0','Агрессивный','2002-08-24 13:55:03','2016-01-31 19:46:07'),
('8','22','voluptatibus','20','Pariatur laborum quibusdam temporibus commodi cum ab nam. Ut beatae est est quos consequatur.','image/x-cmu-raster','3996','7','5','8','4','1','7','0','Консервативный','1989-06-05 09:25:31','1977-10-03 20:43:50'),
('9','22','eius','5','Odit modi voluptates fugiat voluptatem sit est aut. Magnam non at ea natus architecto eius. Et doloremque delectus quaerat nobis qui corrupti. Quis quibusdam consequatur velit nihil iure.','image/vnd.fujixerox.edmics-rlc','716','6','9','1','3','0','5','0','Умеренный','2006-06-05 02:48:35','1988-12-30 15:48:30'),
('10','68','voluptatem','34','Eos voluptas incidunt veniam occaecati eaque dolor vel. Eum nisi sint eveniet quam dignissimos est. Iure deleniti numquam deleniti consequuntur. Et exercitationem et nam quia.','application/vnd.wt.stf','2986','4','8','3','3','0','6','0','Умеренный','2004-11-11 05:51:05','2008-09-18 23:22:47'),
('11','53','odit','1','Placeat sit voluptate architecto odit voluptatem sit esse asperiores. Voluptatem ad velit provident dolore sit sit. Quod cumque eos exercitationem itaque cupiditate. Ut voluptatem nam et corrupti dolor sequi.','application/vnd.pvi.ptid1','2257','1','6','6','10','1','10','0','Консервативный','1982-09-15 10:49:33','2002-06-23 04:06:33'),
('12','95','beatae','2','Possimus voluptatem facere veniam in quam quibusdam incidunt. Omnis corporis voluptatum repudiandae. Voluptates nihil recusandae vitae dignissimos animi reiciendis. Sit ullam eveniet rerum enim.','application/vnd.ms-powerpoint.slideshow.macroenabled.12','3785','1','1','1','0','1','1','0','Умеренный','1986-11-15 09:19:54','1983-07-09 09:11:44'),
('13','87','nihil','69','Qui ut necessitatibus neque voluptates et. Autem totam laudantium voluptatem totam quas consequatur ducimus. Adipisci quaerat similique sed dolores occaecati facilis.','application/vnd.wap.wbxml','453','7','7','5','2','0','9','0','Умеренный','1984-09-15 23:59:12','2011-08-30 13:28:36'),
('14','17','dolorem','31','Non provident molestias dolorum nobis suscipit. Molestiae sunt aut doloremque quaerat aut error. Autem voluptatum sint consequatur doloremque impedit aut.','text/x-setext','492','5','2','5','3','1','7','0','Агрессивный','1998-10-17 04:30:10','1997-07-17 17:59:00'),
('15','92','vel','40','Magnam et dolores consequatur ea nesciunt possimus quas. Sed eos illum quo repudiandae maiores. Non eveniet ratione unde aut assumenda optio voluptatibus.','audio/x-ms-wma','2280','1','4','2','2','0','9','0','Консервативный','2013-07-19 02:52:33','1990-09-08 15:38:23'),
('16','9','id','36','Sit rerum tempora rerum. Adipisci quia tempore incidunt tempore quo quaerat quia. Id earum minima quis ullam tempora est qui.','application/x-sql','1856','2','1','8','5','0','2','0','Консервативный','1975-07-07 23:06:10','1982-06-28 03:34:11'),
('17','67','maiores','27','Nostrum ut perferendis dolore aliquid ut porro. Quia illum est molestias ut mollitia. Dolorem architecto amet reiciendis dignissimos et.','application/vnd.kodak-descriptor','1716','4','2','1','10','0','6','0','Умеренный','2005-12-24 22:25:16','1976-08-23 15:39:13'),
('18','42','dolor','56','Cum culpa expedita esse dignissimos. Fugiat quia cum nihil beatae quibusdam. Explicabo cupiditate natus non dolorem blanditiis impedit.','application/x-mscardfile','2417','4','2','1','0','0','5','0','Консервативный','1979-05-03 23:46:11','2008-06-30 02:36:13'),
('19','65','ullam','60','Impedit et maxime numquam ea aliquam magni rem. Culpa at dolorum ut cumque eos. Eos in eius sint suscipit. Et rerum sapiente odit ut quia molestias quia eum. Quisquam eum eos illo vitae.','application/vnd.las.las+xml','715','9','7','5','4','0','7','0','Агрессивный','1983-01-17 17:45:59','2004-07-16 10:57:52'),
('20','84','quos','39','Qui cupiditate aut dolor corrupti. Enim ex dolorum et corrupti molestiae quisquam.','application/vnd.kinar','2764','3','2','6','7','0','7','0','Консервативный','1992-05-22 17:14:47','2019-11-03 20:02:42'),
('21','56','et','17','Quaerat dolore incidunt voluptatibus nemo numquam dolor fugit. Facere dolores saepe maxime consequatur pariatur. At nisi veritatis magnam et deserunt aut.','application/pskc+xml','2004','8','4','7','3','0','3','0','Агрессивный','2000-07-27 21:56:32','2006-03-28 12:29:33'),
('22','24','repellat','64','Quia animi labore itaque magnam. Magnam omnis maiores eos quia repudiandae ipsam. Qui laborum aliquam sint et dolor molestiae.','image/vnd.dxf','1468','9','4','6','10','1','9','0','Консервативный','2020-01-06 11:47:36','1984-03-10 00:39:49'),
('23','35','a','62','Modi tenetur expedita laudantium fugiat commodi qui. Sapiente delectus veniam debitis ea nemo et. Sint dolor repellendus ut quo. Est aperiam ducimus ea ab amet.','video/x-f4v','362','9','8','8','1','0','7','0','Консервативный','1996-03-27 11:51:41','1997-02-14 22:56:11'),
('24','53','hic','50','Nihil quia eum dolorem dolorem. Sed et est omnis est. Incidunt quasi architecto aut unde quis. Laborum tempora aut aut sed est ea quibusdam.','application/vnd.route66.link66+xml','3605','9','2','8','4','0','4','0','Умеренный','1985-09-11 07:41:50','1991-05-17 02:48:08'),
('25','13','quis','9','Exercitationem fugit reprehenderit illum quo. Dolorem temporibus quae voluptas aperiam. Enim et ab fuga autem. Non facere sunt maxime nulla voluptatem quas.','text/vnd.wap.wmlscript','1037','4','7','4','10','0','8','0','Агрессивный','1971-02-08 12:35:49','1979-07-23 15:45:58'),
('26','78','modi','37','Ad consequatur deserunt ut omnis. Unde odio distinctio voluptatem dolores facilis repellat repellendus. Eveniet et nobis nemo ut voluptatem. Unde dignissimos vitae mollitia animi velit omnis voluptate iusto.','application/vnd.hal+xml','3461','5','4','1','3','1','0','0','Умеренный','2003-01-05 07:57:38','1986-10-18 20:10:31'),
('27','19','eum','29','Perferendis vero ut velit vitae voluptatem. Harum tempore deserunt et. Aut non qui atque cum corporis hic quibusdam. Nihil aut deleniti possimus aut ullam nostrum sed.','image/x-freehand','1385','9','4','9','0','0','6','0','Консервативный','1975-09-13 12:49:31','2009-02-21 17:39:40'),
('28','12','impedit','46','Similique deleniti unde deleniti incidunt. Exercitationem non quae et debitis recusandae voluptatibus ex. Cumque ut harum iusto dolorem.','text/troff','99','3','4','9','10','1','2','0','Агрессивный','1980-08-15 18:54:10','1975-11-09 20:37:43'),
('29','48','magni','54','Voluptatem neque natus voluptas quis autem in dolorum. Accusamus pariatur necessitatibus et iure officia vel ea. Vel commodi architecto qui tempora. Voluptatem qui praesentium repellat pariatur.','application/x-shockwave-flash','2068','7','2','8','1','1','5','0','Консервативный','1974-06-04 01:21:52','1991-09-11 19:11:59'),
('30','95','fugiat','61','Ut nam voluptas rem voluptas deleniti. Rerum dolorum asperiores minus cum. Quia cupiditate soluta distinctio.','text/vnd.curl.dcurl','907','2','5','1','6','1','9','0','Консервативный','1984-06-08 08:28:52','2010-06-18 02:54:08'),
('31','32','blanditiis','68','Quod laborum voluptas nihil molestiae nostrum. Eum omnis dignissimos laudantium voluptas. Debitis reiciendis qui adipisci consectetur quae. Commodi non iusto tenetur explicabo impedit ea.','application/vnd.igloader','1860','4','7','6','0','1','7','0','Агрессивный','1987-12-07 08:17:49','1988-09-22 13:40:20'),
('32','93','consequatur','33','Nostrum sed velit eos consectetur. Quibusdam non veritatis alias iure eos debitis. Inventore laudantium et voluptas laborum veniam. Quasi quis ut vero dolor iste.','application/vnd.kinar','1796','9','7','2','8','0','6','0','Умеренный','2001-06-23 03:45:32','1985-08-15 17:44:36'),
('33','4','quasi','14','Quod impedit accusamus sit nisi quisquam. Nihil cumque tempore iusto. Blanditiis et laboriosam voluptatibus neque.','application/widget','1768','8','6','2','4','0','9','0','Умеренный','1980-02-03 22:11:01','2008-02-21 21:52:30'),
('34','23','aliquam','43','Debitis aut culpa eos eligendi iste accusantium. Nobis et nihil quidem odit rerum sed culpa optio. Nobis debitis ab praesentium.','image/x-mrsid-image','3552','8','3','3','8','0','2','0','Консервативный','1983-03-25 03:33:55','2013-09-29 14:22:44'),
('35','84','molestiae','48','Non quos qui voluptate totam omnis molestiae molestiae. Similique nostrum ullam accusantium iusto. Non exercitationem omnis ut occaecati.','video/x-ms-wm','2425','7','9','2','5','0','3','0','Умеренный','2002-03-23 12:43:57','1995-06-30 21:55:46'),
('36','41','molestias','4','Aliquid ab nemo tempore natus non nam eligendi. Adipisci iusto voluptatibus omnis quod ipsum enim quis. Illo aut tempore sint eaque modi hic est. Et et explicabo ut qui in eos.','application/vnd.epson.ssf','966','4','1','7','0','1','3','0','Умеренный','1971-12-29 09:47:30','2016-02-24 04:39:18'),
('37','54','natus','13','Eaque alias eaque omnis vero assumenda. Amet deserunt laudantium aut. Ut natus et voluptas eligendi placeat earum. Quia laudantium corrupti quam.','text/n3','3730','2','5','2','3','0','10','0','Агрессивный','2019-11-10 00:35:08','2005-11-05 17:42:24'),
('38','32','ut','7','Quis corrupti esse voluptatem quae commodi et. Sed vero veritatis id doloribus delectus eveniet repellat maiores. Omnis tempora qui officia provident ut ipsum. Cumque suscipit optio quae ut perspiciatis fugiat.','application/xml-dtd','2148','5','2','5','6','0','2','0','Консервативный','1973-06-29 09:58:32','2002-02-09 19:05:15'),
('39','47','dolores','73','Et adipisci iure est ducimus. Rem sint neque ea non totam. Quibusdam vel officia pariatur et ex consequatur.','video/h261','1689','7','2','8','3','1','1','0','Умеренный','2015-03-14 09:29:28','2008-02-06 23:53:26'),
('40','64','dolorum','11','Quisquam et explicabo quasi est ut. Qui iusto omnis qui minima. Aperiam sapiente laboriosam et eius expedita in. Qui dolor quis iste laudantium.','application/jsonml+json','3170','2','4','7','8','1','0','0','Консервативный','1999-06-27 05:45:45','2003-01-12 10:04:45'),
('41','98','eaque','38','Architecto quisquam asperiores rerum accusantium qui repellendus. Exercitationem amet voluptas in ut ea.','application/vnd.openxmlformats-officedocument.presentationml.slide','783','4','7','6','2','1','10','0','Умеренный','1977-08-08 05:51:34','1992-11-23 10:54:08'),
('42','73','culpa','80','Est eveniet perferendis deleniti nam. Dignissimos molestiae qui ipsa ipsum nobis. Facilis molestias reprehenderit nesciunt molestias delectus voluptas.','application/vnd.sailingtracker.track','2733','7','8','7','2','1','2','0','Умеренный','1998-05-17 15:44:33','2005-02-28 01:24:01'),
('43','13','vero','8','Autem reprehenderit ipsam fugit et veritatis unde. Reprehenderit inventore nesciunt omnis neque pariatur error. Asperiores harum labore sint rem voluptas. Ut deserunt alias explicabo dolore aspernatur aut.','application/x-sv4crc','3123','9','2','6','3','1','6','0','Консервативный','1984-10-24 16:06:00','1996-08-20 11:31:13'),
('44','68','tempora','71','Nostrum provident cum sed ratione aliquid at harum. Expedita inventore nihil vitae sapiente autem distinctio. Impedit expedita corporis quia debitis distinctio. Quia non a blanditiis odio.','application/vnd.olpc-sugar','1845','3','9','2','6','1','6','0','Консервативный','2015-04-14 04:25:49','1991-12-11 16:19:18'),
('45','38','debitis','30','Dignissimos ipsum saepe unde illum. Voluptatem officiis aut rerum voluptatum nisi libero. Laudantium ut quos quasi quia enim. Quas dolores aut atque autem laborum dolorem.','image/x-xwindowdump','2581','4','7','2','5','0','6','0','Консервативный','1976-04-28 05:09:22','1995-05-17 21:43:37'),
('46','69','nulla','35','Iusto et reiciendis nisi beatae distinctio et et. Numquam illo suscipit animi et. Quibusdam inventore error quis in ipsum labore. Occaecati saepe blanditiis est et id commodi.','application/pkix-pkipath','2669','1','1','2','0','0','10','0','Консервативный','1973-12-16 04:46:57','1980-08-31 01:16:41'),
('47','50','doloremque','74','Eum placeat beatae sit. Vitae architecto in quia in rem sit fugit. Expedita porro quod cumque suscipit sit.','application/vnd.ezpix-package','3410','2','4','8','0','0','3','0','Умеренный','1988-05-04 19:48:30','2010-09-14 01:41:01'),
('48','19','sunt','65','Quis ab consequuntur ipsam corrupti in quos ducimus. Nihil quo architecto voluptatum qui et dicta quos. Sunt rerum dignissimos dolores sed dignissimos.','audio/x-flac','1095','8','8','3','4','0','2','0','Агрессивный','2017-01-23 11:02:29','1976-06-27 04:48:22'),
('49','36','omnis','6','Dolores quo porro porro magni sequi. Laudantium tempora voluptatum explicabo qui facilis itaque. Explicabo excepturi distinctio recusandae non est consequatur. Ut enim veniam consectetur qui molestiae repudiandae.','application/x-font-type1','2234','5','6','6','2','1','9','0','Консервативный','2019-04-19 04:51:34','1995-03-20 18:57:13'),
('50','49','illo','53','Aperiam autem sint quis possimus quia. Eum sit explicabo aspernatur tempore odit vel. Libero rerum exercitationem impedit. Eveniet cumque nulla modi qui architecto iusto.','application/vnd.dece.ttml+xml','1857','6','5','3','5','0','5','0','Умеренный','1983-08-08 21:21:52','1997-07-06 23:36:39'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

