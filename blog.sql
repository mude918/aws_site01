-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `blog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `blog`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add blog post',7,'add_blogpost'),(20,'Can change blog post',7,'change_blogpost'),(21,'Can delete blog post',7,'delete_blogpost'),(22,'Can add article',8,'add_article'),(23,'Can change article',8,'change_article'),(24,'Can delete article',8,'delete_article'),(25,'Can add tag',9,'add_tag'),(26,'Can change tag',9,'change_tag'),(27,'Can delete tag',9,'delete_tag'),(28,'Can add category',10,'add_category'),(29,'Can change category',10,'change_category'),(30,'Can delete category',10,'delete_category'),(31,'Can add article ue',11,'add_articleue'),(32,'Can change article ue',11,'change_articleue'),(33,'Can delete article ue',11,'delete_articleue'),(34,'Can add article ck',12,'add_articleck'),(35,'Can change article ck',12,'change_articleck'),(36,'Can delete article ck',12,'delete_articleck');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$0WUwcM0ksmgm$TL7GcqZJ8xU/0SXeodIt1+wVx2XO2tt0ELhv9RvC1go=','2017-10-09 13:44:30',1,'ubuntu','','','',1,1,'2017-08-30 06:29:37');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `body` longtext NOT NULL,
  `date` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_article_category_id_7e38f15e_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'第1篇文章','text area1111','2017-08-31 01:50:12',1),(2,'第2篇文章','test000000111','2017-08-31 05:49:58',2),(3,'第3篇文章','Article 3 text area.','2017-09-02 12:19:08',3),(4,'第4篇文章','Article 4 text area.','2017-09-02 12:19:57',4),(5,'第5篇文章','Article 5 text area.','2017-09-02 12:23:06',1),(6,'第6篇文章','Article 6 text area.','2017-09-02 12:23:43',3),(7,'第7篇文章','Article 7 text area.','2017-09-02 12:24:17',3),(8,'如果你忘记django的管理密码','You may try through console:\r\n\r\npython manage.py shell\r\nthen use following script in shell\r\n\r\nfrom django.contrib.auth.models import User\r\nUser.objects.filter(is_superuser=True)\r\nwill list you all super users on the system. if you recognize yur username from the list:\r\n\r\nusr = User.objects.get(username=\'your username\')\r\nusr.set_password(\'raw password\')\r\nusr.save()\r\nand you set a new password.','2017-09-07 08:41:13',5);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tags_article_id_tag_id_b78a22e9_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_82c02dd6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (1,1,1),(2,1,2),(4,1,3),(3,2,3),(6,3,1),(5,4,2),(7,5,2),(8,6,3),(9,7,2),(10,8,4);
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_articleck`
--

DROP TABLE IF EXISTS `blog_articleck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_articleck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `body` longtext,
  `date` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_articleck_category_id_1955c086_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_articleck_category_id_1955c086_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_articleck`
--

