/*
 Navicat Premium Data Transfer

 Source Server         : Construction
 Source Server Type    : SQLite
 Source Server Version : 3035005 (3.35.5)
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3035005 (3.35.5)
 File Encoding         : 65001

 Date: 26/04/2025 16:01:18
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for _user_point_learn_old_20250415
-- ----------------------------
DROP TABLE IF EXISTS "_user_point_learn_old_20250415";
CREATE TABLE "_user_point_learn_old_20250415" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER,
  "point" TEXT
);

-- ----------------------------
-- Records of _user_point_learn_old_20250415
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS "auth_group";
CREATE TABLE "auth_group" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar(150) NOT NULL,
  UNIQUE ("name" ASC)
);

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS "auth_group_permissions";
CREATE TABLE "auth_group_permissions" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "group_id" integer NOT NULL,
  "permission_id" integer NOT NULL,
  FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS "auth_permission";
CREATE TABLE "auth_permission" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "content_type_id" integer NOT NULL,
  "codename" varchar(100) NOT NULL,
  "name" varchar(255) NOT NULL,
  FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO "auth_permission" VALUES (1, 1, 'add_logentry', 'Can add log entry');
INSERT INTO "auth_permission" VALUES (2, 1, 'change_logentry', 'Can change log entry');
INSERT INTO "auth_permission" VALUES (3, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO "auth_permission" VALUES (4, 1, 'view_logentry', 'Can view log entry');
INSERT INTO "auth_permission" VALUES (5, 2, 'add_permission', 'Can add permission');
INSERT INTO "auth_permission" VALUES (6, 2, 'change_permission', 'Can change permission');
INSERT INTO "auth_permission" VALUES (7, 2, 'delete_permission', 'Can delete permission');
INSERT INTO "auth_permission" VALUES (8, 2, 'view_permission', 'Can view permission');
INSERT INTO "auth_permission" VALUES (9, 3, 'add_group', 'Can add group');
INSERT INTO "auth_permission" VALUES (10, 3, 'change_group', 'Can change group');
INSERT INTO "auth_permission" VALUES (11, 3, 'delete_group', 'Can delete group');
INSERT INTO "auth_permission" VALUES (12, 3, 'view_group', 'Can view group');
INSERT INTO "auth_permission" VALUES (13, 4, 'add_user', 'Can add user');
INSERT INTO "auth_permission" VALUES (14, 4, 'change_user', 'Can change user');
INSERT INTO "auth_permission" VALUES (15, 4, 'delete_user', 'Can delete user');
INSERT INTO "auth_permission" VALUES (16, 4, 'view_user', 'Can view user');
INSERT INTO "auth_permission" VALUES (17, 5, 'add_contenttype', 'Can add content type');
INSERT INTO "auth_permission" VALUES (18, 5, 'change_contenttype', 'Can change content type');
INSERT INTO "auth_permission" VALUES (19, 5, 'delete_contenttype', 'Can delete content type');
INSERT INTO "auth_permission" VALUES (20, 5, 'view_contenttype', 'Can view content type');
INSERT INTO "auth_permission" VALUES (21, 6, 'add_session', 'Can add session');
INSERT INTO "auth_permission" VALUES (22, 6, 'change_session', 'Can change session');
INSERT INTO "auth_permission" VALUES (23, 6, 'delete_session', 'Can delete session');
INSERT INTO "auth_permission" VALUES (24, 6, 'view_session', 'Can view session');
INSERT INTO "auth_permission" VALUES (25, 7, 'add_category', 'Can add category');
INSERT INTO "auth_permission" VALUES (26, 7, 'change_category', 'Can change category');
INSERT INTO "auth_permission" VALUES (27, 7, 'delete_category', 'Can delete category');
INSERT INTO "auth_permission" VALUES (28, 7, 'view_category', 'Can view category');
INSERT INTO "auth_permission" VALUES (29, 8, 'add_contactus', 'Can add contact us');
INSERT INTO "auth_permission" VALUES (30, 8, 'change_contactus', 'Can change contact us');
INSERT INTO "auth_permission" VALUES (31, 8, 'delete_contactus', 'Can delete contact us');
INSERT INTO "auth_permission" VALUES (32, 8, 'view_contactus', 'Can view contact us');
INSERT INTO "auth_permission" VALUES (33, 9, 'add_customer', 'Can add customer');
INSERT INTO "auth_permission" VALUES (34, 9, 'change_customer', 'Can change customer');
INSERT INTO "auth_permission" VALUES (35, 9, 'delete_customer', 'Can delete customer');
INSERT INTO "auth_permission" VALUES (36, 9, 'view_customer', 'Can view customer');
INSERT INTO "auth_permission" VALUES (37, 10, 'add_image', 'Can add image');
INSERT INTO "auth_permission" VALUES (38, 10, 'change_image', 'Can change image');
INSERT INTO "auth_permission" VALUES (39, 10, 'delete_image', 'Can delete image');
INSERT INTO "auth_permission" VALUES (40, 10, 'view_image', 'Can view image');
INSERT INTO "auth_permission" VALUES (41, 11, 'add_movie', 'Can add movie');
INSERT INTO "auth_permission" VALUES (42, 11, 'change_movie', 'Can change movie');
INSERT INTO "auth_permission" VALUES (43, 11, 'delete_movie', 'Can delete movie');
INSERT INTO "auth_permission" VALUES (44, 11, 'view_movie', 'Can view movie');
INSERT INTO "auth_permission" VALUES (45, 12, 'add_newsdetails', 'Can add news details');
INSERT INTO "auth_permission" VALUES (46, 12, 'change_newsdetails', 'Can change news details');
INSERT INTO "auth_permission" VALUES (47, 12, 'delete_newsdetails', 'Can delete news details');
INSERT INTO "auth_permission" VALUES (48, 12, 'view_newsdetails', 'Can view news details');
INSERT INTO "auth_permission" VALUES (49, 13, 'add_projecttype', 'Can add project type');
INSERT INTO "auth_permission" VALUES (50, 13, 'change_projecttype', 'Can change project type');
INSERT INTO "auth_permission" VALUES (51, 13, 'delete_projecttype', 'Can delete project type');
INSERT INTO "auth_permission" VALUES (52, 13, 'view_projecttype', 'Can view project type');
INSERT INTO "auth_permission" VALUES (53, 14, 'add_review', 'Can add review');
INSERT INTO "auth_permission" VALUES (54, 14, 'change_review', 'Can change review');
INSERT INTO "auth_permission" VALUES (55, 14, 'delete_review', 'Can delete review');
INSERT INTO "auth_permission" VALUES (56, 14, 'view_review', 'Can view review');
INSERT INTO "auth_permission" VALUES (57, 15, 'add_service', 'Can add service');
INSERT INTO "auth_permission" VALUES (58, 15, 'change_service', 'Can change service');
INSERT INTO "auth_permission" VALUES (59, 15, 'delete_service', 'Can delete service');
INSERT INTO "auth_permission" VALUES (60, 15, 'view_service', 'Can view service');
INSERT INTO "auth_permission" VALUES (61, 16, 'add_servicedetail', 'Can add service detail');
INSERT INTO "auth_permission" VALUES (62, 16, 'change_servicedetail', 'Can change service detail');
INSERT INTO "auth_permission" VALUES (63, 16, 'delete_servicedetail', 'Can delete service detail');
INSERT INTO "auth_permission" VALUES (64, 16, 'view_servicedetail', 'Can view service detail');
INSERT INTO "auth_permission" VALUES (65, 17, 'add_setting', 'Can add setting');
INSERT INTO "auth_permission" VALUES (66, 17, 'change_setting', 'Can change setting');
INSERT INTO "auth_permission" VALUES (67, 17, 'delete_setting', 'Can delete setting');
INSERT INTO "auth_permission" VALUES (68, 17, 'view_setting', 'Can view setting');
INSERT INTO "auth_permission" VALUES (69, 18, 'add_statistic', 'Can add statistic');
INSERT INTO "auth_permission" VALUES (70, 18, 'change_statistic', 'Can change statistic');
INSERT INTO "auth_permission" VALUES (71, 18, 'delete_statistic', 'Can delete statistic');
INSERT INTO "auth_permission" VALUES (72, 18, 'view_statistic', 'Can view statistic');
INSERT INTO "auth_permission" VALUES (73, 19, 'add_tag', 'Can add tag');
INSERT INTO "auth_permission" VALUES (74, 19, 'change_tag', 'Can change tag');
INSERT INTO "auth_permission" VALUES (75, 19, 'delete_tag', 'Can delete tag');
INSERT INTO "auth_permission" VALUES (76, 19, 'view_tag', 'Can view tag');
INSERT INTO "auth_permission" VALUES (77, 20, 'add_team', 'Can add team');
INSERT INTO "auth_permission" VALUES (78, 20, 'change_team', 'Can change team');
INSERT INTO "auth_permission" VALUES (79, 20, 'delete_team', 'Can delete team');
INSERT INTO "auth_permission" VALUES (80, 20, 'view_team', 'Can view team');
INSERT INTO "auth_permission" VALUES (81, 21, 'add_comment', 'Can add comment');
INSERT INTO "auth_permission" VALUES (82, 21, 'change_comment', 'Can change comment');
INSERT INTO "auth_permission" VALUES (83, 21, 'delete_comment', 'Can delete comment');
INSERT INTO "auth_permission" VALUES (84, 21, 'view_comment', 'Can view comment');
INSERT INTO "auth_permission" VALUES (85, 22, 'add_project', 'Can add project');
INSERT INTO "auth_permission" VALUES (86, 22, 'change_project', 'Can change project');
INSERT INTO "auth_permission" VALUES (87, 22, 'delete_project', 'Can delete project');
INSERT INTO "auth_permission" VALUES (88, 22, 'view_project', 'Can view project');
INSERT INTO "auth_permission" VALUES (89, 23, 'add_news', 'Can add news');
INSERT INTO "auth_permission" VALUES (90, 23, 'change_news', 'Can change news');
INSERT INTO "auth_permission" VALUES (91, 23, 'delete_news', 'Can delete news');
INSERT INTO "auth_permission" VALUES (92, 23, 'view_news', 'Can view news');
INSERT INTO "auth_permission" VALUES (93, 24, 'add_carousel', 'Can add carousel');
INSERT INTO "auth_permission" VALUES (94, 24, 'change_carousel', 'Can change carousel');
INSERT INTO "auth_permission" VALUES (95, 24, 'delete_carousel', 'Can delete carousel');
INSERT INTO "auth_permission" VALUES (96, 24, 'view_carousel', 'Can view carousel');
INSERT INTO "auth_permission" VALUES (97, 25, 'add_swiper', 'Can add swiper');
INSERT INTO "auth_permission" VALUES (98, 25, 'change_swiper', 'Can change swiper');
INSERT INTO "auth_permission" VALUES (99, 25, 'delete_swiper', 'Can delete swiper');
INSERT INTO "auth_permission" VALUES (100, 25, 'view_swiper', 'Can view swiper');
INSERT INTO "auth_permission" VALUES (101, 26, 'add_projectdetail', 'Can add project detail');
INSERT INTO "auth_permission" VALUES (102, 26, 'change_projectdetail', 'Can change project detail');
INSERT INTO "auth_permission" VALUES (103, 26, 'delete_projectdetail', 'Can delete project detail');
INSERT INTO "auth_permission" VALUES (104, 26, 'view_projectdetail', 'Can view project detail');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS "auth_user";
CREATE TABLE "auth_user" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "password" varchar(128) NOT NULL,
  "last_login" datetime,
  "is_superuser" bool NOT NULL,
  "username" varchar(150) NOT NULL,
  "last_name" varchar(150) NOT NULL,
  "email" varchar(254) NOT NULL,
  "is_staff" bool NOT NULL,
  "is_active" bool NOT NULL,
  "date_joined" datetime NOT NULL,
  "first_name" varchar(150) NOT NULL,
  UNIQUE ("username" ASC)
);

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO "auth_user" VALUES (1, 'pbkdf2_sha256$870000$DFhCi2zFvGFfmx93Rsw3c7$O6zPnAr3bYjLKACmHOdTjJ4wWuWc8jAesoLUoXDl0Pk=', '2025-04-21 07:59:51.211854', 1, 'admin', '', 'admin@gmail.com', 1, 1, '2025-03-02 11:37:14.735431', '');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS "auth_user_groups";
CREATE TABLE "auth_user_groups" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" integer NOT NULL,
  "group_id" integer NOT NULL,
  FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS "auth_user_user_permissions";
CREATE TABLE "auth_user_user_permissions" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" integer NOT NULL,
  "permission_id" integer NOT NULL,
  FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS "django_admin_log";
CREATE TABLE "django_admin_log" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "object_id" text,
  "object_repr" varchar(200) NOT NULL,
  "action_flag" smallint unsigned NOT NULL,
  "change_message" text NOT NULL,
  "content_type_id" integer,
  "user_id" integer NOT NULL,
  "action_time" datetime NOT NULL,
  FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
   ("action_flag" >= 0)
);

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO "django_admin_log" VALUES (1, '1', 'ورزشی', 1, '[{"added": {}}]', 7, 1, '2025-03-03 07:30:31.746538');
INSERT INTO "django_admin_log" VALUES (2, '1', 'خبر ورزشی', 1, '[{"added": {}}]', 23, 1, '2025-03-03 08:42:00.180923');
INSERT INTO "django_admin_log" VALUES (3, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 08:44:40.196136');
INSERT INTO "django_admin_log" VALUES (4, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Summary"]}}]', 23, 1, '2025-03-03 09:35:07.230057');
INSERT INTO "django_admin_log" VALUES (5, '1', 'خبر ورزشی', 2, '[]', 23, 1, '2025-03-03 09:35:17.530991');
INSERT INTO "django_admin_log" VALUES (6, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Summary"]}}]', 23, 1, '2025-03-03 09:36:38.979099');
INSERT INTO "django_admin_log" VALUES (7, '1', 'خبر ورزشی', 2, '[]', 23, 1, '2025-03-03 10:05:27.878335');
INSERT INTO "django_admin_log" VALUES (8, '1', 'خبر ورزشی', 2, '[]', 23, 1, '2025-03-03 10:05:35.232381');
INSERT INTO "django_admin_log" VALUES (9, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 10:12:18.972238');
INSERT INTO "django_admin_log" VALUES (10, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 10:12:46.971622');
INSERT INTO "django_admin_log" VALUES (11, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 10:12:58.763203');
INSERT INTO "django_admin_log" VALUES (12, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 10:45:01.084006');
INSERT INTO "django_admin_log" VALUES (13, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 10:45:09.108050');
INSERT INTO "django_admin_log" VALUES (14, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 10:45:39.133122');
INSERT INTO "django_admin_log" VALUES (15, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 10:54:44.038338');
INSERT INTO "django_admin_log" VALUES (16, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 10:55:01.692888');
INSERT INTO "django_admin_log" VALUES (17, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 10:55:39.644988');
INSERT INTO "django_admin_log" VALUES (18, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-03 10:55:45.179196');
INSERT INTO "django_admin_log" VALUES (19, '2', 'اقتصادی', 1, '[{"added": {}}]', 7, 1, '2025-03-03 10:59:24.318379');
INSERT INTO "django_admin_log" VALUES (20, '2', 'اقتصادی', 1, '[{"added": {}}]', 23, 1, '2025-03-03 10:59:56.709961');
INSERT INTO "django_admin_log" VALUES (21, '3', 'عمران', 1, '[{"added": {}}]', 7, 1, '2025-03-03 11:21:02.932406');
INSERT INTO "django_admin_log" VALUES (22, '3', 'عمران', 1, '[{"added": {}}]', 23, 1, '2025-03-03 11:21:37.744209');
INSERT INTO "django_admin_log" VALUES (23, '3', 'عمران', 2, '[{"changed": {"fields": ["Is approved"]}}]', 23, 1, '2025-03-03 11:21:41.741473');
INSERT INTO "django_admin_log" VALUES (24, '2', 'اقتصادی', 2, '[]', 23, 1, '2025-03-03 11:21:45.244269');
INSERT INTO "django_admin_log" VALUES (25, '2', 'اقتصادی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-13 11:18:09.378001');
INSERT INTO "django_admin_log" VALUES (26, '2', 'اقتصادی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-13 11:18:19.358776');
INSERT INTO "django_admin_log" VALUES (27, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-13 11:18:24.008800');
INSERT INTO "django_admin_log" VALUES (28, '1', 'خبر ورزشی', 2, '[{"changed": {"fields": ["Main picture"]}}]', 23, 1, '2025-03-13 11:18:30.292063');
INSERT INTO "django_admin_log" VALUES (29, '1', 'بازسازی', 1, '[{"added": {}}]', 13, 1, '2025-04-14 12:38:00.164519');
INSERT INTO "django_admin_log" VALUES (30, '2', 'ساخت و ساز', 1, '[{"added": {}}]', 13, 1, '2025-04-14 12:38:09.345925');
INSERT INTO "django_admin_log" VALUES (31, '3', 'تعمیرات', 1, '[{"added": {}}]', 13, 1, '2025-04-14 12:38:19.071536');
INSERT INTO "django_admin_log" VALUES (32, '4', 'طراحی', 1, '[{"added": {}}]', 13, 1, '2025-04-14 12:38:26.305936');
INSERT INTO "django_admin_log" VALUES (33, '1', 'برج ازادی', 1, '[{"added": {}}]', 19, 1, '2025-04-14 13:38:33.575350');
INSERT INTO "django_admin_log" VALUES (34, '1', 'اسیا تک', 1, '[{"added": {}}]', 9, 1, '2025-04-14 13:40:44.384237');
INSERT INTO "django_admin_log" VALUES (35, '1', 'title_project', 1, '[{"added": {}}]', 22, 1, '2025-04-14 13:40:51.648400');
INSERT INTO "django_admin_log" VALUES (36, '1', 'بازسازی یک', 2, '[{"changed": {"fields": ["Title"]}}]', 22, 1, '2025-04-14 13:41:22.615331');
INSERT INTO "django_admin_log" VALUES (37, '2', 'ساخت و ساز', 2, '[{"changed": {"fields": ["Is active"]}}]', 13, 1, '2025-04-14 16:04:09.802079');
INSERT INTO "django_admin_log" VALUES (38, '2', 'ساخت و ساز', 2, '[{"changed": {"fields": ["Is active"]}}]', 13, 1, '2025-04-14 16:04:22.291610');
INSERT INTO "django_admin_log" VALUES (39, '2', 'طراحی مترو', 1, '[{"added": {}}]', 19, 1, '2025-04-14 16:16:11.850705');
INSERT INTO "django_admin_log" VALUES (40, '2', 'بهره وری مترو', 1, '[{"added": {}}]', 9, 1, '2025-04-14 16:17:18.131227');
INSERT INTO "django_admin_log" VALUES (41, '2', 'طراحی', 1, '[{"added": {}}]', 22, 1, '2025-04-14 16:17:25.116469');
INSERT INTO "django_admin_log" VALUES (42, '2', 'طراحی', 2, '[]', 22, 1, '2025-04-14 16:18:59.499504');
INSERT INTO "django_admin_log" VALUES (43, '1', 'Carousel-1', 1, '[{"added": {}}]', 24, 1, '2025-04-15 08:04:20.333753');
INSERT INTO "django_admin_log" VALUES (44, '2', 'Carousel-2', 1, '[{"added": {}}]', 24, 1, '2025-04-15 08:04:59.272193');
INSERT INTO "django_admin_log" VALUES (45, '3', 'Carousel-3', 1, '[{"added": {}}]', 24, 1, '2025-04-15 08:05:06.386414');
INSERT INTO "django_admin_log" VALUES (46, '4', 'Carousel-4', 1, '[{"added": {}}]', 24, 1, '2025-04-15 08:05:12.726127');
INSERT INTO "django_admin_log" VALUES (47, '5', 'Carousel-5', 1, '[{"added": {}}]', 24, 1, '2025-04-15 08:05:19.223085');
INSERT INTO "django_admin_log" VALUES (48, '1', 'Carousel-1', 2, '[{"changed": {"fields": ["Sort", "Interval"]}}]', 24, 1, '2025-04-15 09:44:14.537465');
INSERT INTO "django_admin_log" VALUES (49, '1', 'Carousel-1', 2, '[]', 24, 1, '2025-04-15 09:44:18.250932');
INSERT INTO "django_admin_log" VALUES (50, '2', 'Carousel-2', 2, '[{"changed": {"fields": ["Sort", "Interval"]}}]', 24, 1, '2025-04-15 09:44:26.418191');
INSERT INTO "django_admin_log" VALUES (51, '3', 'Carousel-3', 2, '[{"changed": {"fields": ["Sort", "Interval"]}}]', 24, 1, '2025-04-15 09:44:33.883893');
INSERT INTO "django_admin_log" VALUES (52, '4', 'Carousel-4', 2, '[{"changed": {"fields": ["Sort", "Interval"]}}]', 24, 1, '2025-04-15 09:44:47.680024');
INSERT INTO "django_admin_log" VALUES (53, '5', 'Carousel-5', 2, '[{"changed": {"fields": ["Sort", "Interval"]}}]', 24, 1, '2025-04-15 09:44:56.215402');
INSERT INTO "django_admin_log" VALUES (54, '1', 'برج ازادی', 2, '[]', 19, 1, '2025-04-15 11:35:50.253054');
INSERT INTO "django_admin_log" VALUES (55, '3', 'برج میلاد', 1, '[{"added": {}}]', 19, 1, '2025-04-15 11:36:26.663234');
INSERT INTO "django_admin_log" VALUES (56, '4', 'طراحی داخلی', 1, '[{"added": {}}]', 19, 1, '2025-04-15 11:36:39.965162');
INSERT INTO "django_admin_log" VALUES (57, '5', 'آتی سازان', 1, '[{"added": {}}]', 19, 1, '2025-04-15 11:36:48.479418');
INSERT INTO "django_admin_log" VALUES (58, '6', 'تعمیرات', 1, '[{"added": {}}]', 19, 1, '2025-04-15 11:36:57.325213');
INSERT INTO "django_admin_log" VALUES (59, '7', 'معماری داخلی', 1, '[{"added": {}}]', 19, 1, '2025-04-15 11:37:06.207828');
INSERT INTO "django_admin_log" VALUES (60, '8', 'نمایشگاه بین المللی', 1, '[{"added": {}}]', 19, 1, '2025-04-15 11:37:17.668672');
INSERT INTO "django_admin_log" VALUES (61, '9', 'بازسازی', 1, '[{"added": {}}]', 19, 1, '2025-04-15 11:37:24.677234');
INSERT INTO "django_admin_log" VALUES (62, '10', 'مجتمع تجاری نور', 1, '[{"added": {}}]', 19, 1, '2025-04-15 11:37:39.003202');
INSERT INTO "django_admin_log" VALUES (63, '1', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ', 2, '[{"changed": {"fields": ["Title"]}}]', 22, 1, '2025-04-15 11:42:11.702266');
INSERT INTO "django_admin_log" VALUES (64, '1', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ', 2, '[{"changed": {"fields": ["Body", "Summary", "Project type", "Published at"]}}]', 22, 1, '2025-04-15 11:44:16.979384');
INSERT INTO "django_admin_log" VALUES (65, '3', '2لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:45:36.877596');
INSERT INTO "django_admin_log" VALUES (66, '4', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ3', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:46:12.186672');
INSERT INTO "django_admin_log" VALUES (67, '5', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ4', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:46:46.860623');
INSERT INTO "django_admin_log" VALUES (68, '6', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ5', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:47:13.926817');
INSERT INTO "django_admin_log" VALUES (69, '7', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ6', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:47:37.783433');
INSERT INTO "django_admin_log" VALUES (70, '2', 'طراحی', 3, '', 22, 1, '2025-04-15 11:47:59.438854');
INSERT INTO "django_admin_log" VALUES (71, '8', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ7', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:48:42.169446');
INSERT INTO "django_admin_log" VALUES (72, '9', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ8', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:49:05.442451');
INSERT INTO "django_admin_log" VALUES (73, '10', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ9', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:49:35.974650');
INSERT INTO "django_admin_log" VALUES (74, '11', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ10', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:50:06.271195');
INSERT INTO "django_admin_log" VALUES (75, '12', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ11', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:50:32.584727');
INSERT INTO "django_admin_log" VALUES (76, '13', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ12', 1, '[{"added": {}}]', 22, 1, '2025-04-15 11:50:56.873338');
INSERT INTO "django_admin_log" VALUES (77, '3', '2لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ', 2, '[{"changed": {"fields": ["Main picture"]}}]', 22, 1, '2025-04-15 11:52:10.991825');
INSERT INTO "django_admin_log" VALUES (78, '2', 'اقتصادی', 2, '[{"changed": {"fields": ["Body", "Summary"]}}]', 23, 1, '2025-04-15 11:56:07.425199');
INSERT INTO "django_admin_log" VALUES (79, '2', 'اقتصادی', 2, '[{"changed": {"fields": ["Body", "Summary"]}}]', 23, 1, '2025-04-15 11:56:21.958287');
INSERT INTO "django_admin_log" VALUES (80, '1', 'ورزشی', 2, '[{"changed": {"fields": ["Title", "Body", "Summary"]}}]', 23, 1, '2025-04-15 11:57:05.267585');
INSERT INTO "django_admin_log" VALUES (81, '2', 'اقتصادی', 2, '[{"changed": {"fields": ["Summary"]}}]', 23, 1, '2025-04-15 11:57:11.494905');
INSERT INTO "django_admin_log" VALUES (82, '3', 'عمران', 2, '[{"changed": {"fields": ["Body", "Summary"]}}]', 23, 1, '2025-04-15 11:57:17.843442');
INSERT INTO "django_admin_log" VALUES (83, '3', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ', 2, '[{"changed": {"fields": ["Title", "Summary"]}}]', 23, 1, '2025-04-15 11:57:44.435884');
INSERT INTO "django_admin_log" VALUES (84, '2', '2لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ', 2, '[{"changed": {"fields": ["Title", "Summary"]}}]', 23, 1, '2025-04-15 11:58:29.654570');
INSERT INTO "django_admin_log" VALUES (85, '1', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ3', 2, '[{"changed": {"fields": ["Title", "Summary"]}}]', 23, 1, '2025-04-15 11:58:37.088808');
INSERT INTO "django_admin_log" VALUES (86, '1', 'title1', 1, '[{"added": {}}]', 25, 1, '2025-04-15 12:33:28.210282');
INSERT INTO "django_admin_log" VALUES (87, '2', 'title2', 1, '[{"added": {}}]', 25, 1, '2025-04-15 12:33:39.552481');
INSERT INTO "django_admin_log" VALUES (88, '3', 'title3', 1, '[{"added": {}}]', 25, 1, '2025-04-15 12:33:48.542640');
INSERT INTO "django_admin_log" VALUES (89, '1', 'title', 1, '[{"added": {}}]', 25, 1, '2025-04-15 12:49:11.861683');
INSERT INTO "django_admin_log" VALUES (90, '2', 'title2', 1, '[{"added": {}}]', 25, 1, '2025-04-15 12:49:20.223138');
INSERT INTO "django_admin_log" VALUES (91, '3', 'title3', 1, '[{"added": {}}]', 25, 1, '2025-04-15 12:49:28.760555');
INSERT INTO "django_admin_log" VALUES (92, '1', 'title', 2, '[{"changed": {"fields": ["Interval"]}}]', 25, 1, '2025-04-15 13:12:46.463317');
INSERT INTO "django_admin_log" VALUES (93, '3', 'title3', 2, '[{"changed": {"fields": ["Interval"]}}]', 25, 1, '2025-04-15 13:12:51.121014');
INSERT INTO "django_admin_log" VALUES (94, '1', 'title', 2, '[]', 25, 1, '2025-04-15 13:12:53.383735');
INSERT INTO "django_admin_log" VALUES (95, '2', 'title2', 2, '[{"changed": {"fields": ["Interval"]}}]', 25, 1, '2025-04-15 13:12:57.625506');
INSERT INTO "django_admin_log" VALUES (96, '1', 'Carousel-1', 2, '[{"changed": {"fields": ["Interval"]}}]', 24, 1, '2025-04-21 08:07:33.148844');
INSERT INTO "django_admin_log" VALUES (97, '2', 'Carousel-2', 2, '[{"changed": {"fields": ["Interval"]}}]', 24, 1, '2025-04-21 08:07:38.198621');
INSERT INTO "django_admin_log" VALUES (98, '3', 'Carousel-3', 2, '[{"changed": {"fields": ["Interval"]}}]', 24, 1, '2025-04-21 08:07:41.012368');
INSERT INTO "django_admin_log" VALUES (99, '4', 'Carousel-4', 2, '[]', 24, 1, '2025-04-21 08:07:43.276229');
INSERT INTO "django_admin_log" VALUES (100, '5', 'Carousel-5', 2, '[{"changed": {"fields": ["Interval"]}}]', 24, 1, '2025-04-21 08:07:46.200303');
INSERT INTO "django_admin_log" VALUES (101, '1', 'title', 2, '[{"changed": {"fields": ["Interval"]}}]', 25, 1, '2025-04-21 08:32:04.595589');
INSERT INTO "django_admin_log" VALUES (102, '1', 'Carousel-1', 2, '[{"changed": {"fields": ["Caption", "Caption description"]}}]', 24, 1, '2025-04-21 09:53:20.374358');
INSERT INTO "django_admin_log" VALUES (103, '2', 'Carousel-2', 2, '[{"changed": {"fields": ["Caption", "Caption description"]}}]', 24, 1, '2025-04-21 09:53:39.558775');
INSERT INTO "django_admin_log" VALUES (104, '3', 'Carousel-3', 2, '[{"changed": {"fields": ["Caption", "Caption description"]}}]', 24, 1, '2025-04-21 09:53:54.339841');
INSERT INTO "django_admin_log" VALUES (105, '4', 'Carousel-4', 2, '[{"changed": {"fields": ["Caption", "Caption description"]}}]', 24, 1, '2025-04-21 09:54:08.025749');
INSERT INTO "django_admin_log" VALUES (106, '5', 'Carousel-5', 2, '[{"changed": {"fields": ["Caption", "Caption description"]}}]', 24, 1, '2025-04-21 09:54:19.782007');
INSERT INTO "django_admin_log" VALUES (107, '3', 'سلام', 2, '[{"changed": {"fields": ["Title"]}}]', 23, 1, '2025-04-21 13:44:00.544529');
INSERT INTO "django_admin_log" VALUES (108, '1', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ3', 2, '[{"changed": {"fields": ["Published at"]}}]', 23, 1, '2025-04-21 13:44:55.287273');
INSERT INTO "django_admin_log" VALUES (109, '1', 'title', 2, '[{"changed": {"fields": ["Content"]}}]', 25, 1, '2025-04-21 14:04:51.456532');
INSERT INTO "django_admin_log" VALUES (110, '1', 'title', 2, '[]', 25, 1, '2025-04-21 14:04:54.211437');
INSERT INTO "django_admin_log" VALUES (111, '2', 'title2', 2, '[{"changed": {"fields": ["Content"]}}]', 25, 1, '2025-04-21 14:04:57.658330');
INSERT INTO "django_admin_log" VALUES (112, '3', 'title3', 2, '[{"changed": {"fields": ["Content"]}}]', 25, 1, '2025-04-21 14:05:00.740789');
INSERT INTO "django_admin_log" VALUES (113, '3', 'title3', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:28:42.459586');
INSERT INTO "django_admin_log" VALUES (114, '1', 'title', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:28:45.696298');
INSERT INTO "django_admin_log" VALUES (115, '2', 'title2', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:28:48.514763');
INSERT INTO "django_admin_log" VALUES (116, '3', 'title3', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:28:59.954570');
INSERT INTO "django_admin_log" VALUES (117, '2', 'title2', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:29:04.324706');
INSERT INTO "django_admin_log" VALUES (118, '1', 'title', 2, '[{"changed": {"fields": ["Image path", "Is active"]}}]', 25, 1, '2025-04-21 14:29:08.819616');
INSERT INTO "django_admin_log" VALUES (119, '1', 'title', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:30:48.992170');
INSERT INTO "django_admin_log" VALUES (120, '2', 'title2', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:30:51.802193');
INSERT INTO "django_admin_log" VALUES (121, '3', 'title3', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:30:54.655221');
INSERT INTO "django_admin_log" VALUES (122, '3', 'title3', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:31:36.357620');
INSERT INTO "django_admin_log" VALUES (123, '2', 'title2', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:31:43.042623');
INSERT INTO "django_admin_log" VALUES (124, '1', 'title', 2, '[{"changed": {"fields": ["Image path"]}}]', 25, 1, '2025-04-21 14:31:48.355804');
INSERT INTO "django_admin_log" VALUES (125, '1', 'title', 2, '[{"changed": {"fields": ["Is active"]}}]', 25, 1, '2025-04-21 14:32:52.796614');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS "django_content_type";
CREATE TABLE "django_content_type" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "app_label" varchar(100) NOT NULL,
  "model" varchar(100) NOT NULL
);

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO "django_content_type" VALUES (1, 'admin', 'logentry');
INSERT INTO "django_content_type" VALUES (2, 'auth', 'permission');
INSERT INTO "django_content_type" VALUES (3, 'auth', 'group');
INSERT INTO "django_content_type" VALUES (4, 'auth', 'user');
INSERT INTO "django_content_type" VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO "django_content_type" VALUES (6, 'sessions', 'session');
INSERT INTO "django_content_type" VALUES (7, 'myConstruction', 'category');
INSERT INTO "django_content_type" VALUES (8, 'myConstruction', 'contactus');
INSERT INTO "django_content_type" VALUES (9, 'myConstruction', 'customer');
INSERT INTO "django_content_type" VALUES (10, 'myConstruction', 'image');
INSERT INTO "django_content_type" VALUES (11, 'myConstruction', 'movie');
INSERT INTO "django_content_type" VALUES (12, 'myConstruction', 'newsdetails');
INSERT INTO "django_content_type" VALUES (13, 'myConstruction', 'projecttype');
INSERT INTO "django_content_type" VALUES (14, 'myConstruction', 'review');
INSERT INTO "django_content_type" VALUES (15, 'myConstruction', 'service');
INSERT INTO "django_content_type" VALUES (16, 'myConstruction', 'servicedetail');
INSERT INTO "django_content_type" VALUES (17, 'myConstruction', 'setting');
INSERT INTO "django_content_type" VALUES (18, 'myConstruction', 'statistic');
INSERT INTO "django_content_type" VALUES (19, 'myConstruction', 'tag');
INSERT INTO "django_content_type" VALUES (20, 'myConstruction', 'team');
INSERT INTO "django_content_type" VALUES (21, 'myConstruction', 'comment');
INSERT INTO "django_content_type" VALUES (22, 'myConstruction', 'project');
INSERT INTO "django_content_type" VALUES (23, 'myConstruction', 'news');
INSERT INTO "django_content_type" VALUES (24, 'myConstruction', 'carousel');
INSERT INTO "django_content_type" VALUES (25, 'myConstruction', 'swiper');
INSERT INTO "django_content_type" VALUES (26, 'myConstruction', 'projectdetail');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS "django_migrations";
CREATE TABLE "django_migrations" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "app" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  "applied" datetime NOT NULL
);

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO "django_migrations" VALUES (1, 'contenttypes', '0001_initial', '2025-03-02 11:27:34.699602');
INSERT INTO "django_migrations" VALUES (2, 'auth', '0001_initial', '2025-03-02 11:27:34.712332');
INSERT INTO "django_migrations" VALUES (3, 'admin', '0001_initial', '2025-03-02 11:27:34.730081');
INSERT INTO "django_migrations" VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2025-03-02 11:27:34.740491');
INSERT INTO "django_migrations" VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2025-03-02 11:27:34.743999');
INSERT INTO "django_migrations" VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2025-03-02 11:27:34.750275');
INSERT INTO "django_migrations" VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2025-03-02 11:27:34.765125');
INSERT INTO "django_migrations" VALUES (8, 'auth', '0003_alter_user_email_max_length', '2025-03-02 11:27:34.765125');
INSERT INTO "django_migrations" VALUES (9, 'auth', '0004_alter_user_username_opts', '2025-03-02 11:27:34.775478');
INSERT INTO "django_migrations" VALUES (10, 'auth', '0005_alter_user_last_login_null', '2025-03-02 11:27:34.780540');
INSERT INTO "django_migrations" VALUES (11, 'auth', '0006_require_contenttypes_0002', '2025-03-02 11:27:34.780540');
INSERT INTO "django_migrations" VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2025-03-02 11:27:34.780540');
INSERT INTO "django_migrations" VALUES (13, 'auth', '0008_alter_user_username_max_length', '2025-03-02 11:27:34.801830');
INSERT INTO "django_migrations" VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2025-03-02 11:27:34.806816');
INSERT INTO "django_migrations" VALUES (15, 'auth', '0010_alter_group_name_max_length', '2025-03-02 11:27:34.812155');
INSERT INTO "django_migrations" VALUES (16, 'auth', '0011_update_proxy_permissions', '2025-03-02 11:27:34.818537');
INSERT INTO "django_migrations" VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2025-03-02 11:27:34.828404');
INSERT INTO "django_migrations" VALUES (18, 'myConstruction', '0001_initial', '2025-03-02 11:27:34.849167');
INSERT INTO "django_migrations" VALUES (19, 'sessions', '0001_initial', '2025-03-02 11:27:34.862950');
INSERT INTO "django_migrations" VALUES (20, 'myConstruction', '0002_projecttype_is_active_projecttype_name_and_more', '2025-04-14 12:37:04.089146');
INSERT INTO "django_migrations" VALUES (21, 'myConstruction', '0003_remove_project_category_project_project_type', '2025-04-14 13:37:16.484575');
INSERT INTO "django_migrations" VALUES (22, 'myConstruction', '0004_carousel', '2025-04-15 08:00:58.925693');
INSERT INTO "django_migrations" VALUES (23, 'myConstruction', '0005_carousel_created_date_carousel_interval_and_more', '2025-04-15 09:43:28.694267');
INSERT INTO "django_migrations" VALUES (24, 'myConstruction', '0006_swiper_remove_project_body_remove_project_customer_and_more', '2025-04-15 12:28:23.469075');
INSERT INTO "django_migrations" VALUES (25, 'myConstruction', '0007_projectdetail_swiper', '2025-04-15 12:38:27.843005');
INSERT INTO "django_migrations" VALUES (26, 'myConstruction', '0008_remove_projectdetail_swiper_swiper_project_detail', '2025-04-15 12:39:47.520764');
INSERT INTO "django_migrations" VALUES (27, 'myConstruction', '0009_projectdetail_image_path_delete_swiper', '2025-04-15 12:41:49.833681');
INSERT INTO "django_migrations" VALUES (28, 'myConstruction', '0010_remove_projectdetail_image_path_swiper', '2025-04-15 12:47:00.066973');
INSERT INTO "django_migrations" VALUES (29, 'myConstruction', '0011_remove_swiper_project_detail', '2025-04-15 13:29:59.125513');
INSERT INTO "django_migrations" VALUES (30, 'myConstruction', '0012_carousel_name_of_alt', '2025-04-21 07:57:39.392205');
INSERT INTO "django_migrations" VALUES (31, 'myConstruction', '0013_carousel_caption_carousel_caption_description', '2025-04-21 09:52:23.428731');
INSERT INTO "django_migrations" VALUES (32, 'myConstruction', '0014_news_data', '2025-04-21 13:06:54.877956');
INSERT INTO "django_migrations" VALUES (33, 'myConstruction', '0015_alter_news_data', '2025-04-21 13:31:35.608492');
INSERT INTO "django_migrations" VALUES (34, 'myConstruction', '0016_alter_swiper_options_swiper_content', '2025-04-21 14:03:26.123198');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS "django_session";
CREATE TABLE "django_session" (
  "session_key" varchar(40) NOT NULL,
  "session_data" text NOT NULL,
  "expire_date" datetime NOT NULL,
  PRIMARY KEY ("session_key")
);

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO "django_session" VALUES ('dxoucrsrztmglhxkwhzgkp1rc0tbcqqe', '.eJxVjDEOwjAMRe-SGUUkNLHLyM4ZKsd2SQElUtNOiLtDpQ6w_vfef5mB1iUPa9N5mMScjTOH3y0RP7RsQO5UbtVyLcs8JbspdqfNXqvo87K7fweZWv7WUSUEoNCTF8eAkJAgSPLiOcax65BiLxoBnXhIdARxongSZFYcwbw_7184gg:1tp0De:onyAuZ2gcdcKvQ8VQCIZOnAzr4TEzcXI9jf-6iMppcw', '2025-03-17 07:28:06.958340');
INSERT INTO "django_session" VALUES ('dns8o83u3uukag0n4wvrw6myup9g1n1c', '.eJxVjDEOwjAMRe-SGUUkNLHLyM4ZKsd2SQElUtNOiLtDpQ6w_vfef5mB1iUPa9N5mMScjTOH3y0RP7RsQO5UbtVyLcs8JbspdqfNXqvo87K7fweZWv7WUSUEoNCTF8eAkJAgSPLiOcax65BiLxoBnXhIdARxongSZFYcwbw_7184gg:1u4fQy:qZ8C5mM9c1HlK1NSuVk9Vt2H1_IAAHK7XnlZTXzDS0Q', '2025-04-29 12:30:36.465723');
INSERT INTO "django_session" VALUES ('ydzi9o074uzbidvsg8ke4g98041xqsru', '.eJxVjDEOwjAMRe-SGUUkNLHLyM4ZKsd2SQElUtNOiLtDpQ6w_vfef5mB1iUPa9N5mMScjTOH3y0RP7RsQO5UbtVyLcs8JbspdqfNXqvo87K7fweZWv7WUSUEoNCTF8eAkJAgSPLiOcax65BiLxoBnXhIdARxongSZFYcwbw_7184gg:1u6m4F:uarM-gqCtDdngaUzQRNnMiIzoXSe_19bo9mUyuBAHtM', '2025-05-05 07:59:51.218888');

-- ----------------------------
-- Table structure for myConstruction_carousel
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_carousel";
CREATE TABLE "myConstruction_carousel" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" varchar(100) NOT NULL,
  "image_path" varchar(100),
  "is_active" bool NOT NULL,
  "created_date" datetime,
  "interval" integer NOT NULL,
  "sort" integer NOT NULL,
  "updated_date" datetime,
  "name_of_alt" varchar(100),
  "caption" varchar(255),
  "caption_description" varchar(1024)
);

-- ----------------------------
-- Records of myConstruction_carousel
-- ----------------------------
INSERT INTO "myConstruction_carousel" VALUES (1, 'Carousel-1', 'carousels/hero-carousel-1.jpg', 1, '2025-04-15 09:43:28.678968', 3, 1, '2025-04-21 09:53:20.374358', NULL, 'hero', 'hero carousel 1');
INSERT INTO "myConstruction_carousel" VALUES (2, 'Carousel-2', 'carousels/hero-carousel-2.jpg', 1, '2025-04-15 09:43:28.678968', 3, 2, '2025-04-21 09:53:39.556769', NULL, 'hero 2', 'hero carousel 2');
INSERT INTO "myConstruction_carousel" VALUES (3, 'Carousel-3', 'carousels/hero-carousel-3.jpg', 1, '2025-04-15 09:43:28.678968', 3, 3, '2025-04-21 09:53:54.339841', NULL, 'hero 3', 'hero carousel 3');
INSERT INTO "myConstruction_carousel" VALUES (4, 'Carousel-4', 'carousels/hero-carousel-4.jpg', 1, '2025-04-15 09:43:28.678968', 3, 4, '2025-04-21 09:54:08.023410', NULL, 'hero  4', 'hero carousel 4');
INSERT INTO "myConstruction_carousel" VALUES (5, 'Carousel-5', 'carousels/hero-carousel-5.jpg', 1, '2025-04-15 09:43:28.678968', 3, 5, '2025-04-21 09:54:19.778966', NULL, 'hero 5', 'hero carousel 5');

-- ----------------------------
-- Table structure for myConstruction_category
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_category";
CREATE TABLE "myConstruction_category" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" varchar(100),
  "type" varchar(10) NOT NULL,
  "is_active" bool NOT NULL,
  "model_name" varchar(100),
  UNIQUE ("title" ASC),
  UNIQUE ("model_name" ASC)
);

-- ----------------------------
-- Records of myConstruction_category
-- ----------------------------
INSERT INTO "myConstruction_category" VALUES (1, 'ورزشی', 'News', 1, NULL);
INSERT INTO "myConstruction_category" VALUES (2, 'اقتصادی', 'News', 1, NULL);
INSERT INTO "myConstruction_category" VALUES (3, 'عمران', 'News', 1, NULL);

-- ----------------------------
-- Table structure for myConstruction_comment
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_comment";
CREATE TABLE "myConstruction_comment" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" varchar(200),
  "body" text,
  "is_approved" bool NOT NULL,
  "admin_reply" text,
  "admin_reply_at" datetime,
  "created_date" datetime,
  "updated_date" datetime,
  "object_id" integer unsigned,
  "admin_approved_id" integer,
  "content_type_id" integer,
  "parent_id" bigint,
  "user_id" integer,
  FOREIGN KEY ("admin_approved_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("parent_id") REFERENCES "myConstruction_comment" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
   ("object_id" >= 0)
);

-- ----------------------------
-- Records of myConstruction_comment
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_contactus
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_contactus";
CREATE TABLE "myConstruction_contactus" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of myConstruction_contactus
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_customer
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_customer";
CREATE TABLE "myConstruction_customer" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name_customer" varchar(100),
  "website" varchar(100),
  "body" text,
  "is_active" bool NOT NULL,
  "created_date" datetime,
  "updated_date" datetime,
  UNIQUE ("name_customer" ASC),
  UNIQUE ("website" ASC)
);

-- ----------------------------
-- Records of myConstruction_customer
-- ----------------------------
INSERT INTO "myConstruction_customer" VALUES (1, 'اسیا تک', '1544.ir', 'تهران - اسیاتک', 1, '2025-04-14 13:40:44.384237', '2025-04-14 13:40:44.384237');
INSERT INTO "myConstruction_customer" VALUES (2, 'بهره وری مترو', '15424.ir', 'zakani.ir', 1, '2025-04-14 16:17:18.131227', '2025-04-14 16:17:18.131227');

-- ----------------------------
-- Table structure for myConstruction_image
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_image";
CREATE TABLE "myConstruction_image" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of myConstruction_image
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_movie
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_movie";
CREATE TABLE "myConstruction_movie" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of myConstruction_movie
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_news
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_news";
CREATE TABLE "myConstruction_news" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" varchar(100),
  "body" text,
  "summary" text,
  "main_picture" varchar(100),
  "published_at" datetime,
  "is_approved" bool NOT NULL,
  "created_date" datetime,
  "updated_date" datetime,
  "category_id" bigint,
  "user_id" integer,
  "data" text,
  FOREIGN KEY ("category_id") REFERENCES "myConstruction_category" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  UNIQUE ("title" ASC),
   ((JSON_VALID("data") OR "data" IS NULL))
);

-- ----------------------------
-- Records of myConstruction_news
-- ----------------------------
INSERT INTO "myConstruction_news" VALUES (1, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ3', '', '', 'news/blog-2.jpg', '2025-04-16 07:39:48', 1, '2025-03-03 08:42:00.180923', '2025-04-21 13:44:55.287273', 1, 1, '{}');
INSERT INTO "myConstruction_news" VALUES (2, '2لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ', '', '', 'news/blog-1.jpg', '2025-03-03 10:59:53', 1, '2025-03-03 10:59:56.693977', '2025-04-15 11:58:29.654570', 2, 1, '{}');
INSERT INTO "myConstruction_news" VALUES (3, 'سلام', '', '', 'news/blog-3.jpg', '2025-03-03 11:21:36', 1, '2025-03-03 11:21:37.739192', '2025-04-21 13:44:00.543529', 3, 1, '{}');

-- ----------------------------
-- Table structure for myConstruction_news_tags
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_news_tags";
CREATE TABLE "myConstruction_news_tags" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "news_id" bigint NOT NULL,
  "tag_id" bigint NOT NULL,
  FOREIGN KEY ("news_id") REFERENCES "myConstruction_news" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("tag_id") REFERENCES "myConstruction_tag" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);

-- ----------------------------
-- Records of myConstruction_news_tags
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_newsdetails
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_newsdetails";
CREATE TABLE "myConstruction_newsdetails" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of myConstruction_newsdetails
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_project
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_project";
CREATE TABLE "myConstruction_project" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" varchar(100),
  "main_picture" varchar(100),
  "published_at" datetime,
  "is_approved" bool NOT NULL,
  "created_date" datetime,
  "updated_date" datetime,
  "user_id" integer,
  "project_type_id" bigint,
  FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("project_type_id") REFERENCES "myConstruction_projecttype" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  UNIQUE ("title" ASC)
);

-- ----------------------------
-- Records of myConstruction_project
-- ----------------------------
INSERT INTO "myConstruction_project" VALUES (1, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ', 'projects/repairs-1.jpg', '2025-04-15 11:44:13', 1, '2025-04-14 13:40:51.641256', '2025-04-15 11:44:16.977883', 1, 3);
INSERT INTO "myConstruction_project" VALUES (3, '2لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ', 'projects/repairs-2.jpg', '2025-04-15 11:45:19', 1, '2025-04-15 11:45:36.877596', '2025-04-15 11:52:10.991825', 1, 3);
INSERT INTO "myConstruction_project" VALUES (4, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ3', 'projects/repairs-3.jpg', '2025-04-15 11:46:09', 1, '2025-04-15 11:46:12.176664', '2025-04-15 11:46:12.176664', 1, 3);
INSERT INTO "myConstruction_project" VALUES (5, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ4', 'projects/construction-1.jpg', '2025-04-15 11:46:44', 1, '2025-04-15 11:46:46.860623', '2025-04-15 11:46:46.860623', 1, 2);
INSERT INTO "myConstruction_project" VALUES (6, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ5', 'projects/construction-2.jpg', '2025-04-15 11:47:11', 1, '2025-04-15 11:47:13.926817', '2025-04-15 11:47:13.926817', 1, 2);
INSERT INTO "myConstruction_project" VALUES (7, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ6', 'projects/construction-3_2GAc8Be.jpg', '2025-04-15 11:47:35', 1, '2025-04-15 11:47:37.783433', '2025-04-15 11:47:37.783433', 1, 2);
INSERT INTO "myConstruction_project" VALUES (8, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ7', 'projects/remodeling-1.jpg', '2025-04-15 11:48:40', 1, '2025-04-15 11:48:42.169446', '2025-04-15 11:48:42.169446', 1, 1);
INSERT INTO "myConstruction_project" VALUES (9, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ8', 'projects/remodeling-2.jpg', '2025-04-15 11:49:04', 1, '2025-04-15 11:49:05.440128', '2025-04-15 11:49:05.440128', 1, 1);
INSERT INTO "myConstruction_project" VALUES (10, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ9', 'projects/remodeling-3.jpg', '2025-04-15 11:49:33', 1, '2025-04-15 11:49:35.974650', '2025-04-15 11:49:35.974650', 1, 1);
INSERT INTO "myConstruction_project" VALUES (11, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ10', 'projects/design-1.jpg', '2025-04-15 11:50:04', 1, '2025-04-15 11:50:06.271195', '2025-04-15 11:50:06.271195', 1, 4);
INSERT INTO "myConstruction_project" VALUES (12, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ11', 'projects/design-2.jpg', '2025-04-15 11:50:30', 1, '2025-04-15 11:50:32.584727', '2025-04-15 11:50:32.584727', 1, 4);
INSERT INTO "myConstruction_project" VALUES (13, 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ12', 'projects/design-3.jpg', '2025-04-15 11:50:54', 1, '2025-04-15 11:50:56.873338', '2025-04-15 11:50:56.873338', 1, 4);

-- ----------------------------
-- Table structure for myConstruction_project_tags
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_project_tags";
CREATE TABLE "myConstruction_project_tags" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "project_id" bigint NOT NULL,
  "tag_id" bigint NOT NULL,
  FOREIGN KEY ("project_id") REFERENCES "myConstruction_project" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("tag_id") REFERENCES "myConstruction_tag" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);

-- ----------------------------
-- Records of myConstruction_project_tags
-- ----------------------------
INSERT INTO "myConstruction_project_tags" VALUES (1, 1, 1);
INSERT INTO "myConstruction_project_tags" VALUES (3, 3, 6);
INSERT INTO "myConstruction_project_tags" VALUES (4, 4, 10);
INSERT INTO "myConstruction_project_tags" VALUES (5, 5, 3);
INSERT INTO "myConstruction_project_tags" VALUES (6, 6, 5);
INSERT INTO "myConstruction_project_tags" VALUES (7, 7, 9);
INSERT INTO "myConstruction_project_tags" VALUES (8, 8, 3);
INSERT INTO "myConstruction_project_tags" VALUES (9, 9, 4);
INSERT INTO "myConstruction_project_tags" VALUES (10, 10, 8);
INSERT INTO "myConstruction_project_tags" VALUES (11, 11, 1);
INSERT INTO "myConstruction_project_tags" VALUES (12, 12, 7);
INSERT INTO "myConstruction_project_tags" VALUES (13, 13, 10);

-- ----------------------------
-- Table structure for myConstruction_projectdetail
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_projectdetail";
CREATE TABLE "myConstruction_projectdetail" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" varchar(100),
  "body" text,
  "summary" text,
  "main_picture" varchar(100),
  "project_web_address" varchar(200),
  "project_date" datetime,
  "published_at" datetime,
  "is_approved" bool NOT NULL,
  "created_date" datetime,
  "updated_date" datetime,
  "customer_id" bigint,
  "project_type_id" bigint,
  "user_id" integer,
  FOREIGN KEY ("customer_id") REFERENCES "myConstruction_customer" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("project_type_id") REFERENCES "myConstruction_projecttype" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  UNIQUE ("title" ASC)
);

-- ----------------------------
-- Records of myConstruction_projectdetail
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_projectdetail_tags
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_projectdetail_tags";
CREATE TABLE "myConstruction_projectdetail_tags" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "projectdetail_id" bigint NOT NULL,
  "tag_id" bigint NOT NULL,
  FOREIGN KEY ("projectdetail_id") REFERENCES "myConstruction_projectdetail" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("tag_id") REFERENCES "myConstruction_tag" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);

-- ----------------------------
-- Records of myConstruction_projectdetail_tags
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_projecttype
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_projecttype";
CREATE TABLE "myConstruction_projecttype" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "is_active" bool NOT NULL,
  "name" varchar(100),
  "sort" integer NOT NULL,
  "created_date" datetime,
  "updated_date" datetime,
  UNIQUE ("name" ASC)
);

-- ----------------------------
-- Records of myConstruction_projecttype
-- ----------------------------
INSERT INTO "myConstruction_projecttype" VALUES (1, 1, 'بازسازی', 0, '2025-04-15 09:43:28.694267', '2025-04-15 09:43:28.694267');
INSERT INTO "myConstruction_projecttype" VALUES (2, 1, 'ساخت و ساز', 1, '2025-04-15 09:43:28.694267', '2025-04-15 09:43:28.694267');
INSERT INTO "myConstruction_projecttype" VALUES (3, 1, 'تعمیرات', 2, '2025-04-15 09:43:28.694267', '2025-04-15 09:43:28.694267');
INSERT INTO "myConstruction_projecttype" VALUES (4, 1, 'طراحی', 3, '2025-04-15 09:43:28.694267', '2025-04-15 09:43:28.694267');

-- ----------------------------
-- Table structure for myConstruction_review
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_review";
CREATE TABLE "myConstruction_review" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of myConstruction_review
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_service
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_service";
CREATE TABLE "myConstruction_service" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of myConstruction_service
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_servicedetail
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_servicedetail";
CREATE TABLE "myConstruction_servicedetail" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of myConstruction_servicedetail
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_setting
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_setting";
CREATE TABLE "myConstruction_setting" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of myConstruction_setting
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_statistic
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_statistic";
CREATE TABLE "myConstruction_statistic" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of myConstruction_statistic
-- ----------------------------

-- ----------------------------
-- Table structure for myConstruction_swiper
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_swiper";
CREATE TABLE "myConstruction_swiper" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" varchar(100),
  "image_path" varchar(100),
  "is_active" bool NOT NULL,
  "sort" integer NOT NULL,
  "interval" integer NOT NULL,
  "created_date" datetime,
  "updated_date" datetime,
  "content" text
);

-- ----------------------------
-- Records of myConstruction_swiper
-- ----------------------------
INSERT INTO "myConstruction_swiper" VALUES (1, 'title', 'swiper/remodeling-3.jpg', 1, 1, 5, '2025-04-15 12:49:11.849600', '2025-04-21 14:32:52.796614', 'dfegwgggeggeg');
INSERT INTO "myConstruction_swiper" VALUES (2, 'title2', 'swiper/remodeling-2.jpg', 1, 2, 7, '2025-04-15 12:49:20.223138', '2025-04-21 14:31:43.042623', 'afcsgvsrgvsgwgegegeg');
INSERT INTO "myConstruction_swiper" VALUES (3, 'title3', 'swiper/remodeling-1.jpg', 1, 3, 10, '2025-04-15 12:49:28.744908', '2025-04-21 14:31:36.357620', 'faevgbrsfbsfbsfb');

-- ----------------------------
-- Table structure for myConstruction_tag
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_tag";
CREATE TABLE "myConstruction_tag" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name_tag" varchar(200),
  "is_active" bool NOT NULL,
  "created_date" datetime,
  "updated_date" datetime,
  UNIQUE ("name_tag" ASC)
);

-- ----------------------------
-- Records of myConstruction_tag
-- ----------------------------
INSERT INTO "myConstruction_tag" VALUES (1, 'برج ازادی', 1, '2025-04-14 13:38:33.575350', '2025-04-15 11:35:50.253054');
INSERT INTO "myConstruction_tag" VALUES (2, 'طراحی مترو', 1, '2025-04-14 16:16:11.849674', '2025-04-14 16:16:11.849674');
INSERT INTO "myConstruction_tag" VALUES (3, 'برج میلاد', 1, '2025-04-15 11:36:26.663234', '2025-04-15 11:36:26.663234');
INSERT INTO "myConstruction_tag" VALUES (4, 'طراحی داخلی', 1, '2025-04-15 11:36:39.965162', '2025-04-15 11:36:39.965162');
INSERT INTO "myConstruction_tag" VALUES (5, 'آتی سازان', 1, '2025-04-15 11:36:48.479418', '2025-04-15 11:36:48.479418');
INSERT INTO "myConstruction_tag" VALUES (6, 'تعمیرات', 1, '2025-04-15 11:36:57.325213', '2025-04-15 11:36:57.325213');
INSERT INTO "myConstruction_tag" VALUES (7, 'معماری داخلی', 1, '2025-04-15 11:37:06.207828', '2025-04-15 11:37:06.207828');
INSERT INTO "myConstruction_tag" VALUES (8, 'نمایشگاه بین المللی', 1, '2025-04-15 11:37:17.668672', '2025-04-15 11:37:17.668672');
INSERT INTO "myConstruction_tag" VALUES (9, 'بازسازی', 1, '2025-04-15 11:37:24.677234', '2025-04-15 11:37:24.677234');
INSERT INTO "myConstruction_tag" VALUES (10, 'مجتمع تجاری نور', 1, '2025-04-15 11:37:39.003202', '2025-04-15 11:37:39.003202');

-- ----------------------------
-- Table structure for myConstruction_team
-- ----------------------------
DROP TABLE IF EXISTS "myConstruction_team";
CREATE TABLE "myConstruction_team" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of myConstruction_team
-- ----------------------------

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name",
  "seq"
);

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO "sqlite_sequence" VALUES ('django_migrations', 34);
INSERT INTO "sqlite_sequence" VALUES ('django_admin_log', 125);
INSERT INTO "sqlite_sequence" VALUES ('django_content_type', 26);
INSERT INTO "sqlite_sequence" VALUES ('auth_permission', 104);
INSERT INTO "sqlite_sequence" VALUES ('auth_group', 0);
INSERT INTO "sqlite_sequence" VALUES ('auth_user', 1);
INSERT INTO "sqlite_sequence" VALUES ('myConstruction_category', 3);
INSERT INTO "sqlite_sequence" VALUES ('myConstruction_tag', 10);
INSERT INTO "sqlite_sequence" VALUES ('myConstruction_customer', 2);
INSERT INTO "sqlite_sequence" VALUES ('myConstruction_project_tags', 13);
INSERT INTO "sqlite_sequence" VALUES ('user_point_learn', 20);
INSERT INTO "sqlite_sequence" VALUES ('user-learn', 4);
INSERT INTO "sqlite_sequence" VALUES ('myConstruction_carousel', 5);
INSERT INTO "sqlite_sequence" VALUES ('myConstruction_projecttype', 4);
INSERT INTO "sqlite_sequence" VALUES ('myConstruction_project', 13);
INSERT INTO "sqlite_sequence" VALUES ('myConstruction_projectdetail', 0);
INSERT INTO "sqlite_sequence" VALUES ('myConstruction_swiper', 3);
INSERT INTO "sqlite_sequence" VALUES ('myConstruction_news', 3);

-- ----------------------------
-- Table structure for user-learn
-- ----------------------------
DROP TABLE IF EXISTS "user-learn";
CREATE TABLE "user-learn" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" TEXT,
  "family" TEXT
);

-- ----------------------------
-- Records of user-learn
-- ----------------------------
INSERT INTO "user-learn" VALUES (1, 'Ali ', 'Karimi');
INSERT INTO "user-learn" VALUES (2, 'Reza', 'Kamali');
INSERT INTO "user-learn" VALUES (3, 'Sarah', 'Bahari');
INSERT INTO "user-learn" VALUES (4, 'Maryam', 'Tavasoli');

-- ----------------------------
-- Table structure for user_point_learn
-- ----------------------------
DROP TABLE IF EXISTS "user_point_learn";
CREATE TABLE "user_point_learn" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER,
  "point" TEXT,
  CONSTRAINT "Fk_1" FOREIGN KEY ("user_id") REFERENCES "user-learn" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of user_point_learn
-- ----------------------------
INSERT INTO "user_point_learn" VALUES (1, 1, '18');
INSERT INTO "user_point_learn" VALUES (2, 1, '16');
INSERT INTO "user_point_learn" VALUES (3, 1, '10');
INSERT INTO "user_point_learn" VALUES (4, 1, '20');
INSERT INTO "user_point_learn" VALUES (5, 1, '19');
INSERT INTO "user_point_learn" VALUES (6, 2, '15');
INSERT INTO "user_point_learn" VALUES (7, 2, '19');
INSERT INTO "user_point_learn" VALUES (8, 2, '14');
INSERT INTO "user_point_learn" VALUES (9, 2, '13');
INSERT INTO "user_point_learn" VALUES (10, 3, '16');
INSERT INTO "user_point_learn" VALUES (11, 3, '19');
INSERT INTO "user_point_learn" VALUES (12, 3, '20');
INSERT INTO "user_point_learn" VALUES (13, 3, '13');
INSERT INTO "user_point_learn" VALUES (14, 4, '14');
INSERT INTO "user_point_learn" VALUES (15, 4, '15');
INSERT INTO "user_point_learn" VALUES (16, 4, '16');
INSERT INTO "user_point_learn" VALUES (17, 4, '17');
INSERT INTO "user_point_learn" VALUES (18, 4, '18');
INSERT INTO "user_point_learn" VALUES (19, 4, '19');
INSERT INTO "user_point_learn" VALUES (20, 4, '20');

-- ----------------------------
-- Auto increment value for auth_group
-- ----------------------------

-- ----------------------------
-- Indexes structure for table auth_group_permissions
-- ----------------------------
CREATE INDEX "auth_group_permissions_group_id_b120cbf9"
ON "auth_group_permissions" (
  "group_id" ASC
);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq"
ON "auth_group_permissions" (
  "group_id" ASC,
  "permission_id" ASC
);
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e"
ON "auth_group_permissions" (
  "permission_id" ASC
);

-- ----------------------------
-- Auto increment value for auth_permission
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 104 WHERE name = 'auth_permission';

-- ----------------------------
-- Indexes structure for table auth_permission
-- ----------------------------
CREATE INDEX "auth_permission_content_type_id_2f476e4b"
ON "auth_permission" (
  "content_type_id" ASC
);
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq"
ON "auth_permission" (
  "content_type_id" ASC,
  "codename" ASC
);

-- ----------------------------
-- Auto increment value for auth_user
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 1 WHERE name = 'auth_user';

-- ----------------------------
-- Indexes structure for table auth_user_groups
-- ----------------------------
CREATE INDEX "auth_user_groups_group_id_97559544"
ON "auth_user_groups" (
  "group_id" ASC
);
CREATE INDEX "auth_user_groups_user_id_6a12ed8b"
ON "auth_user_groups" (
  "user_id" ASC
);
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq"
ON "auth_user_groups" (
  "user_id" ASC,
  "group_id" ASC
);

-- ----------------------------
-- Indexes structure for table auth_user_user_permissions
-- ----------------------------
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c"
ON "auth_user_user_permissions" (
  "permission_id" ASC
);
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b"
ON "auth_user_user_permissions" (
  "user_id" ASC
);
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq"
ON "auth_user_user_permissions" (
  "user_id" ASC,
  "permission_id" ASC
);

-- ----------------------------
-- Auto increment value for django_admin_log
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 125 WHERE name = 'django_admin_log';

-- ----------------------------
-- Indexes structure for table django_admin_log
-- ----------------------------
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb"
ON "django_admin_log" (
  "content_type_id" ASC
);
CREATE INDEX "django_admin_log_user_id_c564eba6"
ON "django_admin_log" (
  "user_id" ASC
);

-- ----------------------------
-- Auto increment value for django_content_type
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 26 WHERE name = 'django_content_type';

-- ----------------------------
-- Indexes structure for table django_content_type
-- ----------------------------
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq"
ON "django_content_type" (
  "app_label" ASC,
  "model" ASC
);

-- ----------------------------
-- Auto increment value for django_migrations
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 34 WHERE name = 'django_migrations';

-- ----------------------------
-- Indexes structure for table django_session
-- ----------------------------
CREATE INDEX "django_session_expire_date_a5c62663"
ON "django_session" (
  "expire_date" ASC
);

-- ----------------------------
-- Auto increment value for myConstruction_carousel
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 5 WHERE name = 'myConstruction_carousel';

-- ----------------------------
-- Auto increment value for myConstruction_category
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 3 WHERE name = 'myConstruction_category';

-- ----------------------------
-- Indexes structure for table myConstruction_comment
-- ----------------------------
CREATE INDEX "myConstruction_comment_admin_approved_id_065d7b87"
ON "myConstruction_comment" (
  "admin_approved_id" ASC
);
CREATE INDEX "myConstruction_comment_content_type_id_ab6c277a"
ON "myConstruction_comment" (
  "content_type_id" ASC
);
CREATE INDEX "myConstruction_comment_parent_id_59e50017"
ON "myConstruction_comment" (
  "parent_id" ASC
);
CREATE INDEX "myConstruction_comment_user_id_dd2e7c86"
ON "myConstruction_comment" (
  "user_id" ASC
);

-- ----------------------------
-- Auto increment value for myConstruction_customer
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 2 WHERE name = 'myConstruction_customer';

-- ----------------------------
-- Auto increment value for myConstruction_news
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 3 WHERE name = 'myConstruction_news';

-- ----------------------------
-- Indexes structure for table myConstruction_news
-- ----------------------------
CREATE INDEX "myConstruction_news_category_id_fbf1145a"
ON "myConstruction_news" (
  "category_id" ASC
);
CREATE INDEX "myConstruction_news_user_id_8e3a9d2a"
ON "myConstruction_news" (
  "user_id" ASC
);

-- ----------------------------
-- Indexes structure for table myConstruction_news_tags
-- ----------------------------
CREATE INDEX "myConstruction_news_tags_news_id_43ca39c5"
ON "myConstruction_news_tags" (
  "news_id" ASC
);
CREATE UNIQUE INDEX "myConstruction_news_tags_news_id_tag_id_3e8ba55e_uniq"
ON "myConstruction_news_tags" (
  "news_id" ASC,
  "tag_id" ASC
);
CREATE INDEX "myConstruction_news_tags_tag_id_fe3e0000"
ON "myConstruction_news_tags" (
  "tag_id" ASC
);

-- ----------------------------
-- Auto increment value for myConstruction_project
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 13 WHERE name = 'myConstruction_project';

-- ----------------------------
-- Indexes structure for table myConstruction_project
-- ----------------------------
CREATE INDEX "myConstruction_project_project_type_id_b42cd9f1"
ON "myConstruction_project" (
  "project_type_id" ASC
);
CREATE INDEX "myConstruction_project_user_id_c7c2e572"
ON "myConstruction_project" (
  "user_id" ASC
);

-- ----------------------------
-- Auto increment value for myConstruction_project_tags
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 13 WHERE name = 'myConstruction_project_tags';

-- ----------------------------
-- Indexes structure for table myConstruction_project_tags
-- ----------------------------
CREATE INDEX "myConstruction_project_tags_project_id_f16fa370"
ON "myConstruction_project_tags" (
  "project_id" ASC
);
CREATE UNIQUE INDEX "myConstruction_project_tags_project_id_tag_id_740d3c95_uniq"
ON "myConstruction_project_tags" (
  "project_id" ASC,
  "tag_id" ASC
);
CREATE INDEX "myConstruction_project_tags_tag_id_29c4a312"
ON "myConstruction_project_tags" (
  "tag_id" ASC
);

-- ----------------------------
-- Auto increment value for myConstruction_projectdetail
-- ----------------------------

-- ----------------------------
-- Indexes structure for table myConstruction_projectdetail
-- ----------------------------
CREATE INDEX "myConstruction_projectdetail_customer_id_ae551fa8"
ON "myConstruction_projectdetail" (
  "customer_id" ASC
);
CREATE INDEX "myConstruction_projectdetail_project_type_id_d2384646"
ON "myConstruction_projectdetail" (
  "project_type_id" ASC
);
CREATE INDEX "myConstruction_projectdetail_user_id_24a1a54e"
ON "myConstruction_projectdetail" (
  "user_id" ASC
);

-- ----------------------------
-- Indexes structure for table myConstruction_projectdetail_tags
-- ----------------------------
CREATE INDEX "myConstruction_projectdetail_tags_projectdetail_id_289d749f"
ON "myConstruction_projectdetail_tags" (
  "projectdetail_id" ASC
);
CREATE UNIQUE INDEX "myConstruction_projectdetail_tags_projectdetail_id_tag_id_46206493_uniq"
ON "myConstruction_projectdetail_tags" (
  "projectdetail_id" ASC,
  "tag_id" ASC
);
CREATE INDEX "myConstruction_projectdetail_tags_tag_id_df168515"
ON "myConstruction_projectdetail_tags" (
  "tag_id" ASC
);

-- ----------------------------
-- Auto increment value for myConstruction_projecttype
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 4 WHERE name = 'myConstruction_projecttype';

-- ----------------------------
-- Auto increment value for myConstruction_swiper
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 3 WHERE name = 'myConstruction_swiper';

-- ----------------------------
-- Auto increment value for myConstruction_tag
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 10 WHERE name = 'myConstruction_tag';

-- ----------------------------
-- Auto increment value for user-learn
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 4 WHERE name = 'user-learn';

-- ----------------------------
-- Auto increment value for user_point_learn
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 20 WHERE name = 'user_point_learn';

PRAGMA foreign_keys = true;