LOCK TABLES `blog_articleck` WRITE;
/*!40000 ALTER TABLE `blog_articleck` DISABLE KEYS */;
INSERT INTO `blog_articleck` VALUES (1,'安装 ckeditor','<p>1、安装</p>\r\n\r\n<pre>\r\n<span style=\"background-color:#ecf0f1\">pip install django-ckeditor</span> </pre>\r\n\r\n<p>2、将&lsquo;ckeditor&#39;settings.py中的INSTALLED_APPS</p>\r\n\r\n<p>3、由于djang-ckeditor在ckeditor-init.js文件中使用了JQuery，所以要在settings.py中设置CKEDITOR_JQUERY_URL来指定JQuery库的路径，例如:</p>\r\n\r\n<pre>\r\nCKEDITOR_JQUERY_URL =&#39;https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js&#39; </pre>\r\n\r\n<p>4、设定STATIC_ROOT，执行<code>python manage.py collectstatic</code>,将CKEditor需要的媒体资源拷入STATIC_ROOT指定的路径中。</p>\r\n\r\n<pre>\r\nSTATIC_ROOT = os.path.join(BASE_DIR,&#39;static/&#39;)</pre>','2017-09-10 01:52:51',5),(2,'Create repository on git from local exist project','<p>start at local:</p>\r\n\r\n<p>cd&nbsp; project dir;</p>\r\n\r\n<p>git init;</p>\r\n\r\n<p>sshkey-gen -t rsa -C&nbsp; &quot;912526205@qq.com&quot;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>then to remote:</p>\r\n\r\n<p>add local .ssh/id_rsa.pub to settings ssh keys&nbsp;</p>\r\n\r\n<p>create new repository;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>then to local:</p>\r\n\r\n<p>git add .</p>\r\n\r\n<p>git commit -m &quot;commit message&quot;</p>\r\n\r\n<p>git remote add origin git@github.com:mude918/aws_site01.git</p>\r\n\r\n<p>git pull origin master --allow-unrelated-histories</p>\r\n\r\n<p>git push -u origin master</p>','2017-10-10 06:41:02',6),(3,'Git忽略规则及.gitignore规则不生效的解决办法','<p>在git中如果想忽略掉某个文件，不让这个文件提交到版本库中，可以使用修改根目录中 .gitignore 文件的方法（如无，则需自己手工建立此文件）。这个文件每一行保存了一个匹配的规则例如：</p>\r\n\r\n<p><a href=\"http://www.pfeng.org/archives/840#\">?</a></p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>1</p>\r\n\r\n			<p>2</p>\r\n\r\n			<p>3</p>\r\n\r\n			<p>4</p>\r\n\r\n			<p>5</p>\r\n\r\n			<p>6</p>\r\n\r\n			<p>7</p>\r\n			</td>\r\n			<td>\r\n			<p><code># 此为注释 &ndash; 将被 Git 忽略</code></p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p><code>*.a&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </code><code># 忽略所有 .a 结尾的文件</code></p>\r\n\r\n			<p><code>!lib.a&nbsp;&nbsp;&nbsp; </code><code># 但 lib.a 除外</code></p>\r\n\r\n			<p><code>/TODO</code>&nbsp;&nbsp;&nbsp;&nbsp; <code># 仅仅忽略项目根目录下的 TODO 文件，不包括 subdir/TODO</code></p>\r\n\r\n			<p><code>build/&nbsp;&nbsp;&nbsp; </code><code># 忽略 build/ 目录下的所有文件</code></p>\r\n\r\n			<p><code>doc/*.txt </code><code># 会忽略 doc/notes.txt 但不包括 doc/server/arch.txt</code></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>规则很简单，不做过多解释，但是有时候在项目开发过程中，突然心血来潮想把某些目录或文件加入忽略规则，按照上述方法定义后发现并未生效，原因是.gitignore只能忽略那些原来没有被track的文件，如果某些文件已经被纳入了版本管理中，则修改.gitignore是无效的。那么解决方法就是先把本地缓存删除（改变成未track状态），然后再提交：</p>\r\n\r\n<p><a href=\"http://www.pfeng.org/archives/840#\">?</a></p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>1</p>\r\n\r\n			<p>2</p>\r\n\r\n			<p>3</p>\r\n			</td>\r\n			<td>\r\n			<p><code>git&nbsp;</code><code>rm</code>&nbsp;<code>-r&nbsp;--cached&nbsp;.</code></p>\r\n\r\n			<p><code>git&nbsp;add&nbsp;.</code></p>\r\n\r\n			<p><code>git&nbsp;commit -m&nbsp;</code><code>&#39;update&nbsp;.gitignore&#39;</code></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>','2017-10-10 11:59:15',6);
/*!40000 ALTER TABLE `blog_articleck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_articleck_tags`
--

DROP TABLE IF EXISTS `blog_articleck_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_articleck_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleck_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_articleck_tags_articleck_id_tag_id_f974de8a_uniq` (`articleck_id`,`tag_id`),
  KEY `blog_articleck_tags_tag_id_3fde7f88_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_articleck_tags_tag_id_3fde7f88_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_articleck_tags_articleck_id_3f540696_fk_blog_articleck_id` FOREIGN KEY (`articleck_id`) REFERENCES `blog_articleck` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_articleck_tags`
--

LOCK TABLES `blog_articleck_tags` WRITE;
/*!40000 ALTER TABLE `blog_articleck_tags` DISABLE KEYS */;
INSERT INTO `blog_articleck_tags` VALUES (1,1,4);
/*!40000 ALTER TABLE `blog_articleck_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_articleue`
--

DROP TABLE IF EXISTS `blog_articleue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_articleue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `body` longtext NOT NULL,
  `date` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_articleue_category_id_45aaea1f_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_articleue_category_id_45aaea1f_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_articleue`
--

LOCK TABLES `blog_articleue` WRITE;
/*!40000 ALTER TABLE `blog_articleue` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_articleue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_articleue_tags`
--

DROP TABLE IF EXISTS `blog_articleue_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_articleue_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleue_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_articleue_tags_articleue_id_tag_id_1d382460_uniq` (`articleue_id`,`tag_id`),
  KEY `blog_articleue_tags_tag_id_6d109a90_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_articleue_tags_tag_id_6d109a90_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_articleue_tags_articleue_id_6dffceca_fk_blog_articleue_id` FOREIGN KEY (`articleue_id`) REFERENCES `blog_articleue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_articleue_tags`
--

LOCK TABLES `blog_articleue_tags` WRITE;
/*!40000 ALTER TABLE `blog_articleue_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_articleue_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogpost`
--

DROP TABLE IF EXISTS `blog_blogpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `body` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogpost`
--

LOCK TABLES `blog_blogpost` WRITE;
/*!40000 ALTER TABLE `blog_blogpost` DISABLE KEYS */;
INSERT INTO `blog_blogpost` VALUES (1,'Second article','Test 2222','2017-08-30 15:21:00'),(2,'First article','Test 111','2017-08-30 15:00:17');
/*!40000 ALTER TABLE `blog_blogpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'AIX'),(2,'Shell'),(3,'Python'),(4,'Linux'),(5,'django'),(6,'Git');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'AIX'),(2,'Python'),(3,'Linux'),(4,'django');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-08-30 07:22:13','1','BlogPost object',1,'[{\"added\": {}}]',7,1),(2,'2017-08-30 08:04:40','1','BlogPost object',2,'[]',7,1),(3,'2017-08-30 08:05:04','1','BlogPost object',2,'[]',7,1),(4,'2017-08-30 08:05:18','2','BlogPost object',1,'[{\"added\": {}}]',7,1),(5,'2017-08-30 13:50:39','2','BlogPost object',2,'[{\"changed\": {\"fields\": [\"title\", \"body\"]}}]',7,1),(6,'2017-08-30 13:51:18','1','BlogPost object',2,'[{\"changed\": {\"fields\": [\"title\", \"body\"]}}]',7,1),(7,'2017-08-30 13:52:01','1','BlogPost object',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',7,1),(8,'2017-08-30 15:00:20','2','BlogPost object',2,'[{\"changed\": {\"fields\": [\"title\", \"body\", \"timestamp\"]}}]',7,1),(9,'2017-08-30 15:00:48','1','BlogPost object',2,'[{\"changed\": {\"fields\": [\"title\", \"body\"]}}]',7,1),(10,'2017-08-30 15:01:07','2','BlogPost object',2,'[{\"changed\": {\"fields\": [\"timestamp\"]}}]',7,1),(11,'2017-08-30 15:01:47','2','BlogPost object',2,'[{\"changed\": {\"fields\": [\"title\", \"body\"]}}]',7,1),(12,'2017-08-30 15:01:55','1','BlogPost object',2,'[{\"changed\": {\"fields\": [\"title\", \"body\"]}}]',7,1),(13,'2017-08-31 01:51:06','1','类别1',1,'[{\"added\": {}}]',10,1),(14,'2017-08-31 01:51:20','1','标签1',1,'[{\"added\": {}}]',9,1),(15,'2017-08-31 01:51:35','2','标签2',1,'[{\"added\": {}}]',9,1),(16,'2017-08-31 01:51:37','1','Article01',1,'[{\"added\": {}}]',8,1),(17,'2017-08-31 05:50:53','2','类别2',1,'[{\"added\": {}}]',10,1),(18,'2017-08-31 05:51:02','3','标签3',1,'[{\"added\": {}}]',9,1),(19,'2017-08-31 05:51:55','2','第二篇文章',1,'[{\"added\": {}}]',8,1),(20,'2017-08-31 05:52:08','2','第二篇文章',2,'[]',8,1),(21,'2017-08-31 05:52:22','1','Article01',2,'[]',8,1),(22,'2017-08-31 05:52:29','2','第二篇文章',2,'[]',8,1),(23,'2017-09-02 12:19:31','1','第一篇文章',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(24,'2017-09-02 12:19:49','3','类别3',1,'[{\"added\": {}}]',10,1),(25,'2017-09-02 12:20:15','3','第三篇文章',1,'[{\"added\": {}}]',8,1),(26,'2017-09-02 12:20:51','4','类别4',1,'[{\"added\": {}}]',10,1),(27,'2017-09-02 12:20:55','4','第四篇文章',1,'[{\"added\": {}}]',8,1),(28,'2017-09-02 12:21:03','3','第三篇文章',2,'[]',8,1),(29,'2017-09-02 12:21:30','1','第1篇文章',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(30,'2017-09-02 12:21:36','2','第2篇文章',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(31,'2017-09-02 12:21:41','3','第3篇文章',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(32,'2017-09-02 12:21:46','4','第4篇文章',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(33,'2017-09-02 12:23:56','5','第5篇文章',1,'[{\"added\": {}}]',8,1),(34,'2017-09-02 12:24:32','6','第6篇文章',1,'[{\"added\": {}}]',8,1),(35,'2017-09-02 12:25:07','7','第7篇文章',1,'[{\"added\": {}}]',8,1),(36,'2017-09-07 08:42:10','5','django',1,'[{\"added\": {}}]',10,1),(37,'2017-09-07 08:42:25','4','django',1,'[{\"added\": {}}]',9,1),(38,'2017-09-07 08:42:27','8','如果你忘记django的管理密码',1,'[{\"added\": {}}]',8,1),(39,'2017-09-07 08:43:32','8','如果你忘记django的管理密码',2,'[]',8,1),(40,'2017-09-10 01:53:39','1','安装 ckeditor',1,'[{\"added\": {}}]',12,1),(41,'2017-09-10 01:54:25','1','安装 ckeditor',2,'[]',12,1),(42,'2017-09-10 02:00:16','1','安装 ckeditor',2,'[]',12,1),(43,'2017-09-10 11:58:57','1','安装 ckeditor',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',12,1),(44,'2017-10-09 13:44:54','4','Linux',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(45,'2017-10-09 13:45:09','3','Python',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(46,'2017-10-09 13:45:20','2','Shell',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(47,'2017-10-09 13:45:25','1','AIX',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(48,'2017-10-09 13:45:59','3','Linux',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(49,'2017-10-09 13:46:05','2','Python',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(50,'2017-10-09 13:46:16','1','AIX',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(51,'2017-10-10 06:39:54','6','Git',1,'[{\"added\": {}}]',10,1),(52,'2017-10-10 06:40:02','2','Create repository on git from local exist project',1,'[{\"added\": {}}]',12,1),(53,'2017-10-10 11:58:03','3','Git忽略规则及.gitignore规则不生效的解决办法',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(8,'blog','article'),(12,'blog','articleck'),(11,'blog','articleue'),(7,'blog','blogpost'),(10,'blog','category'),(9,'blog','tag'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-08-29 15:02:55'),(2,'auth','0001_initial','2017-08-29 15:02:55'),(3,'admin','0001_initial','2017-08-29 15:02:55'),(4,'admin','0002_logentry_remove_auto_add','2017-08-29 15:02:55'),(5,'contenttypes','0002_remove_content_type_name','2017-08-29 15:02:55'),(6,'auth','0002_alter_permission_name_max_length','2017-08-29 15:02:55'),(7,'auth','0003_alter_user_email_max_length','2017-08-29 15:02:55'),(8,'auth','0004_alter_user_username_opts','2017-08-29 15:02:55'),(9,'auth','0005_alter_user_last_login_null','2017-08-29 15:02:55'),(10,'auth','0006_require_contenttypes_0002','2017-08-29 15:02:55'),(11,'auth','0007_alter_validators_add_error_messages','2017-08-29 15:02:55'),(12,'auth','0008_alter_user_username_max_length','2017-08-29 15:02:55'),(13,'sessions','0001_initial','2017-08-29 15:02:55'),(14,'blog','0001_initial','2017-08-30 07:17:58'),(15,'blog','0002_auto_20170830_1442','2017-08-30 14:43:00'),(16,'blog','0003_articleue','2017-09-09 14:15:07'),(17,'blog','0004_articleck','2017-09-10 01:50:25');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('56nmw4lswj4p2vkhwuimrwttx9mcwivc','MzdlMTlmNGJiYmJlODczZWFlNzk3OGNlNWYxNGY4N2MzNTFhMDA0OTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2YjMxNTEzMzIyZDA0MTkxNDI0M2RmOTlkZTkxZDI0NDY3YTllYjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-13 07:19:17'),('cwwrot4o5cuj532k5hgcz72trtp75lqd','YmQ3NWY5MGQ5ZjgzZDExMzc0NGFkMzdjMmJkYzljNGFjNzhhYWE0MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVkZDVkNmZhNDk0ZDkzY2YzYzVhMzg4ODZiNGViNWE0NjZmZGJjYjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-23 13:44:30'),('tfgpa493we1twdr7xunimyzy82mw02re','MzdlMTlmNGJiYmJlODczZWFlNzk3OGNlNWYxNGY4N2MzNTFhMDA0OTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2YjMxNTEzMzIyZDA0MTkxNDI0M2RmOTlkZTkxZDI0NDY3YTllYjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-13 06:29:47'),('x82nny2rkmzrlff4sa9rdr2hiih4bj7l','YmQ3NWY5MGQ5ZjgzZDExMzc0NGFkMzdjMmJkYzljNGFjNzhhYWE0MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVkZDVkNmZhNDk0ZDkzY2YzYzVhMzg4ODZiNGViNWE0NjZmZGJjYjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-21 08:39:31');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-14  9:46:26
