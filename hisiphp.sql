/*
Navicat MySQL Data Transfer

Source Server         : locaohost
Source Server Version : 50719
Source Host           : 127.0.0.1:3306
Source Database       : hisiphp

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-14 23:28:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hisi_admin_annex
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_annex`;
CREATE TABLE `hisi_admin_annex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的数据ID',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '类型',
  `group` varchar(100) NOT NULL DEFAULT 'sys' COMMENT '文件分组',
  `file` varchar(255) NOT NULL COMMENT '上传文件',
  `hash` varchar(64) NOT NULL COMMENT '文件hash值',
  `size` decimal(12,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '附件大小KB',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '使用状态(0未使用，1已使用)',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[系统] 上传附件';

-- ----------------------------
-- Records of hisi_admin_annex
-- ----------------------------

-- ----------------------------
-- Table structure for hisi_admin_annex_group
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_annex_group`;
CREATE TABLE `hisi_admin_annex_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '附件分组',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `size` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '附件大小kb',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='[系统] 附件分组';

-- ----------------------------
-- Records of hisi_admin_annex_group
-- ----------------------------
INSERT INTO `hisi_admin_annex_group` VALUES ('1', 'sys', '0', '0.00');

-- ----------------------------
-- Table structure for hisi_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_config`;
CREATE TABLE `hisi_admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统配置(1是，0否)',
  `group` varchar(20) NOT NULL DEFAULT 'base' COMMENT '分组',
  `title` varchar(20) NOT NULL COMMENT '配置标题',
  `name` varchar(50) NOT NULL COMMENT '配置名称，由英文字母和下划线组成',
  `value` text NOT NULL COMMENT '配置值',
  `type` varchar(20) NOT NULL DEFAULT 'input' COMMENT '配置类型()',
  `options` text NOT NULL COMMENT '配置项(选项名:选项值)',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件上传接口',
  `tips` varchar(255) NOT NULL COMMENT '配置提示',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='[系统] 系统配置';

-- ----------------------------
-- Records of hisi_admin_config
-- ----------------------------
INSERT INTO `hisi_admin_config` VALUES ('1', '1', 'sys', '扩展配置分组', 'config_group', '', 'array', ' ', '', '请按如下格式填写：&lt;br&gt;键值:键名&lt;br&gt;键值:键名&lt;br&gt;&lt;span style=&quot;color:#f00&quot;&gt;键值只能为英文、数字、下划线&lt;/span&gt;', '1', '1', '1492140215', '1492140215');
INSERT INTO `hisi_admin_config` VALUES ('13', '1', 'base', '网站域名', 'site_domain', '', 'input', '', '', '', '2', '1', '1492140215', '1492140215');
INSERT INTO `hisi_admin_config` VALUES ('14', '1', 'upload', '图片上传大小限制', 'upload_image_size', '0', 'input', '', '', '单位：KB，0表示不限制大小', '3', '1', '1490841797', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('15', '1', 'upload', '允许上传图片格式', 'upload_image_ext', 'jpg,png,gif,jpeg,ico', 'input', '', '', '多个格式请用英文逗号（,）隔开', '4', '1', '1490842130', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('16', '1', 'upload', '缩略图裁剪方式', 'thumb_type', '2', 'select', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放\r\n', '', '', '5', '1', '1490842450', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('17', '1', 'upload', '图片水印开关', 'image_watermark', '1', 'switch', '0:关闭\r\n1:开启', '', '', '6', '1', '1490842583', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('18', '1', 'upload', '图片水印图', 'image_watermark_pic', '/upload/sys/image/49/4d0430eaf30318ef847086d0b63db0.png', 'image', '', '', '', '7', '1', '1490842679', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('19', '1', 'upload', '图片水印透明度', 'image_watermark_opacity', '50', 'input', '', '', '可设置值为0~100，数字越小，透明度越高', '8', '1', '1490857704', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('20', '1', 'upload', '图片水印图位置', 'image_watermark_location', '9', 'select', '7:左下角\r\n1:左上角\r\n4:左居中\r\n9:右下角\r\n3:右上角\r\n6:右居中\r\n2:上居中\r\n8:下居中\r\n5:居中', '', '', '9', '1', '1490858228', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('21', '1', 'upload', '文件上传大小限制', 'upload_file_size', '0', 'input', '', '', '单位：KB，0表示不限制大小', '1', '1', '1490859167', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('22', '1', 'upload', '允许上传文件格式', 'upload_file_ext', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip', 'input', '', '', '多个格式请用英文逗号（,）隔开', '2', '1', '1490859246', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('23', '1', 'upload', '文字水印开关', 'text_watermark', '0', 'switch', '0:关闭\r\n1:开启', '', '', '10', '1', '1490860872', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('24', '1', 'upload', '文字水印内容', 'text_watermark_content', '', 'input', '', '', '', '11', '1', '1490861005', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('25', '1', 'upload', '文字水印字体', 'text_watermark_font', '', 'file', '', '', '不上传将使用系统默认字体', '12', '1', '1490861117', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('26', '1', 'upload', '文字水印字体大小', 'text_watermark_size', '20', 'input', '', '', '单位：px(像素)', '13', '1', '1490861204', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('27', '1', 'upload', '文字水印颜色', 'text_watermark_color', '#000000', 'input', '', '', '文字水印颜色，格式:#000000', '14', '1', '1490861482', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('28', '1', 'upload', '文字水印位置', 'text_watermark_location', '7', 'select', '7:左下角\r\n1:左上角\r\n4:左居中\r\n9:右下角\r\n3:右上角\r\n6:右居中\r\n2:上居中\r\n8:下居中\r\n5:居中', '', '', '11', '1', '1490861718', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('29', '1', 'upload', '缩略图尺寸', 'thumb_size', '300x300;500x500', 'input', '', '', '为空则不生成，生成 500x500 的缩略图，则填写 500x500，多个规格填写参考 300x300;500x500;800x800', '4', '1', '1490947834', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('30', '1', 'develop', '开发模式', 'app_debug', '1', 'switch', '0:关闭\r\n1:开启', '', '', '0', '1', '1491005004', '1492093874');
INSERT INTO `hisi_admin_config` VALUES ('31', '1', 'develop', '页面Trace', 'app_trace', '0', 'switch', '0:关闭\r\n1:开启', '', '', '0', '1', '1491005081', '1492093874');
INSERT INTO `hisi_admin_config` VALUES ('33', '1', 'sys', '富文本编辑器', 'editor', 'umeditor', 'select', 'ueditor:UEditor\r\numeditor:UMEditor\r\nkindeditor:KindEditor\r\nckeditor:CKEditor', '', '', '2', '1', '1491142648', '1492140215');
INSERT INTO `hisi_admin_config` VALUES ('35', '1', 'databases', '备份目录', 'backup_path', './backup/database/', 'input', '', '', '数据库备份路径,路径必须以 / 结尾', '0', '1', '1491881854', '1491965974');
INSERT INTO `hisi_admin_config` VALUES ('36', '1', 'databases', '备份分卷大小', 'part_size', '20971520', 'input', '', '', '用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '0', '1', '1491881975', '1491965974');
INSERT INTO `hisi_admin_config` VALUES ('37', '1', 'databases', '备份压缩开关', 'compress', '1', 'switch', '0:关闭\r\n1:开启', '', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '0', '1', '1491882038', '1491965974');
INSERT INTO `hisi_admin_config` VALUES ('38', '1', 'databases', '备份压缩级别', 'compress_level', '4', 'radio', '1:最低\r\n4:一般\r\n9:最高', '', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '0', '1', '1491882154', '1491965974');
INSERT INTO `hisi_admin_config` VALUES ('39', '1', 'base', '网站状态', 'site_status', '1', 'switch', '0:关闭\r\n1:开启', '', '站点关闭后将不能访问，后台可正常登录', '1', '1', '1492049460', '1494690024');
INSERT INTO `hisi_admin_config` VALUES ('40', '1', 'sys', '后台管理路径', 'admin_path', 'admin.php', 'input', '', '', '必须以.php为后缀', '0', '1', '1492139196', '1492140215');
INSERT INTO `hisi_admin_config` VALUES ('41', '1', 'base', '网站标题', 'site_title', 'HisiPHP应用市场', 'input', '', '', '网站标题是体现一个网站的主旨，要做到主题突出、标题简洁、连贯等特点，建议不超过28个字', '6', '1', '1492502354', '1494695131');
INSERT INTO `hisi_admin_config` VALUES ('42', '1', 'base', '网站关键词', 'site_keywords', 'hisiphp,hisiphp框架,php开源框架', 'input', '', '', '网页内容所包含的核心搜索关键词，多个关键字请用英文逗号&quot;,&quot;分隔', '7', '1', '1494690508', '1494690780');
INSERT INTO `hisi_admin_config` VALUES ('43', '1', 'base', '网站描述', 'site_description', '', 'textarea', '', '', '网页的描述信息，搜索引擎采纳后，作为搜索结果中的页面摘要显示，建议不超过80个字', '8', '1', '1494690669', '1494691075');
INSERT INTO `hisi_admin_config` VALUES ('44', '1', 'base', 'ICP备案信息', 'site_icp', '', 'input', '', '', '请填写ICP备案号，用于展示在网站底部，ICP备案官网：&lt;a href=&quot;http://www.miibeian.gov.cn&quot; target=&quot;_blank&quot;&gt;http://www.miibeian.gov.cn&lt;/a&gt;', '9', '1', '1494691721', '1494692046');
INSERT INTO `hisi_admin_config` VALUES ('45', '1', 'base', '站点统计代码', 'site_statis', '', 'textarea', '', '', '第三方流量统计代码，前台调用时请先用 htmlspecialchars_decode函数转义输出', '10', '1', '1494691959', '1494694797');
INSERT INTO `hisi_admin_config` VALUES ('46', '1', 'base', '网站名称', 'site_name', 'HisiPHP', 'input', '', '', '将显示在浏览器窗口标题等位置', '3', '1', '1494692103', '1494694680');
INSERT INTO `hisi_admin_config` VALUES ('47', '1', 'base', '网站LOGO', 'site_logo', '/hisiphp-master/upload/sys/image/24/44b6745bd5aa695b71e009416c4a4d.jpg', 'image', '', '', '网站LOGO图片', '4', '1', '1494692345', '1494693235');
INSERT INTO `hisi_admin_config` VALUES ('48', '1', 'base', '网站图标', 'site_favicon', '', 'image', '', '/admin/annex/favicon', '又叫网站收藏夹图标，它显示位于浏览器的地址栏或者标题前面，&lt;strong class=&quot;red&quot;&gt;.ico格式&lt;/strong&gt;，&lt;a href=&quot;https://www.baidu.com/s?ie=UTF-8&amp;wd=favicon&quot; target=&quot;_blank&quot;&gt;点此了解网站图标&lt;/a&gt;', '5', '1', '1494692781', '1494693966');
INSERT INTO `hisi_admin_config` VALUES ('49', '1', 'base', '手机网站', 'wap_site_status', '0', 'switch', '0:关闭\r\n1:开启', '', '如果有手机网站，请设置为开启状态，否则只显示PC网站', '2', '1', '1498405436', '1498405436');
INSERT INTO `hisi_admin_config` VALUES ('50', '1', 'sys', '云端推送', 'cloud_push', '0', 'switch', '0:关闭\r\n1:开启', '', '关闭之后，无法通过云端推送安装扩展', '3', '1', '1504250320', '1504250320');
INSERT INTO `hisi_admin_config` VALUES ('51', '0', 'base', '手机网站域名', 'wap_domain', '', 'input', '', '', '手机访问将自动跳转至此域名', '2', '1', '1504304776', '1504304837');
INSERT INTO `hisi_admin_config` VALUES ('52', '0', 'sys', '多语言支持', 'multi_language', '0', 'switch', '0:关闭\r\n1:开启', '', '开启后你可以自由上传多种语言包', '4', '1', '1506532211', '1506532211');

-- ----------------------------
-- Table structure for hisi_admin_hook
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_hook`;
CREATE TABLE `hisi_admin_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统插件',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子来源[plugins.插件名，module.模块名]',
  `intro` varchar(200) NOT NULL DEFAULT '' COMMENT '钩子简介',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 钩子表';

-- ----------------------------
-- Records of hisi_admin_hook
-- ----------------------------
INSERT INTO `hisi_admin_hook` VALUES ('1', '1', 'system_admin_index', '', '后台首页', '1', '1490885108', '1490885108');
INSERT INTO `hisi_admin_hook` VALUES ('2', '1', 'system_admin_tips', '', '后台所有页面提示', '1', '1490713165', '1490885137');
INSERT INTO `hisi_admin_hook` VALUES ('3', '1', 'system_annex_upload', '', '附件上传钩子，可扩展上传到第三方存储', '1', '1490884242', '1490885121');
INSERT INTO `hisi_admin_hook` VALUES ('4', '1', 'system_member_login', '', '会员登陆成功之后的动作', '1', '1490885108', '1490885108');

-- ----------------------------
-- Table structure for hisi_admin_hook_plugins
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_hook_plugins`;
CREATE TABLE `hisi_admin_hook_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) NOT NULL COMMENT '钩子id',
  `plugins` varchar(32) NOT NULL COMMENT '插件标识',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 钩子-插件对应表';

-- ----------------------------
-- Records of hisi_admin_hook_plugins
-- ----------------------------
INSERT INTO `hisi_admin_hook_plugins` VALUES ('1', 'system_admin_index', 'hisiphp', '1510063011', '1510063011', '0', '1');

-- ----------------------------
-- Table structure for hisi_admin_language
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_language`;
CREATE TABLE `hisi_admin_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '语言包名称',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '编码',
  `locale` varchar(255) NOT NULL DEFAULT '' COMMENT '本地浏览器语言编码',
  `icon` varchar(30) NOT NULL DEFAULT '' COMMENT '图标',
  `pack` varchar(100) NOT NULL DEFAULT '' COMMENT '上传的语言包',
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='[系统] 语言包';

-- ----------------------------
-- Records of hisi_admin_language
-- ----------------------------
INSERT INTO `hisi_admin_language` VALUES ('1', '简体中文', 'zh-cn', 'zh-CN,zh-CN.UTF-8,zh-cn', '', '1', '1', '1');

-- ----------------------------
-- Table structure for hisi_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_log`;
CREATE TABLE `hisi_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `url` varchar(200) DEFAULT '',
  `param` text,
  `remark` varchar(255) DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '1',
  `ip` varchar(128) DEFAULT '',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COMMENT='[系统] 操作日志';

-- ----------------------------
-- Records of hisi_admin_log
-- ----------------------------
INSERT INTO `hisi_admin_log` VALUES ('1', '1', '后台首页', 'admin/index/index', '[]', '浏览数据', '137', '127.0.0.1', '1513670580', '1515827411');
INSERT INTO `hisi_admin_log` VALUES ('2', '1', '[示例]列表模板', 'admin/develop/lists', '[]', '浏览数据', '15', '127.0.0.1', '1513670705', '1513823199');
INSERT INTO `hisi_admin_log` VALUES ('3', '1', '[示例]编辑模板', 'admin/develop/edit', '[]', '浏览数据', '13', '127.0.0.1', '1513670707', '1513825698');
INSERT INTO `hisi_admin_log` VALUES ('4', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513670707816\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513670707', '1513670707');
INSERT INTO `hisi_admin_log` VALUES ('5', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513670707817\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513670707', '1513670707');
INSERT INTO `hisi_admin_log` VALUES ('6', '1', '模块管理', 'admin/module/index', '[]', '浏览数据', '6', '127.0.0.1', '1513670712', '1513742245');
INSERT INTO `hisi_admin_log` VALUES ('7', '1', '插件管理', 'admin/plugins/index', '[]', '浏览数据', '9', '127.0.0.1', '1513670715', '1513742253');
INSERT INTO `hisi_admin_log` VALUES ('8', '1', '钩子管理', 'admin/hook/index', '[]', '浏览数据', '5', '127.0.0.1', '1513670716', '1513742250');
INSERT INTO `hisi_admin_log` VALUES ('9', '1', '在线升级', 'admin/upgrade/index', '[]', '浏览数据', '4', '127.0.0.1', '1513670717', '1513742251');
INSERT INTO `hisi_admin_log` VALUES ('10', '1', '会员等级', 'admin/member/level', '[]', '浏览数据', '7', '127.0.0.1', '1513670718', '1515422493');
INSERT INTO `hisi_admin_log` VALUES ('11', '1', '会员列表', 'admin/member/index', '[]', '浏览数据', '11', '127.0.0.1', '1513670719', '1515422645');
INSERT INTO `hisi_admin_log` VALUES ('12', '1', '添加快捷菜单', 'admin/menu/quick', '{\"id\":\"24\"}', '浏览数据', '2', '127.0.0.1', '1513670733', '1513670740');
INSERT INTO `hisi_admin_log` VALUES ('13', '1', '数据库管理', 'admin/database/index', '[]', '浏览数据', '3', '127.0.0.1', '1513670794', '1513742233');
INSERT INTO `hisi_admin_log` VALUES ('14', '1', '系统日志', 'admin/log/index', '[]', '浏览数据', '7', '127.0.0.1', '1513670804', '1513825801');
INSERT INTO `hisi_admin_log` VALUES ('15', '1', '系统管理员', 'admin/user/index', '[]', '浏览数据', '199', '127.0.0.1', '1513670812', '1515827416');
INSERT INTO `hisi_admin_log` VALUES ('16', '1', '系统菜单', 'admin/menu/index', '[]', '浏览数据', '63', '127.0.0.1', '1513670812', '1515813108');
INSERT INTO `hisi_admin_log` VALUES ('17', '1', '添加菜单', 'admin/menu/add', '{\"pid\":\"1\",\"mod\":\"admin\"}', '浏览数据', '7', '127.0.0.1', '1513670825', '1514870010');
INSERT INTO `hisi_admin_log` VALUES ('18', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"1\",\"title\":\"\\u6570\\u636e\\u4e2d\\u5fc3\",\"icon\":\"aicon ai-shujukuguanli\",\"url\":\"admin\\/index\\/data\",\"param\":\"\",\"status\":\"1\",\"system\":\"1\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513670896', '1513670896');
INSERT INTO `hisi_admin_log` VALUES ('19', '1', '个人信息设置', 'admin/user/info', '[]', '浏览数据', '4', '127.0.0.1', '1513670930', '1513673778');
INSERT INTO `hisi_admin_log` VALUES ('20', '1', '添加会员', 'admin/member/add', '[]', '浏览数据', '7', '127.0.0.1', '1513670951', '1515423013');
INSERT INTO `hisi_admin_log` VALUES ('21', '1', '添加会员', 'admin/member/add', '{\"level_id\":\"1\",\"username\":\"laowu\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"123456\",\"email\":\"1113249273@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"2017-12-31\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513670999', '1513670999');
INSERT INTO `hisi_admin_log` VALUES ('22', '1', '个人信息设置', 'admin/user/info', '{\"username\":\"admin\",\"nick\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"password\":\"123456\",\"email\":\"1113249273@qq.com\",\"mobile\":\"18712377078\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513671114', '1513671114');
INSERT INTO `hisi_admin_log` VALUES ('23', '1', '配置管理', 'admin/config/index', '[]', '浏览数据', '13', '127.0.0.1', '1513672304', '1515479606');
INSERT INTO `hisi_admin_log` VALUES ('24', '1', '系统设置', 'admin/system/index', '[]', '浏览数据', '13', '127.0.0.1', '1513672305', '1514799862');
INSERT INTO `hisi_admin_log` VALUES ('25', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"1\",\"title\":\"\\u4e2d\\u6587\\u6570\\u636e\\u5e93\",\"icon\":\"typcn typcn-infinity-outline\",\"url\":\"admin\\/index\\/ch_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513672413', '1513672413');
INSERT INTO `hisi_admin_log` VALUES ('26', '1', '删除菜单', 'admin/menu/del', '{\"ids\":\"203\"}', '浏览数据', '1', '127.0.0.1', '1513672433', '1513672433');
INSERT INTO `hisi_admin_log` VALUES ('27', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"84\",\"title\":\"\\u4e2d\\u6587\\u6570\\u636e\\u5e93\",\"icon\":\"aicon ai-systemmenu\",\"url\":\"admin\\/index\\/ch_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513672487', '1513672487');
INSERT INTO `hisi_admin_log` VALUES ('28', '1', '删除菜单', 'admin/menu/del', '{\"ids\":\"204\"}', '浏览数据', '1', '127.0.0.1', '1513672517', '1513672517');
INSERT INTO `hisi_admin_log` VALUES ('29', '1', '添加菜单', 'admin/menu/add', '{\"pid\":\"202\",\"mod\":\"admin\"}', '浏览数据', '11', '127.0.0.1', '1513672535', '1513691245');
INSERT INTO `hisi_admin_log` VALUES ('30', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"202\",\"title\":\"\\u4e2d\\u6587\\u6570\\u636e\\u5e93\",\"icon\":\"aicon ai-mokuaiguanli1\",\"url\":\"admin\\/index\\/ch_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513672563', '1513672563');
INSERT INTO `hisi_admin_log` VALUES ('31', '1', '中文数据库', 'admin/index/ch_data', '[]', '浏览数据', '1', '127.0.0.1', '1513672571', '1513672571');
INSERT INTO `hisi_admin_log` VALUES ('32', '1', '修改菜单', 'admin/menu/edit', '{\"id\":\"205\"}', '浏览数据', '1', '127.0.0.1', '1513672889', '1513672889');
INSERT INTO `hisi_admin_log` VALUES ('33', '1', '修改菜单', 'admin/menu/edit', '{\"module\":\"admin\",\"pid\":\"202\",\"title\":\"\\u4e2d\\u6587\\u6570\\u636e\\u5e93\",\"icon\":\"aicon ai-mokuaiguanli1\",\"url\":\"admin\\/data\\/ch_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"205\"}', '保存数据', '1', '127.0.0.1', '1513672991', '1513672991');
INSERT INTO `hisi_admin_log` VALUES ('34', '1', '修改菜单', 'admin/menu/edit', '{\"id\":\"202\"}', '浏览数据', '2', '127.0.0.1', '1513673010', '1513673040');
INSERT INTO `hisi_admin_log` VALUES ('35', '1', '修改菜单', 'admin/menu/edit', '{\"module\":\"admin\",\"pid\":\"1\",\"title\":\"\\u6570\\u636e\\u4e2d\\u5fc3\",\"icon\":\"aicon ai-shujukuguanli\",\"url\":\"admin\\/data\\/index\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"202\"}', '保存数据', '1', '127.0.0.1', '1513673020', '1513673020');
INSERT INTO `hisi_admin_log` VALUES ('36', '1', '中文数据库', 'admin/data/ch_data', '[]', '浏览数据', '127', '127.0.0.1', '1513673032', '1515574126');
INSERT INTO `hisi_admin_log` VALUES ('37', '1', '系统配置', 'admin/system/index', '{\"group\":\"sys\"}', '浏览数据', '1', '127.0.0.1', '1513673784', '1513673784');
INSERT INTO `hisi_admin_log` VALUES ('38', '1', '上传配置', 'admin/system/index', '{\"group\":\"upload\"}', '浏览数据', '2', '127.0.0.1', '1513673785', '1513819586');
INSERT INTO `hisi_admin_log` VALUES ('39', '1', '开发配置', 'admin/system/index', '{\"group\":\"develop\"}', '浏览数据', '2', '127.0.0.1', '1513673786', '1513819590');
INSERT INTO `hisi_admin_log` VALUES ('40', '1', '数据库配置', 'admin/system/index', '{\"group\":\"databases\"}', '浏览数据', '2', '127.0.0.1', '1513673787', '1513819594');
INSERT INTO `hisi_admin_log` VALUES ('41', '1', '添加管理员', 'admin/user/adduser', '[]', '浏览数据', '16', '127.0.0.1', '1513673800', '1515813261');
INSERT INTO `hisi_admin_log` VALUES ('42', '1', '管理员角色', 'admin/user/role', '[]', '浏览数据', '28', '127.0.0.1', '1513673810', '1515827417');
INSERT INTO `hisi_admin_log` VALUES ('43', '1', '添加角色', 'admin/user/addrole', '[]', '浏览数据', '12', '127.0.0.1', '1513673817', '1515813015');
INSERT INTO `hisi_admin_log` VALUES ('44', '1', '添加角色', 'admin/user/addrole', '{\"name\":\"\\u7f51\\u7ad9\\u7528\\u6237\",\"intro\":\"\\u7528\\u6237\\u767b\\u5f55\\u67e5\\u770b\\u6570\\u636e\\u4f7f\\u7528\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513673840', '1513673840');
INSERT INTO `hisi_admin_log` VALUES ('45', '1', '添加角色', 'admin/user/addrole', '{\"name\":\"\\u7f51\\u7ad9\\u7528\\u6237\",\"intro\":\"\\u7528\\u6237\\u767b\\u5f55\\u67e5\\u770b\\u6570\\u636e\\u4f7f\\u7528\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"202\",\"205\"],\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513673859', '1513673859');
INSERT INTO `hisi_admin_log` VALUES ('46', '1', '修改角色', 'admin/user/editrole', '{\"id\":\"3\"}', '浏览数据', '5', '127.0.0.1', '1513673870', '1515827435');
INSERT INTO `hisi_admin_log` VALUES ('47', '1', '添加管理员', 'admin/user/adduser', '{\"role_id\":\"3\",\"username\":\"laowu\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"123456\",\"email\":\"1113249273@qq.com\",\"mobile\":\"187123770\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513673958', '1513673958');
INSERT INTO `hisi_admin_log` VALUES ('48', '1', '添加管理员', 'admin/user/adduser', '{\"role_id\":\"3\",\"username\":\"laowu\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"123456\",\"email\":\"1262135552@qq.com\",\"mobile\":\"1871237707\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513673968', '1513673968');
INSERT INTO `hisi_admin_log` VALUES ('49', '1', '添加管理员', 'admin/user/adduser', '{\"role_id\":\"3\",\"username\":\"laowu\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"123456\",\"email\":\"1262135552@qq.com\",\"mobile\":\"18712377078\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513673972', '1513673972');
INSERT INTO `hisi_admin_log` VALUES ('50', '2', '后台首页', 'admin/index/index', '[]', '浏览数据', '73', '127.0.0.1', '1513673996', '1515830633');
INSERT INTO `hisi_admin_log` VALUES ('51', '2', '中文数据库', 'admin/data/ch_data', '[]', '浏览数据', '8', '127.0.0.1', '1513674015', '1515826098');
INSERT INTO `hisi_admin_log` VALUES ('52', '1', '后台首页', 'admin/index/welcome', '[]', '浏览数据', '5', '127.0.0.1', '1513688159', '1513733025');
INSERT INTO `hisi_admin_log` VALUES ('53', '1', '添加快捷菜单', 'admin/menu/quick', '{\"id\":\"205\"}', '浏览数据', '2', '127.0.0.1', '1513689256', '1513739388');
INSERT INTO `hisi_admin_log` VALUES ('54', '1', '删除菜单', 'admin/menu/del', '{\"ids\":\"206\"}', '保存数据', '1', '127.0.0.1', '1513689273', '1513689273');
INSERT INTO `hisi_admin_log` VALUES ('55', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"202\",\"title\":\"\\u82f1\\u6587\\u6570\\u636e\\u5e93\",\"icon\":\"aicon ai-chajianguanli\",\"url\":\"admin\\/data\\/en_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513690897', '1513690897');
INSERT INTO `hisi_admin_log` VALUES ('56', '1', '英文数据库', 'admin/data/en_data', '[]', '浏览数据', '55', '127.0.0.1', '1513690905', '1515574893');
INSERT INTO `hisi_admin_log` VALUES ('57', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"202\",\"title\":\"\\u533b\\u5b66\\u6570\\u636e\\u5e93\",\"icon\":\"aicon ai-xitonggongneng\",\"url\":\"admin\\/data\\/doc_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513691074', '1513691074');
INSERT INTO `hisi_admin_log` VALUES ('58', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"202\",\"title\":\"\\u6cd5\\u5f8b\\u6570\\u636e\\u5e93\",\"icon\":\"aicon ai-peizhiguanli\",\"url\":\"admin\\/data\\/law_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513691166', '1513691166');
INSERT INTO `hisi_admin_log` VALUES ('59', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"202\",\"title\":\"\\u7ecf\\u6d4e\\u6570\\u636e\\u5e93\",\"icon\":\"aicon ai-shuaxin2\",\"url\":\"admin\\/data\\/ec_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513691301', '1513691301');
INSERT INTO `hisi_admin_log` VALUES ('60', '1', '医学数据库', 'admin/data/doc_data', '[]', '浏览数据', '53', '127.0.0.1', '1513691967', '1515574127');
INSERT INTO `hisi_admin_log` VALUES ('61', '1', '法律数据库', 'admin/data/law_data', '[]', '浏览数据', '55', '127.0.0.1', '1513691968', '1514994492');
INSERT INTO `hisi_admin_log` VALUES ('62', '1', '经济数据库', 'admin/data/ec_data', '[]', '浏览数据', '42', '127.0.0.1', '1513691970', '1514993498');
INSERT INTO `hisi_admin_log` VALUES ('63', '1', '系统日志', 'admin/log/index', '{\"uid\":\"2\"}', '浏览数据', '1', '127.0.0.1', '1513732897', '1513732897');
INSERT INTO `hisi_admin_log` VALUES ('64', '1', '布局切换', 'admin/user/iframe', '{\"val\":\"1\"}', '浏览数据', '2', '127.0.0.1', '1513732990', '1513733004');
INSERT INTO `hisi_admin_log` VALUES ('65', '1', '布局切换', 'admin/user/iframe', '{\"val\":\"0\"}', '浏览数据', '2', '127.0.0.1', '1513732998', '1513733049');
INSERT INTO `hisi_admin_log` VALUES ('66', '1', '语言包管理', 'admin/language/index', '[]', '浏览数据', '1', '127.0.0.1', '1513733013', '1513733013');
INSERT INTO `hisi_admin_log` VALUES ('67', '1', '修改角色', 'admin/user/editrole', '{\"name\":\"\\u7f51\\u7ad9\\u7528\\u6237\",\"intro\":\"\\u7528\\u6237\\u767b\\u5f55\\u67e5\\u770b\\u6570\\u636e\\u4f7f\\u7528\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"202\",\"205\",\"2\",\"6\",\"14\",\"41\"],\"id\":\"3\"}', '保存数据', '1', '127.0.0.1', '1513736624', '1513736624');
INSERT INTO `hisi_admin_log` VALUES ('68', '2', '布局切换', 'admin/user/iframe', '{\"val\":\"1\"}', '浏览数据', '1', '127.0.0.1', '1513736651', '1513736651');
INSERT INTO `hisi_admin_log` VALUES ('69', '2', '个人信息设置', 'admin/user/info', '[]', '浏览数据', '21', '127.0.0.1', '1513736652', '1515827543');
INSERT INTO `hisi_admin_log` VALUES ('70', '2', '个人信息设置', 'admin/user/info', '{\"username\":\"laowu\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"654321\",\"email\":\"1262135552@qq.com\",\"mobile\":\"18712377078\",\"id\":\"\"}', '保存数据', '2', '127.0.0.1', '1513736664', '1513736694');
INSERT INTO `hisi_admin_log` VALUES ('71', '2', '后台首页', 'admin/index/welcome', '[]', '浏览数据', '1', '127.0.0.1', '1513736669', '1513736669');
INSERT INTO `hisi_admin_log` VALUES ('72', '2', '布局切换', 'admin/user/iframe', '{\"val\":\"0\"}', '浏览数据', '1', '127.0.0.1', '1513736672', '1513736672');
INSERT INTO `hisi_admin_log` VALUES ('73', '2', '个人信息设置', 'admin/user/info', '{\"username\":\"laowu\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"123456\",\"email\":\"1262135552@qq.com\",\"mobile\":\"18712377078\",\"id\":\"\"}', '保存数据', '2', '127.0.0.1', '1513736684', '1515815085');
INSERT INTO `hisi_admin_log` VALUES ('74', '1', '删除菜单', 'admin/menu/del', '{\"ids\":\"211\"}', '保存数据', '1', '127.0.0.1', '1513739431', '1513739431');
INSERT INTO `hisi_admin_log` VALUES ('75', '1', '模块管理', 'admin/module/index', '{\"status\":\"1\"}', '浏览数据', '1', '127.0.0.1', '1513739533', '1513739533');
INSERT INTO `hisi_admin_log` VALUES ('76', '1', '模块管理', 'admin/module/index', '{\"status\":\"0\"}', '浏览数据', '1', '127.0.0.1', '1513739534', '1513739534');
INSERT INTO `hisi_admin_log` VALUES ('77', '1', '导入模块', 'admin/module/import', '[]', '浏览数据', '1', '127.0.0.1', '1513739535', '1513739535');
INSERT INTO `hisi_admin_log` VALUES ('78', '1', '设计模块', 'admin/module/design', '[]', '浏览数据', '1', '127.0.0.1', '1513739538', '1513739538');
INSERT INTO `hisi_admin_log` VALUES ('79', '1', '修改管理员', 'admin/user/edituser', '{\"id\":\"1\"}', '浏览数据', '2', '127.0.0.1', '1513742188', '1513742196');
INSERT INTO `hisi_admin_log` VALUES ('80', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513742265691\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513742265', '1513742265');
INSERT INTO `hisi_admin_log` VALUES ('81', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513748375668\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513748375', '1513748375');
INSERT INTO `hisi_admin_log` VALUES ('82', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513748375669\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513748375', '1513748375');
INSERT INTO `hisi_admin_log` VALUES ('83', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513748417403\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513748417', '1513748417');
INSERT INTO `hisi_admin_log` VALUES ('84', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513748460855\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513748460', '1513748460');
INSERT INTO `hisi_admin_log` VALUES ('85', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513748460854\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513748461', '1513748461');
INSERT INTO `hisi_admin_log` VALUES ('86', '1', '附件上传', 'admin/annex/upload', '{\"thumb\":\"no\",\"water\":\"no\"}', '保存数据', '1', '127.0.0.1', '1513819555', '1513819555');
INSERT INTO `hisi_admin_log` VALUES ('87', '1', '基础配置', 'admin/system/index', '{\"id\":{\"site_status\":\"1\",\"site_domain\":\"\",\"wap_domain\":\"\",\"site_name\":\"HisiPHP\",\"site_logo\":\"\\/hisiphp-master\\/upload\\/sys\\/image\\/24\\/44b6745bd5aa695b71e009416c4a4d.jpg\",\"site_favicon\":\"\",\"site_title\":\"HisiPHP\\u5e94\\u7528\\u5e02\\u573a\",\"site_keywords\":\"hisiphp,hisiphp\\u6846\\u67b6,php\\u5f00\\u6e90\\u6846\\u67b6\",\"site_description\":\"\",\"site_icp\":\"\",\"site_statis\":\"\"},\"type\":{\"site_status\":\"switch\",\"site_domain\":\"input\",\"wap_site_status\":\"switch\",\"wap_domain\":\"input\",\"site_name\":\"input\",\"site_logo\":\"image\",\"site_favicon\":\"image\",\"site_title\":\"input\",\"site_keywords\":\"input\",\"site_description\":\"textarea\",\"site_icp\":\"input\",\"site_statis\":\"textarea\"},\"group\":\"base\"}', '保存数据', '1', '127.0.0.1', '1513819558', '1513819558');
INSERT INTO `hisi_admin_log` VALUES ('88', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513819656932\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513819657', '1513819657');
INSERT INTO `hisi_admin_log` VALUES ('89', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513819656931\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513819657', '1513819657');
INSERT INTO `hisi_admin_log` VALUES ('90', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"1\",\"title\":\"\\u6570\\u636e\\u5f55\\u5165\",\"icon\":\"aicon ai-doubleleft\",\"url\":\"admin\\/data\\/add_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"1\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513819759', '1513819759');
INSERT INTO `hisi_admin_log` VALUES ('91', '1', '添加菜单', 'admin/menu/add', '{\"pid\":\"212\",\"mod\":\"admin\"}', '浏览数据', '1', '127.0.0.1', '1513819789', '1513819789');
INSERT INTO `hisi_admin_log` VALUES ('92', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"212\",\"title\":\"\\u5bf9\\u5916\\u6570\\u636e\\u5f55\\u5165\",\"icon\":\"aicon ai-xitongrizhi-tiaoshi\",\"url\":\"admin\\/data\\/add_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"1\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513819829', '1513819829');
INSERT INTO `hisi_admin_log` VALUES ('93', '1', '数据录入', 'admin/data/add_data', '[]', '浏览数据', '155', '127.0.0.1', '1513819836', '1514993493');
INSERT INTO `hisi_admin_log` VALUES ('94', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513819993077\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513819993', '1513819993');
INSERT INTO `hisi_admin_log` VALUES ('95', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513820079873\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513820079', '1513820079');
INSERT INTO `hisi_admin_log` VALUES ('96', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513820079872\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513820080', '1513820080');
INSERT INTO `hisi_admin_log` VALUES ('97', '1', '数据录入', 'admin/data/add_data', '{\"q\":\"\"}', '浏览数据', '25', '127.0.0.1', '1513820580', '1513825516');
INSERT INTO `hisi_admin_log` VALUES ('98', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513823199724\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513823199', '1513823199');
INSERT INTO `hisi_admin_log` VALUES ('99', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513823201547\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513823201', '1513823201');
INSERT INTO `hisi_admin_log` VALUES ('100', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513823204252\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513823204', '1513823204');
INSERT INTO `hisi_admin_log` VALUES ('101', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513823204251\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513823204', '1513823204');
INSERT INTO `hisi_admin_log` VALUES ('102', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513823217272\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513823217', '1513823217');
INSERT INTO `hisi_admin_log` VALUES ('103', '1', '数据录入', 'admin/data/add_data', '{\"q\":\"l113211\"}', '浏览数据', '1', '127.0.0.1', '1513823878', '1513823878');
INSERT INTO `hisi_admin_log` VALUES ('104', '1', '修改菜单', 'admin/menu/edit', '{\"id\":\"4\"}', '浏览数据', '1', '127.0.0.1', '1513824386', '1513824386');
INSERT INTO `hisi_admin_log` VALUES ('105', '1', '状态设置', 'admin/menu/status', '{\"val\":\"0\",\"table\":\"admin_menu\",\"ids\":\"4\"}', '浏览数据', '1', '127.0.0.1', '1513824407', '1513824407');
INSERT INTO `hisi_admin_log` VALUES ('106', '1', '状态设置', 'admin/menu/status', '{\"val\":\"1\",\"table\":\"admin_menu\",\"ids\":\"4\"}', '浏览数据', '1', '127.0.0.1', '1513824408', '1513824408');
INSERT INTO `hisi_admin_log` VALUES ('107', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513825698516\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513825698', '1513825698');
INSERT INTO `hisi_admin_log` VALUES ('108', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513825698517\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513825698', '1513825698');
INSERT INTO `hisi_admin_log` VALUES ('109', '1', '修改角色', 'admin/user/editrole', '{\"id\":\"2\"}', '浏览数据', '3', '127.0.0.1', '1513825786', '1513844477');
INSERT INTO `hisi_admin_log` VALUES ('110', '1', '配置管理', 'admin/config/index', '{\"group\":\"sys\"}', '浏览数据', '2', '127.0.0.1', '1513825809', '1513825814');
INSERT INTO `hisi_admin_log` VALUES ('111', '1', '配置管理', 'admin/config/index', '{\"group\":\"base\"}', '浏览数据', '1', '127.0.0.1', '1513825810', '1513825810');
INSERT INTO `hisi_admin_log` VALUES ('112', '1', '配置管理', 'admin/config/index', '{\"group\":\"upload\"}', '浏览数据', '1', '127.0.0.1', '1513825814', '1513825814');
INSERT INTO `hisi_admin_log` VALUES ('113', '1', '配置管理', 'admin/config/index', '{\"group\":\"develop\"}', '浏览数据', '1', '127.0.0.1', '1513825815', '1513825815');
INSERT INTO `hisi_admin_log` VALUES ('114', '1', '配置管理', 'admin/config/index', '{\"group\":\"databases\"}', '浏览数据', '1', '127.0.0.1', '1513825815', '1513825815');
INSERT INTO `hisi_admin_log` VALUES ('115', '1', '添加菜单', 'admin/menu/add', '{\"pid\":\"213\",\"mod\":\"admin\"}', '浏览数据', '5', '127.0.0.1', '1513825842', '1514794954');
INSERT INTO `hisi_admin_log` VALUES ('116', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"213\",\"title\":\"\\u6570\\u636e\\u6dfb\\u52a0\",\"icon\":\"aicon ai-tianjia\",\"url\":\"admin\\/data\\/add\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"0\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513825886', '1513825886');
INSERT INTO `hisi_admin_log` VALUES ('117', '1', '数据添加', 'admin/data/add', '[]', '浏览数据', '62', '127.0.0.1', '1513825896', '1514872617');
INSERT INTO `hisi_admin_log` VALUES ('118', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513825896462\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513825896', '1513825896');
INSERT INTO `hisi_admin_log` VALUES ('119', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513825896465\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513825896', '1513825896');
INSERT INTO `hisi_admin_log` VALUES ('120', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513825940027\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513825940', '1513825940');
INSERT INTO `hisi_admin_log` VALUES ('121', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513825951366\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513825951', '1513825951');
INSERT INTO `hisi_admin_log` VALUES ('122', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513825978320\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513825978', '1513825978');
INSERT INTO `hisi_admin_log` VALUES ('123', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513825978319\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513825978', '1513825978');
INSERT INTO `hisi_admin_log` VALUES ('124', '1', '[弹窗]会员选择', 'admin/member/pop', '{\"callback\":\"func\"}', '浏览数据', '4', '127.0.0.1', '1513826010', '1513826040');
INSERT INTO `hisi_admin_log` VALUES ('125', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826014270\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513826014', '1513826014');
INSERT INTO `hisi_admin_log` VALUES ('126', '1', '[弹窗]会员选择', 'admin/member/pop', '{\"q\":\"18712377078\",\"func\":\"func\"}', '浏览数据', '1', '127.0.0.1', '1513826037', '1513826037');
INSERT INTO `hisi_admin_log` VALUES ('127', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826126815\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513826126', '1513826127');
INSERT INTO `hisi_admin_log` VALUES ('128', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826186447\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513826186', '1513826186');
INSERT INTO `hisi_admin_log` VALUES ('129', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826210304\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513826210', '1513826210');
INSERT INTO `hisi_admin_log` VALUES ('130', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826210305\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513826210', '1513826210');
INSERT INTO `hisi_admin_log` VALUES ('131', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826358301\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513826358', '1513826358');
INSERT INTO `hisi_admin_log` VALUES ('132', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826378946\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513826379', '1513826379');
INSERT INTO `hisi_admin_log` VALUES ('133', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826378947\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513826379', '1513826379');
INSERT INTO `hisi_admin_log` VALUES ('134', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826397283\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513826397', '1513826397');
INSERT INTO `hisi_admin_log` VALUES ('135', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826500422\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513826500', '1513826500');
INSERT INTO `hisi_admin_log` VALUES ('136', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826515862\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513826515', '1513826515');
INSERT INTO `hisi_admin_log` VALUES ('137', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826515861\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513826516', '1513826516');
INSERT INTO `hisi_admin_log` VALUES ('138', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826534913\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513826535', '1513826535');
INSERT INTO `hisi_admin_log` VALUES ('139', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826581089\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513826581', '1513826581');
INSERT INTO `hisi_admin_log` VALUES ('140', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826680487\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513826680', '1513826680');
INSERT INTO `hisi_admin_log` VALUES ('141', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513826688931\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513826689', '1513826689');
INSERT INTO `hisi_admin_log` VALUES ('142', '1', '数据中心', 'admin/data/index', '[]', '浏览数据', '1', '127.0.0.1', '1513827698', '1513827698');
INSERT INTO `hisi_admin_log` VALUES ('143', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513827702877\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513827702', '1513827702');
INSERT INTO `hisi_admin_log` VALUES ('144', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513827702876\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513827703', '1513827703');
INSERT INTO `hisi_admin_log` VALUES ('145', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513827733545\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513827733', '1513827733');
INSERT INTO `hisi_admin_log` VALUES ('146', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513827782710\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513827782', '1513827782');
INSERT INTO `hisi_admin_log` VALUES ('147', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513827786397\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513827786', '1513827786');
INSERT INTO `hisi_admin_log` VALUES ('148', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513827801861\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513827801', '1513827802');
INSERT INTO `hisi_admin_log` VALUES ('149', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513827804742\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513827804', '1513827804');
INSERT INTO `hisi_admin_log` VALUES ('150', '1', '清空缓存', 'admin/index/clear', '[]', '浏览数据', '5', '127.0.0.1', '1513827858', '1513908667');
INSERT INTO `hisi_admin_log` VALUES ('151', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513827920917\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513827921', '1513827921');
INSERT INTO `hisi_admin_log` VALUES ('152', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513828015338\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513828015', '1513828015');
INSERT INTO `hisi_admin_log` VALUES ('153', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"213\",\"title\":\"\\u6570\\u636e\\u6dfb\\u52a0\\u63d0\\u4ea4\",\"icon\":\"aicon ai-chu\",\"url\":\"admin\\/data\\/addyes\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"0\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513828079', '1513828079');
INSERT INTO `hisi_admin_log` VALUES ('154', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513828085311\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513828085', '1513828085');
INSERT INTO `hisi_admin_log` VALUES ('155', '1', '数据添加提交', 'admin/data/addyes', '{\"type1\":\"ch_data\",\"username\":\"\",\"nick\":\"\",\"password\":\"\",\"email\":\"\",\"mobile\":\"\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513828086', '1513828086');
INSERT INTO `hisi_admin_log` VALUES ('156', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513828198702\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513828198', '1513828198');
INSERT INTO `hisi_admin_log` VALUES ('157', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513828683931\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513828684', '1513828684');
INSERT INTO `hisi_admin_log` VALUES ('158', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513828683932\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '1', '127.0.0.1', '1513828684', '1513828684');
INSERT INTO `hisi_admin_log` VALUES ('159', '1', '数据添加提交', 'admin/data/addyes', '{\"type1\":\"en_data\",\"loginurl\":\"33\",\"username\":\"33\",\"password\":\"333\",\"type2\":\"33\",\"min_typename\":\"33\",\"id\":\"\"}', '保存数据', '2', '127.0.0.1', '1513828690', '1513828705');
INSERT INTO `hisi_admin_log` VALUES ('160', '1', '附件上传', 'admin/annex/upload', '{\"action\":\"config\",\"noCache\":\"1513828750657\",\"thumb\":\"no\",\"from\":\"ueditor\"}', '浏览数据', '2', '127.0.0.1', '1513828750', '1513828750');
INSERT INTO `hisi_admin_log` VALUES ('161', '1', '数据添加提交', 'admin/data/addyes', '{\"type1\":\"ch_data\",\"loginurl\":\"11\",\"username\":\"11\",\"password\":\"11\",\"type2\":\"11\",\"min_typename\":\"11\",\"id\":\"\"}', '保存数据', '14', '127.0.0.1', '1513828755', '1513829065');
INSERT INTO `hisi_admin_log` VALUES ('162', '1', '添加角色', 'admin/user/addrole', '{\"name\":\"32\",\"intro\":\"\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513842244', '1513842244');
INSERT INTO `hisi_admin_log` VALUES ('163', '1', '添加角色', 'admin/user/addrole', '{\"name\":\"32\",\"intro\":\"232\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"202\",\"205\",\"207\",\"208\",\"209\",\"210\",\"212\",\"213\",\"214\",\"215\"],\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513842253', '1513842253');
INSERT INTO `hisi_admin_log` VALUES ('164', '1', '删除角色', 'admin/user/delrole', '{\"ids\":\"4\"}', '浏览数据', '1', '127.0.0.1', '1513842311', '1513842311');
INSERT INTO `hisi_admin_log` VALUES ('165', '1', '数据添加', 'admin/data/add', '{\"type1\":\"ch_data\",\"loginurl\":\"12\",\"username\":\"12\",\"password\":\"12\",\"type2\":\"12\",\"min_typename\":\"12\",\"id\":\"\"}', '保存数据', '5', '127.0.0.1', '1513842645', '1513843000');
INSERT INTO `hisi_admin_log` VALUES ('166', '1', '数据录入', 'admin/data/add_data', '{\"page\":\"2\"}', '浏览数据', '10', '127.0.0.1', '1513843038', '1513844183');
INSERT INTO `hisi_admin_log` VALUES ('167', '1', '数据录入', 'admin/data/add_data', '{\"page\":\"1\"}', '浏览数据', '23', '127.0.0.1', '1513843039', '1514297135');
INSERT INTO `hisi_admin_log` VALUES ('168', '1', '数据添加', 'admin/data/add', '{\"type1\":\"ch_data\",\"loginurl\":\"\",\"username\":\"\",\"password\":\"\",\"type2\":\"\",\"min_typename\":\"\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843085', '1513843085');
INSERT INTO `hisi_admin_log` VALUES ('169', '1', '数据录入', 'admin/data/add_data', '{\"page\":\"3\"}', '浏览数据', '4', '127.0.0.1', '1513843113', '1513843164');
INSERT INTO `hisi_admin_log` VALUES ('170', '1', '数据添加', 'admin/data/add', '{\"type1\":\"ch_data\",\"loginurl\":\"https:\\/\\/gitee.com\\/swoole\\/swoole\\/tree\\/v1.9.22\",\"username\":\"wudi\",\"password\":\"123456\",\"type2\":\"asd\",\"min_typename\":\"eeee\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843417', '1513843417');
INSERT INTO `hisi_admin_log` VALUES ('171', '1', '数据添加', 'admin/data/add', '{\"type1\":\"en_data\",\"loginurl\":\"https:\\/\\/gitee.com\\/swoole\\/swoole\\/tree\\/v1.9.22\",\"username\":\"asdsad\",\"password\":\"asdadas\",\"type2\":\"asdasdsa\",\"min_typename\":\"sadasdas\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843440', '1513843440');
INSERT INTO `hisi_admin_log` VALUES ('172', '1', '数据添加', 'admin/data/add', '{\"type1\":\"doc_data\",\"loginurl\":\"qweqweqwe\",\"username\":\"qwe\",\"password\":\"qweqwe\",\"type2\":\"qweqw\",\"min_typename\":\"eqeqe\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843453', '1513843453');
INSERT INTO `hisi_admin_log` VALUES ('173', '1', '数据添加', 'admin/data/add', '{\"type1\":\"law_data\",\"loginurl\":\"qweqweqw\",\"username\":\"qweqweq\",\"password\":\"eqeqeq\",\"type2\":\"ewqeqewqe\",\"min_typename\":\"qeqeqewqeq\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843470', '1513843470');
INSERT INTO `hisi_admin_log` VALUES ('174', '1', '数据添加', 'admin/data/add', '{\"type1\":\"ec_data\",\"loginurl\":\"asdadasdqw\",\"username\":\"qweqweqweq\",\"password\":\"qweqeqeqweq\",\"type2\":\"qweqweqweq\",\"min_typename\":\"qweqweqeqweq\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843490', '1513843490');
INSERT INTO `hisi_admin_log` VALUES ('175', '1', '数据添加', 'admin/data/add', '{\"type1\":\"law_data\",\"loginurl\":\"asdasdqwewq\",\"username\":\"qweqeqw\",\"password\":\"eqeqw\",\"type2\":\"ewqeqeq\",\"min_typename\":\"weqeqe\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843506', '1513843506');
INSERT INTO `hisi_admin_log` VALUES ('176', '1', '数据添加', 'admin/data/add', '{\"type1\":\"ch_data\",\"loginurl\":\"sadadsad\",\"username\":\"sadasda\",\"password\":\"dada\",\"type2\":\"dadasd\",\"min_typename\":\"adadasd\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843519', '1513843519');
INSERT INTO `hisi_admin_log` VALUES ('177', '1', '数据添加', 'admin/data/add', '{\"type1\":\"ch_data\",\"loginurl\":\"https:\\/\\/gitee.com\\/swoole\\/swoole\\/tree\\/v1.9.22\",\"username\":\"asdad\",\"password\":\"asdasdad\",\"type2\":\"asdadasd\",\"min_typename\":\"asdsadad\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843530', '1513843530');
INSERT INTO `hisi_admin_log` VALUES ('178', '1', '数据添加', 'admin/data/add', '{\"type1\":\"ch_data\",\"loginurl\":\"asdasd\",\"username\":\"aasda\",\"password\":\"dasdad\",\"type2\":\"sadsad\",\"min_typename\":\"sadasd\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843539', '1513843539');
INSERT INTO `hisi_admin_log` VALUES ('179', '1', '数据添加', 'admin/data/add', '{\"type1\":\"en_data\",\"loginurl\":\"ndiasd\",\"username\":\"asdasdm\",\"password\":\"asdmakdam\",\"type2\":\"asdajskda\",\"min_typename\":\"9idasdia9\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513843650', '1513843650');
INSERT INTO `hisi_admin_log` VALUES ('180', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"213\",\"title\":\"\\u5bf9\\u5916\\u6570\\u636e\\u4fee\\u6539\",\"icon\":\"aicon ai-peizhiguanli\",\"url\":\"admin\\/data\\/dataedit\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"0\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513844322', '1513844322');
INSERT INTO `hisi_admin_log` VALUES ('181', '1', '修改菜单', 'admin/menu/edit', '{\"id\":\"216\"}', '浏览数据', '1', '127.0.0.1', '1513845385', '1513845385');
INSERT INTO `hisi_admin_log` VALUES ('182', '1', '修改菜单', 'admin/menu/edit', '{\"module\":\"admin\",\"pid\":\"213\",\"title\":\"\\u5bf9\\u5916\\u6570\\u636e\\u4fee\\u6539\",\"icon\":\"aicon ai-peizhiguanli\",\"url\":\"admin\\/data\\/edit_data\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"0\",\"id\":\"216\"}', '保存数据', '1', '127.0.0.1', '1513845390', '1513845390');
INSERT INTO `hisi_admin_log` VALUES ('183', '1', '对外数据修改', 'admin/data/edit_data', '{\"id\":\"11\"}', '浏览数据', '21', '127.0.0.1', '1513845400', '1513904862');
INSERT INTO `hisi_admin_log` VALUES ('184', '1', '对外数据修改', 'admin/data/edit_data', '{\"id\":\"1\"}', '浏览数据', '7', '127.0.0.1', '1513845580', '1513909714');
INSERT INTO `hisi_admin_log` VALUES ('185', '1', '对外数据修改', 'admin/data/edit_data', '{\"id\":\"4\"}', '浏览数据', '9', '127.0.0.1', '1513845590', '1513848353');
INSERT INTO `hisi_admin_log` VALUES ('186', '1', '对外数据修改', 'admin/data/edit_data', '{\"id\":\"2\"}', '浏览数据', '4', '127.0.0.1', '1513845623', '1513847928');
INSERT INTO `hisi_admin_log` VALUES ('187', '1', '对外数据修改', 'admin/data/edit_data', '{\"id\":\"5\"}', '浏览数据', '5', '127.0.0.1', '1513846649', '1513847492');
INSERT INTO `hisi_admin_log` VALUES ('188', '1', '对外数据修改', 'admin/data/edit_data', '{\"id\":\"9\"}', '浏览数据', '3', '127.0.0.1', '1513846930', '1513846963');
INSERT INTO `hisi_admin_log` VALUES ('189', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"en_data\",\"loginurl\":\"https:\\/\\/gitee.com\\/swoole\\/swoole\\/tree\\/v1.9.22\",\"username\":\"asdsad\",\"password\":\"asdadas\",\"id\":\"\",\"type2\":\"asdasdsa1\",\"min_typename\":\"sadasdas\"}', '保存数据', '3', '127.0.0.1', '1513847722', '1513847742');
INSERT INTO `hisi_admin_log` VALUES ('190', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"ch_data\",\"loginurl\":\"12\",\"username\":\"12\",\"password\":\"12\",\"id\":\"\",\"type2\":\"12QQQQ\",\"min_typename\":\"12\"}', '保存数据', '1', '127.0.0.1', '1513847758', '1513847758');
INSERT INTO `hisi_admin_log` VALUES ('191', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"ch_data\",\"loginurl\":\"12\",\"username\":\"12\",\"password\":\"12\",\"id\":\"\",\"type2\":\"12\",\"min_typename\":\"12\"}', '保存数据', '11', '127.0.0.1', '1513847791', '1513848007');
INSERT INTO `hisi_admin_log` VALUES ('192', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"ch_data\",\"loginurl\":\"https:\\/\\/gitee.com\\/swoole\\/swoole\\/tree\\/v1.9.22\",\"username\":\"wudi\",\"password\":\"123456\",\"id\":\"\",\"type2\":\"asd\",\"min_typename\":\"eeee\"}', '保存数据', '5', '127.0.0.1', '1513848126', '1513848257');
INSERT INTO `hisi_admin_log` VALUES ('193', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"ch_data\",\"loginurl\":\"https:\\/\\/gitee.com\\/swoole\\/swoole\\/tree\\/v1.9.22\",\"username\":\"wudi\",\"password\":\"123456\",\"ids\":\"4\",\"type2\":\"asd\",\"min_typename\":\"eeee\",\"id\":\"\"}', '保存数据', '3', '127.0.0.1', '1513848287', '1513848347');
INSERT INTO `hisi_admin_log` VALUES ('194', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"ch_data\",\"loginurl\":\"https:\\/\\/gitee.com\\/swoole\\/swoole\\/tree\\/v1.9.22\",\"username\":\"wudi\",\"password\":\"123456\",\"type2\":\"asd\",\"min_typename\":\"eeee\",\"id\":\"4\"}', '保存数据', '2', '127.0.0.1', '1513848355', '1513848365');
INSERT INTO `hisi_admin_log` VALUES ('195', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"ch_data\",\"loginurl\":\"https:\\/\\/gitee.com\\/swoole\\/swoole\\/tree\\/v1.9.22\",\"username\":\"wudi1\",\"password\":\"123456\",\"type2\":\"asd\",\"min_typename\":\"eeee\",\"id\":\"4\"}', '保存数据', '1', '127.0.0.1', '1513848379', '1513848379');
INSERT INTO `hisi_admin_log` VALUES ('196', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"ch_data\",\"loginurl\":\"https:\\/\\/gitee.com\\/swoole\\/swoole\\/tree\\/v1.9.22\",\"username\":\"asdad\",\"password\":\"asdasdad\",\"type2\":\"asdadasd\",\"min_typename\":\"asdsadad\",\"id\":\"11\"}', '保存数据', '11', '127.0.0.1', '1513848607', '1513873371');
INSERT INTO `hisi_admin_log` VALUES ('197', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"ch_data\",\"loginurl\":\"https:\\/\\/www.kancloud.cn\\/manual\\/thinkphp5\\/135176\",\"username\":\"l113211\",\"password\":\"18712377078\",\"type2\":\"zhihu\",\"min_typename\":\"DX\",\"id\":\"1\"}', '保存数据', '3', '127.0.0.1', '1513904677', '1513904799');
INSERT INTO `hisi_admin_log` VALUES ('198', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"ch_data\",\"loginurl\":\"https:\\/\\/www.kancloud.cn\\/manual\\/thinkphp5\\/135176\",\"username\":\"l1132111\",\"password\":\"18712377078\",\"type2\":\"zhihu\",\"min_typename\":\"DX\",\"id\":\"1\"}', '保存数据', '1', '127.0.0.1', '1513904853', '1513904853');
INSERT INTO `hisi_admin_log` VALUES ('199', '1', '对外数据修改', 'admin/data/edit_data', '{\"type1\":\"ch_data\",\"loginurl\":\"https:\\/\\/gitee.com\\/swoole\\/swoole\\/tree\\/v1.9.22\",\"username\":\"asdad1\",\"password\":\"asdasdad\",\"type2\":\"asdadasd\",\"min_typename\":\"asdsadad\",\"id\":\"11\"}', '保存数据', '1', '127.0.0.1', '1513904865', '1513904865');
INSERT INTO `hisi_admin_log` VALUES ('200', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"213\",\"title\":\"\\u6570\\u636e\\u5220\\u9664\",\"icon\":\"aicon ai-mokuaiguanli1\",\"url\":\"admin\\/data\\/deldata\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513905282', '1513905282');
INSERT INTO `hisi_admin_log` VALUES ('201', '1', '修改菜单', 'admin/menu/edit', '{\"id\":\"217\"}', '浏览数据', '1', '127.0.0.1', '1513905294', '1513905294');
INSERT INTO `hisi_admin_log` VALUES ('202', '1', '修改菜单', 'admin/menu/edit', '{\"module\":\"admin\",\"pid\":\"213\",\"title\":\"\\u6570\\u636e\\u5220\\u9664\",\"icon\":\"aicon ai-mokuaiguanli1\",\"url\":\"admin\\/data\\/deldata\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"0\",\"id\":\"217\"}', '保存数据', '1', '127.0.0.1', '1513905297', '1513905297');
INSERT INTO `hisi_admin_log` VALUES ('203', '1', '数据删除', 'admin/data/deldata', '{\"id\":\"2\"}', '浏览数据', '3', '127.0.0.1', '1513907771', '1513908240');
INSERT INTO `hisi_admin_log` VALUES ('204', '1', '数据删除', 'admin/data/deldata', '{\"id\":\"6\"}', '浏览数据', '2', '127.0.0.1', '1513907779', '1513908650');
INSERT INTO `hisi_admin_log` VALUES ('205', '1', '数据删除', 'admin/data/deldata', '{\"id\":\"12\"}', '浏览数据', '1', '127.0.0.1', '1513908252', '1513908252');
INSERT INTO `hisi_admin_log` VALUES ('206', '1', '数据删除', 'admin/data/deldata', '{\"id\":\"10\"}', '浏览数据', '1', '127.0.0.1', '1513908261', '1513908261');
INSERT INTO `hisi_admin_log` VALUES ('207', '1', '数据添加', 'admin/data/add', '{\"type1\":\"ch_data\",\"loginurl\":\"qw\",\"username\":\"qwe\",\"password\":\"qwe\",\"type2\":\"qwe\",\"min_typename\":\"qwe\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513908320', '1513908320');
INSERT INTO `hisi_admin_log` VALUES ('208', '1', '数据添加', 'admin/data/add', '{\"type1\":\"ch_data\",\"loginurl\":\"wqe\",\"username\":\"qwe\",\"password\":\"qe\",\"type2\":\"qwe\",\"min_typename\":\"qew\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1513908329', '1513908329');
INSERT INTO `hisi_admin_log` VALUES ('209', '1', '数据删除', 'admin/data/deldata', '{\"id\":\"15\"}', '浏览数据', '1', '127.0.0.1', '1513908337', '1513908337');
INSERT INTO `hisi_admin_log` VALUES ('210', '1', '数据删除', 'admin/data/deldata', '{\"q\":\"\"}', '保存数据', '2', '127.0.0.1', '1513908436', '1513908452');
INSERT INTO `hisi_admin_log` VALUES ('211', '1', '数据录入', 'admin/data/add_data', '{\"q\":\"\\u4e2d\\u6587\\u6570\\u636e\\u5e93\"}', '浏览数据', '2', '127.0.0.1', '1513908472', '1513908524');
INSERT INTO `hisi_admin_log` VALUES ('212', '1', '数据删除', 'admin/data/deldata', '{\"id\":\"7\"}', '浏览数据', '1', '127.0.0.1', '1513908653', '1513908653');
INSERT INTO `hisi_admin_log` VALUES ('213', '1', '数据录入', 'admin/data/add_data', '{\"page\":\"9\"}', '浏览数据', '2', '127.0.0.1', '1514296804', '1514297131');
INSERT INTO `hisi_admin_log` VALUES ('214', '1', '对外数据修改', 'admin/data/edit_data', '{\"id\":\"16\"}', '浏览数据', '2', '127.0.0.1', '1514428304', '1514811982');
INSERT INTO `hisi_admin_log` VALUES ('215', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"213\",\"title\":\"\\u6570\\u636e\\u663e\\u793a\",\"icon\":\"aicon ai-quanping1\",\"url\":\"admin\\/data\\/data_show\",\"param\":\"\",\"status\":\"1\",\"system\":\"1\",\"nav\":\"0\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1514794983', '1514794983');
INSERT INTO `hisi_admin_log` VALUES ('216', '1', '数据显示', 'admin/data/data_show', '{\"type2\":\"\\u77e5\\u7f51\",\"min_typename\":\"MZ\"}', '浏览数据', '21', '127.0.0.1', '1514799874', '1514856922');
INSERT INTO `hisi_admin_log` VALUES ('217', '1', '数据显示', 'admin/data/data_show', '{\"type2\":\"\\u77e5\\u7f51\",\"min_typename\":\"JS\"}', '浏览数据', '8', '127.0.0.1', '1514799887', '1514817133');
INSERT INTO `hisi_admin_log` VALUES ('218', '1', '数据显示', 'admin/data/data_show', '{\"type2\":\"\\u77e5\\u7f51\",\"min_typename\":\"NL\"}', '浏览数据', '1', '127.0.0.1', '1514799890', '1514799890');
INSERT INTO `hisi_admin_log` VALUES ('219', '1', '数据显示', 'admin/data/data_show', '{\"type2\":\"\\u4e07\\u65b9\",\"min_typename\":\"HN\"}', '浏览数据', '4', '127.0.0.1', '1514817949', '1514818314');
INSERT INTO `hisi_admin_log` VALUES ('220', '1', '数据显示', 'admin/data/data_show', '{\"type2\":\"\\u77e5\\u7f51\",\"min_typename\":\"BJ\"}', '浏览数据', '7', '127.0.0.1', '1514857214', '1514862495');
INSERT INTO `hisi_admin_log` VALUES ('221', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"1\",\"title\":\"\\u7559\\u8a00\\u677f\",\"icon\":\"typcn typcn-volume-up\",\"url\":\"admin\\/data\\/massage\",\"param\":\"\",\"status\":\"1\",\"system\":\"1\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1514870072', '1514870072');
INSERT INTO `hisi_admin_log` VALUES ('222', '1', '修改菜单', 'admin/menu/edit', '{\"id\":\"24\"}', '浏览数据', '2', '127.0.0.1', '1514870127', '1514870144');
INSERT INTO `hisi_admin_log` VALUES ('223', '1', '修改菜单', 'admin/menu/edit', '{\"id\":\"219\"}', '浏览数据', '1', '127.0.0.1', '1514871142', '1514871142');
INSERT INTO `hisi_admin_log` VALUES ('224', '1', '修改菜单', 'admin/menu/edit', '{\"module\":\"admin\",\"pid\":\"1\",\"title\":\"Feed_Back\",\"icon\":\"typcn typcn-volume-up\",\"url\":\"admin\\/data\\/massage\",\"param\":\"\",\"status\":\"1\",\"system\":\"1\",\"nav\":\"1\",\"id\":\"219\"}', '保存数据', '1', '127.0.0.1', '1514871159', '1514871159');
INSERT INTO `hisi_admin_log` VALUES ('225', '1', '添加菜单', 'admin/menu/add', '{\"pid\":\"219\",\"mod\":\"admin\"}', '浏览数据', '2', '127.0.0.1', '1514871173', '1514871206');
INSERT INTO `hisi_admin_log` VALUES ('226', '1', '添加菜单', 'admin/menu/add', '{\"module\":\"admin\",\"pid\":\"219\",\"title\":\"\\u7559\\u8a00\\u677f\",\"icon\":\"fa fa-github-alt\",\"url\":\"admin\\/data\\/lyb\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1514871202', '1514871202');
INSERT INTO `hisi_admin_log` VALUES ('227', '1', '留言板', 'admin/data/lyb', '[]', '浏览数据', '6', '127.0.0.1', '1514871209', '1514993489');
INSERT INTO `hisi_admin_log` VALUES ('228', '1', '数据添加', 'admin/data/add', '{\"type1\":\"doc_data\",\"type\":\"4\",\"loginurl\":\"http:\\/\\/www.soopat.com\\/\",\"webdoor\":\"http:\\/\\/www.soopat.com\\/\",\"username\":\"747688447@qq.com\",\"password\":\"123456 \",\"type2\":\"\\u4e2d\\u6587\\u4e13\\u5229\",\"min_typename\":\"Soopat\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1514872884', '1514872884');
INSERT INTO `hisi_admin_log` VALUES ('229', '1', '数据显示', 'admin/data/data_show', '{\"type2\":\"\\u4e2d\\u6587\\u4e13\\u5229\",\"min_typename\":\"Soopat\"}', '浏览数据', '4', '127.0.0.1', '1514873261', '1514874598');
INSERT INTO `hisi_admin_log` VALUES ('230', '1', '状态设置', 'admin/member/status', '{\"val\":\"0\",\"table\":\"admin_member\",\"ids\":\"1000000\"}', '浏览数据', '1', '127.0.0.1', '1515422441', '1515422441');
INSERT INTO `hisi_admin_log` VALUES ('231', '1', '状态设置', 'admin/member/status', '{\"val\":\"1\",\"table\":\"admin_member\",\"ids\":\"1000000\"}', '浏览数据', '1', '127.0.0.1', '1515422442', '1515422442');
INSERT INTO `hisi_admin_log` VALUES ('232', '1', '状态设置', 'admin/user/status', '{\"val\":\"0\",\"table\":\"admin_user\",\"ids\":\"2\"}', '浏览数据', '1', '127.0.0.1', '1515422453', '1515422453');
INSERT INTO `hisi_admin_log` VALUES ('233', '1', '状态设置', 'admin/user/status', '{\"val\":\"1\",\"table\":\"admin_user\",\"ids\":\"2\"}', '浏览数据', '1', '127.0.0.1', '1515422454', '1515422454');
INSERT INTO `hisi_admin_log` VALUES ('234', '1', '添加会员等级', 'admin/member/addlevel', '[]', '浏览数据', '1', '127.0.0.1', '1515422495', '1515422495');
INSERT INTO `hisi_admin_log` VALUES ('235', '1', '会员列表', 'admin/member/index', '{\"q\":\"laowu\"}', '浏览数据', '2', '127.0.0.1', '1515422510', '1515422519');
INSERT INTO `hisi_admin_log` VALUES ('236', '1', '会员列表', 'admin/member/index', '{\"q\":\"\"}', '浏览数据', '2', '127.0.0.1', '1515422513', '1515422524');
INSERT INTO `hisi_admin_log` VALUES ('237', '1', '修改会员', 'admin/member/edit', '{\"id\":\"1000001\"}', '浏览数据', '1', '127.0.0.1', '1515422528', '1515422528');
INSERT INTO `hisi_admin_log` VALUES ('238', '1', '添加管理员', 'admin/user/adduser', '{\"role_id\":\"3\",\"username\":\"wudidi\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"123456\",\"email\":\"1\",\"mobile\":\"1\",\"expire_time\":\"1\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1515423907', '1515423907');
INSERT INTO `hisi_admin_log` VALUES ('239', '1', '添加管理员', 'admin/user/adduser', '{\"role_id\":\"3\",\"username\":\"wudididi\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e51\",\"password\":\"123456\",\"email\":\"1\",\"mobile\":\"1\",\"expire_time\":\"1\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1515423922', '1515423922');
INSERT INTO `hisi_admin_log` VALUES ('240', '1', '添加管理员', 'admin/user/adduser', '{\"role_id\":\"3\",\"username\":\"wudididi\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e51\",\"password\":\"123456\",\"email\":\"1@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"1\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1515423940', '1515423940');
INSERT INTO `hisi_admin_log` VALUES ('241', '1', '删除管理员', 'admin/user/deluser', '{\"ids\":\"3\"}', '浏览数据', '1', '127.0.0.1', '1515424081', '1515424081');
INSERT INTO `hisi_admin_log` VALUES ('242', '1', '添加管理员', 'admin/user/adduser', '{\"role_id\":\"3\",\"username\":\"wudidididid\",\"nick\":\"nihao \",\"password\":\"123456\",\"email\":\"111@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"999\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1515424119', '1515424119');
INSERT INTO `hisi_admin_log` VALUES ('243', '4', '后台首页', 'admin/index/index', '[]', '浏览数据', '4', '127.0.0.1', '1515424196', '1515424703');
INSERT INTO `hisi_admin_log` VALUES ('244', '4', '中文数据库', 'admin/data/ch_data', '[]', '浏览数据', '3', '127.0.0.1', '1515424203', '1515424228');
INSERT INTO `hisi_admin_log` VALUES ('245', '4', '系统管理员', 'admin/user/index', '[]', '浏览数据', '1', '127.0.0.1', '1515424207', '1515424207');
INSERT INTO `hisi_admin_log` VALUES ('246', '1', '修改管理员', 'admin/user/edituser', '{\"id\":\"4\"}', '浏览数据', '6', '127.0.0.1', '1515479611', '1515479764');
INSERT INTO `hisi_admin_log` VALUES ('247', '1', '修改管理员', 'admin/user/edituser', '{\"role_id\":\"3\",\"username\":\"wudidididid\",\"nick\":\"1111\",\"password\":\"\",\"email\":\"111@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"1\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"202\",\"205\",\"2\",\"6\",\"14\",\"41\"],\"id\":\"4\"}', '保存数据', '1', '127.0.0.1', '1515479618', '1515479618');
INSERT INTO `hisi_admin_log` VALUES ('248', '1', '修改管理员', 'admin/user/edituser', '{\"role_id\":\"3\",\"username\":\"wudidididid\",\"nick\":\"1111\",\"password\":\"\",\"email\":\"111@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"999\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"202\",\"205\",\"2\",\"6\",\"14\",\"41\"],\"id\":\"4\"}', '保存数据', '1', '127.0.0.1', '1515479649', '1515479649');
INSERT INTO `hisi_admin_log` VALUES ('249', '1', '添加管理员', 'admin/user/adduser', '{\"role_id\":\"2\",\"username\":\"niubi\",\"nick\":\"1212\",\"password\":\"111111\",\"email\":\"111@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"999\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1515479846', '1515479846');
INSERT INTO `hisi_admin_log` VALUES ('250', '1', '添加管理员', 'admin/user/adduser', '{\"role_id\":\"2\",\"username\":\"niubi\",\"nick\":\"1212\",\"password\":\"111111\",\"email\":\"111111@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"999\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1515479850', '1515479850');
INSERT INTO `hisi_admin_log` VALUES ('251', '1', '修改管理员', 'admin/user/edituser', '{\"id\":\"5\"}', '浏览数据', '22', '127.0.0.1', '1515479868', '1515480949');
INSERT INTO `hisi_admin_log` VALUES ('252', '1', '修改管理员', 'admin/user/edituser', '{\"role_id\":\"2\",\"username\":\"niubi\",\"nick\":\"1212\",\"password\":\"\",\"email\":\"111111@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"1\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"2\",\"6\",\"10\",\"60\",\"61\",\"62\",\"63\",\"91\",\"11\",\"55\",\"56\",\"57\",\"58\",\"59\",\"12\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"13\",\"33\",\"34\",\"35\",\"36\",\"14\",\"37\",\"38\",\"39\",\"40\",\"41\",\"16\",\"78\",\"79\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"7\",\"20\",\"75\",\"76\",\"77\",\"21\",\"90\",\"70\",\"71\",\"72\",\"73\",\"74\",\"8\",\"17\",\"65\",\"66\",\"67\",\"68\",\"94\",\"95\",\"18\",\"42\",\"43\",\"45\",\"47\",\"48\",\"49\",\"19\",\"80\",\"81\",\"82\",\"83\",\"9\",\"22\",\"23\",\"3\",\"5\"],\"id\":\"5\"}', '保存数据', '7', '127.0.0.1', '1515480564', '1515480826');
INSERT INTO `hisi_admin_log` VALUES ('253', '1', '修改管理员', 'admin/user/edituser', '{\"role_id\":\"2\",\"username\":\"niubi\",\"nick\":\"1212\",\"password\":\"\",\"email\":\"111111@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"999\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"2\",\"6\",\"10\",\"60\",\"61\",\"62\",\"63\",\"91\",\"11\",\"55\",\"56\",\"57\",\"58\",\"59\",\"12\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"13\",\"33\",\"34\",\"35\",\"36\",\"14\",\"37\",\"38\",\"39\",\"40\",\"41\",\"16\",\"78\",\"79\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"7\",\"20\",\"75\",\"76\",\"77\",\"21\",\"90\",\"70\",\"71\",\"72\",\"73\",\"74\",\"8\",\"17\",\"65\",\"66\",\"67\",\"68\",\"94\",\"95\",\"18\",\"42\",\"43\",\"45\",\"47\",\"48\",\"49\",\"19\",\"80\",\"81\",\"82\",\"83\",\"9\",\"22\",\"23\",\"3\",\"5\"],\"id\":\"5\"}', '保存数据', '3', '127.0.0.1', '1515480653', '1515480945');
INSERT INTO `hisi_admin_log` VALUES ('254', '1', '修改管理员', 'admin/user/edituser', '{\"role_id\":\"3\",\"username\":\"niubi\",\"nick\":\"1212\",\"password\":\"\",\"email\":\"111111@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"999\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"2\",\"6\",\"10\",\"60\",\"61\",\"62\",\"63\",\"91\",\"11\",\"55\",\"56\",\"57\",\"58\",\"59\",\"12\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"13\",\"33\",\"34\",\"35\",\"36\",\"14\",\"37\",\"38\",\"39\",\"40\",\"41\",\"16\",\"78\",\"79\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"7\",\"20\",\"75\",\"76\",\"77\",\"21\",\"90\",\"70\",\"71\",\"72\",\"73\",\"74\",\"8\",\"17\",\"65\",\"66\",\"67\",\"68\",\"94\",\"95\",\"18\",\"42\",\"43\",\"45\",\"47\",\"48\",\"49\",\"19\",\"80\",\"81\",\"82\",\"83\",\"9\",\"22\",\"23\",\"3\",\"5\"],\"id\":\"5\"}', '保存数据', '1', '127.0.0.1', '1515480886', '1515480886');
INSERT INTO `hisi_admin_log` VALUES ('255', '1', '修改管理员', 'admin/user/edituser', '{\"role_id\":\"2\",\"username\":\"niubi\",\"nick\":\"1212\",\"password\":\"\",\"email\":\"111111@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"999\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"202\",\"205\",\"2\",\"6\",\"14\",\"41\"],\"id\":\"5\"}', '保存数据', '1', '127.0.0.1', '1515480941', '1515480941');
INSERT INTO `hisi_admin_log` VALUES ('256', '1', '数据显示', 'admin/data/data_show', '{\"type2\":\"Engineering_Village\",\"min_typename\":\"HN\"}', '浏览数据', '1', '127.0.0.1', '1515574891', '1515574891');
INSERT INTO `hisi_admin_log` VALUES ('257', '1', '添加角色', 'admin/user/addrole', '{\"name\":\"\\u514d\\u8d39\\u6ce8\\u518c\",\"intro\":\"\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"219\",\"220\",\"2\",\"6\",\"14\",\"41\"],\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1515813045', '1515813045');
INSERT INTO `hisi_admin_log` VALUES ('258', '1', '修改菜单', 'admin/menu/edit', '{\"id\":\"41\"}', '浏览数据', '2', '127.0.0.1', '1515813054', '1515813125');
INSERT INTO `hisi_admin_log` VALUES ('259', '1', '修改角色', 'admin/user/editrole', '{\"id\":\"4\"}', '浏览数据', '5', '127.0.0.1', '1515813072', '1515813151');
INSERT INTO `hisi_admin_log` VALUES ('260', '1', '修改角色', 'admin/user/editrole', '{\"name\":\"\\u514d\\u8d39\\u6ce8\\u518c\",\"intro\":\"\\u7f51\\u7ad9\\u514d\\u8d39\\u6ce8\\u518c\\u7684\\u7528\\u6237\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"219\",\"220\",\"2\",\"6\",\"14\",\"41\"],\"id\":\"4\"}', '保存数据', '1', '127.0.0.1', '1515813091', '1515813091');
INSERT INTO `hisi_admin_log` VALUES ('261', '1', '修改菜单', 'admin/menu/edit', '{\"module\":\"admin\",\"pid\":\"6\",\"title\":\"\\u4e2a\\u4eba\\u4fe1\\u606f\\u8bbe\\u7f6e\",\"icon\":\"\",\"url\":\"admin\\/user\\/info\",\"param\":\"\",\"status\":\"1\",\"system\":\"1\",\"nav\":\"1\",\"id\":\"41\"}', '保存数据', '1', '127.0.0.1', '1515813132', '1515813132');
INSERT INTO `hisi_admin_log` VALUES ('262', '1', '修改角色', 'admin/user/editrole', '{\"name\":\"\\u514d\\u8d39\\u6ce8\\u518c\",\"intro\":\"\\u7f51\\u7ad9\\u514d\\u8d39\\u6ce8\\u518c\\u7684\\u7528\\u6237\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"219\",\"220\",\"2\",\"6\",\"41\"],\"id\":\"4\"}', '保存数据', '1', '127.0.0.1', '1515813147', '1515813147');
INSERT INTO `hisi_admin_log` VALUES ('263', '1', '添加管理员', 'admin/user/adduser', '{\"role_id\":\"4\",\"username\":\"free\",\"nick\":\"\\u514d\\u8d39\\u7528\\u6237\",\"password\":\"123456\",\"email\":\"111s@qq.com\",\"mobile\":\"18712377077\",\"expire_time\":\"999\",\"status\":\"1\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1515813258', '1515813258');
INSERT INTO `hisi_admin_log` VALUES ('264', '6', '后台首页', 'admin/index/index', '[]', '浏览数据', '3', '127.0.0.1', '1515813291', '1515827036');
INSERT INTO `hisi_admin_log` VALUES ('265', '6', '个人信息设置', 'admin/user/info', '[]', '浏览数据', '37', '127.0.0.1', '1515813296', '1515814981');
INSERT INTO `hisi_admin_log` VALUES ('266', '6', '个人信息设置', 'admin/user/info', '{\"username\":\"free\",\"nick\":\"\\u514d\\u8d39\\u7528\\u6237\",\"password\":\"\",\"email\":\"111s@qq.com\",\"mobile\":\"18712377077\",\"id\":\"\"}', '保存数据', '35', '127.0.0.1', '1515814699', '1515814987');
INSERT INTO `hisi_admin_log` VALUES ('267', '1', '修改管理员', 'admin/user/edituser', '{\"id\":\"2\"}', '浏览数据', '2', '127.0.0.1', '1515815043', '1515815049');
INSERT INTO `hisi_admin_log` VALUES ('268', '1', '修改管理员', 'admin/user/edituser', '{\"role_id\":\"3\",\"username\":\"laowu\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"\",\"email\":\"1262135552@qq.com\",\"mobile\":\"18712377078\",\"expire_time\":\"1\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"202\",\"205\",\"2\",\"6\",\"14\",\"41\"],\"id\":\"2\"}', '保存数据', '1', '127.0.0.1', '1515815046', '1515815046');
INSERT INTO `hisi_admin_log` VALUES ('269', '2', '系统管理员', 'admin/user/index', '[]', '浏览数据', '8', '127.0.0.1', '1515822737', '1515827370');
INSERT INTO `hisi_admin_log` VALUES ('270', '2', '个人信息设置', 'admin/user/info', '{\"username\":\"laowu1\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"\",\"email\":\"1262135552@qq.com\",\"mobile\":\"18712377078\",\"id\":\"\"}', '保存数据', '2', '127.0.0.1', '1515822761', '1515827467');
INSERT INTO `hisi_admin_log` VALUES ('271', '2', '个人信息设置', 'admin/user/info', '{\"username\":\"laowu\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"\",\"email\":\"1262135552@qq.com\",\"mobile\":\"18712377078\",\"id\":\"\"}', '保存数据', '2', '127.0.0.1', '1515822785', '1515827540');
INSERT INTO `hisi_admin_log` VALUES ('272', '1', '修改角色', 'admin/user/editrole', '{\"name\":\"\\u7f51\\u7ad9\\u7528\\u6237\",\"intro\":\"\\u7528\\u6237\\u767b\\u5f55\\u67e5\\u770b\\u6570\\u636e\\u4f7f\\u7528\",\"status\":\"1\",\"auth\":[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"202\",\"205\",\"2\",\"6\",\"41\"],\"id\":\"3\"}', '保存数据', '1', '127.0.0.1', '1515827431', '1515827431');
INSERT INTO `hisi_admin_log` VALUES ('273', '2', '个人信息设置', 'admin/user/info', '{\"username\":\"laowu12\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"\",\"email\":\"1262135552@qq.com\",\"mobile\":\"18712377078\",\"id\":\"\"}', '保存数据', '1', '127.0.0.1', '1515827471', '1515827471');
INSERT INTO `hisi_admin_log` VALUES ('274', '2', '个人信息设置', 'admin/user/info', '{\"username\":\"laowu22\",\"nick\":\"\\u72d7\\u5c4e\\u54e5\\u54e5\",\"password\":\"\",\"email\":\"1262135552@qq.com\",\"mobile\":\"18712377078\",\"id\":\"\"}', '保存数据', '2', '127.0.0.1', '1515827477', '1515827523');

-- ----------------------------
-- Table structure for hisi_admin_member
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_member`;
CREATE TABLE `hisi_admin_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级ID',
  `nick` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '手机号',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '可用金额',
  `frozen_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '冻结金额',
  `income` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '收入统计',
  `expend` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '开支统计',
  `exper` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '经验值',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `frozen_integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '冻结积分',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别(1男，0女)',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `last_login_ip` varchar(128) NOT NULL DEFAULT '' COMMENT '最后登陆IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间(0永久)',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0禁用，1正常)',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000002 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 会员表';

-- ----------------------------
-- Records of hisi_admin_member
-- ----------------------------
INSERT INTO `hisi_admin_member` VALUES ('1000000', '1', '', 'test', '0', '', '$2y$10$WC0mMyErW1u1JCLXDCbTIuagCceC/kKpjzvCf.cxrVKaxsrZLXrGe', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '1', '', '', '0', '0', '0', '1', '1493274686');
INSERT INTO `hisi_admin_member` VALUES ('1000001', '1', '狗屎哥哥', 'laowu', '18712377078', '1113249273@qq.com', '$2y$10$Fvwrb1U/Ccw0/z.45674Iev5E5o6OXYwqCFPZp2s6L7iTUN/PMgMu', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '1', '', '', '0', '0', '1514649600', '1', '1513670999');

-- ----------------------------
-- Table structure for hisi_admin_member_level
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_member_level`;
CREATE TABLE `hisi_admin_member_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '等级名称',
  `min_exper` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最小经验值',
  `max_exper` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大经验值',
  `discount` int(2) unsigned NOT NULL DEFAULT '100' COMMENT '折扣率(%)',
  `intro` varchar(255) NOT NULL COMMENT '等级简介',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认等级',
  `expire` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员有效期(天)',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='[系统] 会员等级';

-- ----------------------------
-- Records of hisi_admin_member_level
-- ----------------------------
INSERT INTO `hisi_admin_member_level` VALUES ('1', '注册会员', '0', '0', '100', '', '1', '0', '1', '0', '1491966814');

-- ----------------------------
-- Table structure for hisi_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_menu`;
CREATE TABLE `hisi_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID(快捷菜单专用)',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL COMMENT '模块名或插件名，插件名格式:plugins.插件名',
  `title` varchar(20) NOT NULL COMMENT '菜单标题',
  `icon` varchar(80) NOT NULL DEFAULT 'aicon ai-shezhi' COMMENT '菜单图标',
  `url` varchar(200) NOT NULL COMMENT '链接地址(模块/控制器/方法)',
  `param` varchar(200) NOT NULL DEFAULT '' COMMENT '扩展参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '打开方式(_blank,_self)',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `debug` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开发模式可见',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `nav` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否为菜单显示，1显示0不显示',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1显示，0隐藏',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 管理菜单';

-- ----------------------------
-- Records of hisi_admin_menu
-- ----------------------------
INSERT INTO `hisi_admin_menu` VALUES ('1', '0', '0', 'admin', '首页', '', 'admin/index', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('2', '0', '0', 'admin', '系统', '', 'admin/system', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('3', '0', '0', 'admin', '插件', 'aicon ai-shezhi', 'admin/plugins', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('4', '0', '1', 'admin', '快捷菜单', 'aicon ai-caidan', 'admin/quick', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('5', '0', '3', 'admin', '插件列表', 'aicon ai-mokuaiguanli', 'admin/plugins', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('6', '0', '2', 'admin', '系统功能', 'aicon ai-gongneng', 'admin/system', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('7', '0', '2', 'admin', '会员管理', 'aicon ai-huiyuanliebiao', 'admin/member', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('8', '0', '2', 'admin', '系统扩展', 'aicon ai-shezhi', 'admin/extend', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('9', '0', '2', 'admin', '开发专用', 'aicon ai-doubleleft', 'admin/develop', '', '_self', '4', '1', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('10', '0', '6', 'admin', '系统设置', 'aicon ai-icon01', 'admin/system/index', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('11', '0', '6', 'admin', '配置管理', 'aicon ai-peizhiguanli', 'admin/config/index', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('12', '0', '6', 'admin', '系统菜单', 'aicon ai-systemmenu', 'admin/menu/index', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('13', '0', '6', 'admin', '管理员角色', '', 'admin/user/role', '', '_self', '4', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('14', '0', '6', 'admin', '系统管理员', 'aicon ai-tubiao05', 'admin/user/index', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('15', '0', '6', 'admin', '系统日志', 'aicon ai-xitongrizhi-tiaoshi', 'admin/log/index', '', '_self', '6', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('16', '0', '6', 'admin', '附件管理', '', 'admin/annex/index', '', '_self', '7', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('17', '0', '8', 'admin', '模块管理', 'aicon ai-mokuaiguanli1', 'admin/module/index', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('18', '0', '8', 'admin', '插件管理', 'aicon ai-chajianguanli', 'admin/plugins/index', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('19', '0', '8', 'admin', '钩子管理', 'aicon ai-icon-test', 'admin/hook/index', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('20', '0', '7', 'admin', '会员等级', 'aicon ai-huiyuandengji', 'admin/member/level', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('21', '0', '7', 'admin', '会员列表', 'aicon ai-huiyuanliebiao', 'admin/member/index', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('22', '0', '9', 'admin', '[示例]列表模板', '', 'admin/develop/lists', '', '_self', '1', '1', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('23', '0', '9', 'admin', '[示例]编辑模板', '', 'admin/develop/edit', '', '_self', '2', '1', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('24', '0', '4', 'admin', '后台首页', '', 'admin/index/index', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('25', '0', '4', 'admin', '清空缓存', '', 'admin/index/clear', '', '_self', '2', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('26', '0', '12', 'admin', '添加菜单', '', 'admin/menu/add', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('27', '0', '12', 'admin', '修改菜单', '', 'admin/menu/edit', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('28', '0', '12', 'admin', '删除菜单', '', 'admin/menu/del', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('29', '0', '12', 'admin', '状态设置', '', 'admin/menu/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('30', '0', '12', 'admin', '排序设置', '', 'admin/menu/sort', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('31', '0', '12', 'admin', '添加快捷菜单', '', 'admin/menu/quick', '', '_self', '6', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('32', '0', '12', 'admin', '导出菜单', '', 'admin/menu/export', '', '_self', '7', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('33', '0', '13', 'admin', '添加角色', '', 'admin/user/addrole', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('34', '0', '13', 'admin', '修改角色', '', 'admin/user/editrole', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('35', '0', '13', 'admin', '删除角色', '', 'admin/user/delrole', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('36', '0', '13', 'admin', '状态设置', '', 'admin/user/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('37', '0', '14', 'admin', '添加管理员', '', 'admin/user/adduser', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('38', '0', '14', 'admin', '修改管理员', '', 'admin/user/edituser', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('39', '0', '14', 'admin', '删除管理员', '', 'admin/user/deluser', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('40', '0', '14', 'admin', '状态设置', '', 'admin/user/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('41', '0', '6', 'admin', '个人信息设置', '', 'admin/user/info', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('42', '0', '18', 'admin', '安装插件', '', 'admin/plugins/install', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('43', '0', '18', 'admin', '卸载插件', '', 'admin/plugins/uninstall', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('44', '0', '18', 'admin', '删除插件', '', 'admin/plugins/del', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('45', '0', '18', 'admin', '状态设置', '', 'admin/plugins/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('46', '0', '18', 'admin', '设计插件', '', 'admin/plugins/design', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('47', '0', '18', 'admin', '运行插件', '', 'admin/plugins/run', '', '_self', '6', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('48', '0', '18', 'admin', '更新插件', '', 'admin/plugins/update', '', '_self', '7', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('49', '0', '18', 'admin', '插件配置', '', 'admin/plugins/setting', '', '_self', '8', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('50', '0', '19', 'admin', '添加钩子', '', 'admin/hook/add', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('51', '0', '19', 'admin', '修改钩子', '', 'admin/hook/edit', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('52', '0', '19', 'admin', '删除钩子', '', 'admin/hook/del', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('53', '0', '19', 'admin', '状态设置', '', 'admin/hook/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('54', '0', '19', 'admin', '插件排序', '', 'admin/hook/sort', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('55', '0', '11', 'admin', '添加配置', '', 'admin/config/add', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('56', '0', '11', 'admin', '修改配置', '', 'admin/config/edit', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('57', '0', '11', 'admin', '删除配置', '', 'admin/config/del', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('58', '0', '11', 'admin', '状态设置', '', 'admin/config/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('59', '0', '11', 'admin', '排序设置', '', 'admin/config/sort', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('60', '0', '10', 'admin', '基础配置', '', 'admin/system/index', 'group=base', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('61', '0', '10', 'admin', '系统配置', '', 'admin/system/index', 'group=sys', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('62', '0', '10', 'admin', '上传配置', '', 'admin/system/index', 'group=upload', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('63', '0', '10', 'admin', '开发配置', '', 'admin/system/index', 'group=develop', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('64', '0', '17', 'admin', '设计模块', '', 'admin/module/design', '', '_self', '6', '1', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('65', '0', '17', 'admin', '安装模块', '', 'admin/module/install', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('66', '0', '17', 'admin', '卸载模块', '', 'admin/module/uninstall', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('67', '0', '17', 'admin', '状态设置', '', 'admin/module/status', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('68', '0', '17', 'admin', '设置默认模块', '', 'admin/module/setdefault', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('69', '0', '17', 'admin', '删除模块', '', 'admin/module/del', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('70', '0', '21', 'admin', '添加会员', '', 'admin/member/add', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('71', '0', '21', 'admin', '修改会员', '', 'admin/member/edit', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('72', '0', '21', 'admin', '删除会员', '', 'admin/member/del', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('73', '0', '21', 'admin', '状态设置', '', 'admin/member/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('74', '0', '21', 'admin', '[弹窗]会员选择', '', 'admin/member/pop', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('75', '0', '20', 'admin', '添加会员等级', '', 'admin/member/addlevel', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('76', '0', '20', 'admin', '修改会员等级', '', 'admin/member/editlevel', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('77', '0', '20', 'admin', '删除会员等级', '', 'admin/member/dellevel', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('78', '0', '16', 'admin', '附件上传', '', 'admin/annex/upload', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('79', '0', '16', 'admin', '删除附件', '', 'admin/annex/del', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('80', '0', '8', 'admin', '在线升级', 'aicon ai-iconfontshengji', 'admin/upgrade/index', '', '_self', '4', '0', '1', '1', '1', '1491352728');
INSERT INTO `hisi_admin_menu` VALUES ('81', '0', '80', 'admin', '获取升级列表', '', 'admin/upgrade/lists', '', '_self', '0', '0', '1', '1', '1', '1491353504');
INSERT INTO `hisi_admin_menu` VALUES ('82', '0', '80', 'admin', '安装升级包', '', 'admin/upgrade/install', '', '_self', '0', '0', '1', '1', '1', '1491353568');
INSERT INTO `hisi_admin_menu` VALUES ('83', '0', '80', 'admin', '下载升级包', '', 'admin/upgrade/download', '', '_self', '0', '0', '1', '1', '1', '1491395830');
INSERT INTO `hisi_admin_menu` VALUES ('84', '0', '6', 'admin', '数据库管理', 'aicon ai-shujukuguanli', 'admin/database/index', '', '_self', '8', '0', '1', '1', '1', '1491461136');
INSERT INTO `hisi_admin_menu` VALUES ('85', '0', '84', 'admin', '备份数据库', '', 'admin/database/export', '', '_self', '0', '0', '1', '1', '1', '1491461250');
INSERT INTO `hisi_admin_menu` VALUES ('86', '0', '84', 'admin', '恢复数据库', '', 'admin/database/import', '', '_self', '0', '0', '1', '1', '1', '1491461315');
INSERT INTO `hisi_admin_menu` VALUES ('87', '0', '84', 'admin', '优化数据库', '', 'admin/database/optimize', '', '_self', '0', '0', '1', '1', '1', '1491467000');
INSERT INTO `hisi_admin_menu` VALUES ('88', '0', '84', 'admin', '删除备份', '', 'admin/database/del', '', '_self', '0', '0', '1', '1', '1', '1491467058');
INSERT INTO `hisi_admin_menu` VALUES ('89', '0', '84', 'admin', '修复数据库', '', 'admin/database/repair', '', '_self', '0', '0', '1', '1', '1', '1491880879');
INSERT INTO `hisi_admin_menu` VALUES ('90', '0', '21', 'admin', '设置默认等级', '', 'admin/member/setdefault', '', '_self', '0', '0', '1', '1', '1', '1491966585');
INSERT INTO `hisi_admin_menu` VALUES ('91', '0', '10', 'admin', '数据库配置', '', 'admin/system/index', 'group=databases', '_self', '5', '0', '1', '0', '1', '1492072213');
INSERT INTO `hisi_admin_menu` VALUES ('92', '0', '17', 'admin', '模块打包', '', 'admin/module/package', '', '_self', '7', '0', '1', '1', '1', '1492134693');
INSERT INTO `hisi_admin_menu` VALUES ('93', '0', '18', 'admin', '插件打包', '', 'admin/plugins/package', '', '_self', '0', '0', '1', '1', '1', '1492134743');
INSERT INTO `hisi_admin_menu` VALUES ('94', '0', '17', 'admin', '主题管理', '', 'admin/module/theme', '', '_self', '8', '0', '1', '1', '1', '1492433470');
INSERT INTO `hisi_admin_menu` VALUES ('95', '0', '17', 'admin', '设置默认主题', '', 'admin/module/setdefaulttheme', '', '_self', '9', '0', '1', '1', '1', '1492433618');
INSERT INTO `hisi_admin_menu` VALUES ('96', '0', '17', 'admin', '删除主题', '', 'admin/module/deltheme', '', '_self', '10', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('97', '0', '6', 'admin', '语言包管理', '', 'admin/language/index', '', '_self', '11', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('98', '0', '97', 'admin', '添加语言包', '', 'admin/language/add', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('99', '0', '97', 'admin', '修改语言包', '', 'admin/language/edit', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('100', '0', '97', 'admin', '删除语言包', '', 'admin/language/del', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('101', '0', '97', 'admin', '排序设置', '', 'admin/language/sort', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('102', '0', '97', 'admin', '状态设置', '', 'admin/language/status', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('103', '0', '16', 'admin', '收藏夹图标上传', '', 'admin/annex/favicon', '', '_self', '3', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('104', '0', '17', 'admin', '导入模块', '', 'admin/module/import', '', '_self', '11', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('105', '0', '4', 'admin', '后台首页', '', 'admin/index/welcome', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('106', '0', '4', 'admin', '布局切换', '', 'admin/user/iframe', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('107', '0', '15', 'admin', '删除日志', '', 'admin/log/del', 'table=admin_log', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('108', '0', '15', 'admin', '清空日志', '', 'admin/log/clear', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('109', '0', '17', 'admin', '编辑模块', '', 'admin/module/edit', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('110', '0', '17', 'admin', '模块图标上传', '', 'admin/module/icon', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('111', '0', '18', 'admin', '导入插件', '', 'admin/plugins/import', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('112', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('113', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('114', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('115', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('116', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('117', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('118', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('119', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('120', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('121', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('122', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('123', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('124', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('125', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('126', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('127', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('128', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('129', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('130', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('131', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('132', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('133', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('134', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('135', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('136', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('137', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('138', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('139', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('140', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('141', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('142', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('143', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('144', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('145', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('146', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('147', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('148', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('149', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('150', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('151', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('152', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('153', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('154', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('155', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('156', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('157', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('158', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('159', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('160', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('161', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('162', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('163', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('164', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('165', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('166', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('167', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('168', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('169', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('170', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('171', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('172', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('173', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('174', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('175', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('176', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('177', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('178', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('179', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('180', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('181', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('182', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('183', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('184', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('185', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('186', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('187', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('188', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('189', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('190', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('191', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('192', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('193', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('194', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('195', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('196', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('197', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('198', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('199', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('200', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('201', '1', '4', 'admin', '后台首页', '', 'admin/index/index', '', '_self', '100', '0', '0', '0', '1', '1513670733');
INSERT INTO `hisi_admin_menu` VALUES ('202', '0', '1', 'admin', '数据中心', 'aicon ai-shujukuguanli', 'admin/data/index', '', '_self', '0', '0', '0', '1', '1', '1513670896');
INSERT INTO `hisi_admin_menu` VALUES ('205', '0', '202', 'admin', '中文数据库', 'aicon ai-mokuaiguanli1', 'admin/data/ch_data', '', '_self', '0', '0', '0', '1', '1', '1513672563');
INSERT INTO `hisi_admin_menu` VALUES ('207', '0', '202', 'admin', '英文数据库', 'aicon ai-chajianguanli', 'admin/data/en_data', '', '_self', '0', '0', '0', '1', '1', '1513690897');
INSERT INTO `hisi_admin_menu` VALUES ('208', '0', '202', 'admin', '医学数据库', 'aicon ai-xitonggongneng', 'admin/data/doc_data', '', '_self', '0', '0', '0', '1', '1', '1513691074');
INSERT INTO `hisi_admin_menu` VALUES ('209', '0', '202', 'admin', '法律数据库', 'aicon ai-peizhiguanli', 'admin/data/law_data', '', '_self', '0', '0', '0', '1', '1', '1513691166');
INSERT INTO `hisi_admin_menu` VALUES ('210', '0', '202', 'admin', '经济数据库', 'aicon ai-shuaxin2', 'admin/data/ec_data', '', '_self', '0', '0', '0', '1', '1', '1513691301');
INSERT INTO `hisi_admin_menu` VALUES ('212', '0', '1', 'admin', '数据录入', 'aicon ai-doubleleft', 'admin/data/add_data', '', '_self', '0', '0', '1', '1', '1', '1513819759');
INSERT INTO `hisi_admin_menu` VALUES ('213', '0', '212', 'admin', '对外数据录入', 'aicon ai-xitongrizhi-tiaoshi', 'admin/data/add_data', '', '_self', '0', '0', '1', '1', '1', '1513819829');
INSERT INTO `hisi_admin_menu` VALUES ('214', '0', '213', 'admin', '数据添加', 'aicon ai-tianjia', 'admin/data/add', '', '_self', '0', '0', '0', '0', '1', '1513825886');
INSERT INTO `hisi_admin_menu` VALUES ('215', '0', '213', 'admin', '数据添加提交', 'aicon ai-chu', 'admin/data/addyes', '', '_self', '0', '0', '0', '0', '1', '1513828079');
INSERT INTO `hisi_admin_menu` VALUES ('216', '0', '213', 'admin', '对外数据修改', 'aicon ai-peizhiguanli', 'admin/data/edit_data', '', '_self', '0', '0', '0', '0', '1', '1513844322');
INSERT INTO `hisi_admin_menu` VALUES ('217', '0', '213', 'admin', '数据删除', 'aicon ai-mokuaiguanli1', 'admin/data/deldata', '', '_self', '0', '0', '0', '0', '1', '1513905282');
INSERT INTO `hisi_admin_menu` VALUES ('218', '0', '213', 'admin', '数据显示', 'aicon ai-quanping1', 'admin/data/data_show', '', '_self', '0', '0', '1', '0', '1', '1514794983');
INSERT INTO `hisi_admin_menu` VALUES ('219', '0', '1', 'admin', 'Feed_Back', 'typcn typcn-volume-up', 'admin/data/massage', '', '_self', '0', '0', '1', '1', '1', '1514870072');
INSERT INTO `hisi_admin_menu` VALUES ('220', '0', '219', 'admin', '留言板', 'fa fa-github-alt', 'admin/data/lyb', '', '_self', '0', '0', '0', '1', '1', '1514871202');

-- ----------------------------
-- Table structure for hisi_admin_menu_lang
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_menu_lang`;
CREATE TABLE `hisi_admin_menu_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '标题',
  `lang` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '语言包',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hisi_admin_menu_lang
-- ----------------------------
INSERT INTO `hisi_admin_menu_lang` VALUES ('131', '1', '首页', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('132', '2', '系统', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('133', '3', '插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('134', '4', '快捷菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('135', '5', '插件列表', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('136', '6', '系统功能', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('137', '7', '会员管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('138', '8', '系统扩展', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('139', '9', '开发专用', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('140', '10', '系统设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('141', '11', '配置管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('142', '12', '系统菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('143', '13', '管理员角色', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('144', '14', '系统管理员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('145', '15', '系统日志', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('146', '16', '附件管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('147', '17', '模块管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('148', '18', '插件管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('149', '19', '钩子管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('150', '20', '会员等级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('151', '21', '会员列表', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('152', '22', '[示例]列表模板', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('153', '23', '[示例]编辑模板', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('154', '24', '后台首页', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('155', '25', '清空缓存', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('156', '26', '添加菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('157', '27', '修改菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('158', '28', '删除菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('159', '29', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('160', '30', '排序设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('161', '31', '添加快捷菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('162', '32', '导出菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('163', '33', '添加角色', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('164', '34', '修改角色', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('165', '35', '删除角色', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('166', '36', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('167', '37', '添加管理员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('168', '38', '修改管理员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('169', '39', '删除管理员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('170', '40', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('171', '41', '个人信息设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('172', '42', '安装插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('173', '43', '卸载插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('174', '44', '删除插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('175', '45', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('176', '46', '设计插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('177', '47', '运行插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('178', '48', '更新插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('179', '49', '插件配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('180', '50', '添加钩子', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('181', '51', '修改钩子', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('182', '52', '删除钩子', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('183', '53', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('184', '54', '插件排序', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('185', '55', '添加配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('186', '56', '修改配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('187', '57', '删除配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('188', '58', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('189', '59', '排序设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('190', '60', '基础配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('191', '61', '系统配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('192', '62', '上传配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('193', '63', '开发配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('194', '64', '设计模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('195', '65', '安装模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('196', '66', '卸载模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('197', '67', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('198', '68', '设置默认模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('199', '69', '删除模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('200', '70', '添加会员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('201', '71', '修改会员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('202', '72', '删除会员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('203', '73', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('204', '74', '[弹窗]会员选择', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('205', '75', '添加会员等级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('206', '76', '修改会员等级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('207', '77', '删除会员等级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('208', '78', '附件上传', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('209', '79', '删除附件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('210', '80', '在线升级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('211', '81', '获取升级列表', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('212', '82', '安装升级包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('213', '83', '下载升级包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('214', '84', '数据库管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('215', '85', '备份数据库', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('216', '86', '恢复数据库', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('217', '87', '优化数据库', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('218', '88', '删除备份', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('219', '89', '修复数据库', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('220', '90', '设置默认等级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('221', '91', '数据库配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('222', '92', '模块打包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('223', '93', '插件打包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('224', '94', '主题管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('225', '95', '设置默认主题', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('226', '96', '删除主题', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('227', '97', '语言包管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('228', '98', '添加语言包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('229', '99', '修改语言包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('230', '100', '删除语言包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('231', '101', '排序设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('232', '102', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('233', '103', '收藏夹图标上传', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('234', '104', '导入模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('235', '105', '欢迎页面', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('236', '106', '布局切换', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('237', '107', '删除日志', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('238', '108', '清空日志', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('239', '109', '编辑模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('240', '110', '模块图标上传', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('241', '111', '导入插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('242', '112', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('243', '113', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('244', '114', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('245', '115', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('246', '116', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('247', '117', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('248', '118', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('249', '119', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('250', '120', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('251', '121', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('252', '122', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('253', '123', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('254', '124', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('255', '125', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('256', '126', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('257', '127', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('258', '128', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('259', '129', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('260', '130', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('261', '131', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('262', '132', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('263', '133', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('264', '134', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('265', '135', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('266', '136', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('267', '137', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('268', '138', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('269', '139', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('270', '140', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('271', '141', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('272', '142', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('273', '143', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('274', '144', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('275', '145', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('276', '146', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('277', '147', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('278', '148', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('279', '149', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('280', '150', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('281', '151', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('282', '152', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('283', '153', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('284', '154', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('285', '155', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('286', '156', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('287', '157', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('288', '158', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('289', '159', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('290', '160', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('291', '161', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('292', '162', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('293', '163', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('294', '164', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('295', '165', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('296', '166', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('297', '167', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('298', '168', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('299', '169', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('300', '170', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('301', '171', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('302', '172', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('303', '173', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('304', '174', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('305', '175', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('306', '176', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('307', '177', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('308', '178', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('309', '179', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('310', '180', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('311', '181', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('312', '182', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('313', '183', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('314', '184', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('315', '185', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('316', '186', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('317', '187', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('318', '188', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('319', '189', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('320', '190', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('321', '191', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('322', '192', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('323', '193', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('324', '194', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('325', '195', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('326', '196', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('327', '197', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('328', '198', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('329', '199', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('330', '200', '预留占位', '1');

-- ----------------------------
-- Table structure for hisi_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_module`;
CREATE TABLE `hisi_admin_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统模块',
  `name` varchar(50) NOT NULL COMMENT '模块名(英文)',
  `identifier` varchar(100) NOT NULL COMMENT '模块标识(模块名(字母).开发者标识.module)',
  `title` varchar(50) NOT NULL COMMENT '模块标题',
  `intro` varchar(255) NOT NULL COMMENT '模块简介',
  `author` varchar(100) NOT NULL COMMENT '作者',
  `icon` varchar(80) NOT NULL DEFAULT 'aicon ai-mokuaiguanli' COMMENT '图标',
  `version` varchar(20) NOT NULL COMMENT '版本号',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `sort` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未安装，1未启用，2已启用',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认模块(只能有一个)',
  `config` text NOT NULL COMMENT '配置',
  `app_id` varchar(30) NOT NULL DEFAULT '0' COMMENT '应用市场ID(0本地)',
  `theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '主题模板',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='[系统] 模块';

-- ----------------------------
-- Records of hisi_admin_module
-- ----------------------------
INSERT INTO `hisi_admin_module` VALUES ('1', '1', 'admin', 'admin.hisiphp.module', '系统管理模块', '系统核心模块，用于后台各项管理功能模块及功能拓展', 'HisiPHP官方出品', '', '1.0.0', 'http://www.hisiphp.com', '0', '2', '0', '', '0', 'default', '1489998096', '1489998096');
INSERT INTO `hisi_admin_module` VALUES ('2', '1', 'index', 'index.hisiphp.module', '系统默认模块', '仅供前端插件访问和应用市场推送安装，禁止在此模块下面开发任何东西。', 'HisiPHP官方出品', '', '1.0.0', 'http://www.hisiphp.com', '0', '2', '0', '', '0', 'default', '1489998096', '1489998096');
INSERT INTO `hisi_admin_module` VALUES ('3', '1', 'install', 'install.hisiphp.module', '系统安装模块', '系统安装模块，勿动。', 'HisiPHP官方出品', '', '1.0.0', 'http://www.hisiphp.com', '0', '2', '0', '', '0', 'default', '1489998096', '1489998096');

-- ----------------------------
-- Table structure for hisi_admin_plugins
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_plugins`;
CREATE TABLE `hisi_admin_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL COMMENT '插件名称(英文)',
  `title` varchar(32) NOT NULL COMMENT '插件标题',
  `icon` varchar(64) NOT NULL COMMENT '图标',
  `intro` text NOT NULL COMMENT '插件简介',
  `author` varchar(32) NOT NULL COMMENT '作者',
  `url` varchar(255) NOT NULL COMMENT '作者主页',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `config` text NOT NULL COMMENT '插件配置',
  `app_id` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '来源(0本地)',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 插件表';

-- ----------------------------
-- Records of hisi_admin_plugins
-- ----------------------------
INSERT INTO `hisi_admin_plugins` VALUES ('1', '0', 'hisiphp', '系统基础信息', '/plugins/hisiphp/hisiphp.png', '后台首页展示系统基础信息和开发团队信息', 'HisiPHP', 'http://www.hisiphp.com', '1.0.0', 'hisiphp.hisiphp.plugins', '', '0', '1509379331', '1509379331', '0', '2');

-- ----------------------------
-- Table structure for hisi_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_role`;
CREATE TABLE `hisi_admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `intro` varchar(200) NOT NULL COMMENT '角色简介',
  `auth` text NOT NULL COMMENT '角色权限',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='[系统] 管理角色';

-- ----------------------------
-- Records of hisi_admin_role
-- ----------------------------
INSERT INTO `hisi_admin_role` VALUES ('1', '超级管理员', '拥有系统最高权限', '0', '1489411760', '0', '1');
INSERT INTO `hisi_admin_role` VALUES ('2', '系统管理员', '拥有系统管理员权限', '[\"1\",\"4\",\"25\",\"24\",\"2\",\"6\",\"10\",\"60\",\"61\",\"62\",\"63\",\"91\",\"11\",\"55\",\"56\",\"57\",\"58\",\"59\",\"12\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"13\",\"33\",\"34\",\"35\",\"36\",\"14\",\"37\",\"38\",\"39\",\"40\",\"41\",\"16\",\"78\",\"79\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"7\",\"20\",\"75\",\"76\",\"77\",\"21\",\"90\",\"70\",\"71\",\"72\",\"73\",\"74\",\"8\",\"17\",\"65\",\"66\",\"67\",\"68\",\"94\",\"95\",\"18\",\"42\",\"43\",\"45\",\"47\",\"48\",\"49\",\"19\",\"80\",\"81\",\"82\",\"83\",\"9\",\"22\",\"23\",\"3\",\"5\"]', '1489411760', '0', '1');
INSERT INTO `hisi_admin_role` VALUES ('3', '网站用户', '用户登录查看数据使用', '[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"202\",\"205\",\"2\",\"6\",\"41\"]', '1513673859', '1515827431', '1');
INSERT INTO `hisi_admin_role` VALUES ('4', '免费注册', '网站免费注册的用户', '[\"1\",\"4\",\"25\",\"24\",\"105\",\"106\",\"219\",\"220\",\"2\",\"6\",\"41\"]', '1515813045', '1515813147', '1');

-- ----------------------------
-- Table structure for hisi_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_user`;
CREATE TABLE `hisi_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL,
  `nick` varchar(50) NOT NULL COMMENT '昵称',
  `mobile` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `auth` text NOT NULL COMMENT '权限',
  `iframe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0默认，1框架',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `last_login_ip` varchar(128) NOT NULL COMMENT '最后登陆IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `expire_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='[系统] 管理用户';

-- ----------------------------
-- Records of hisi_admin_user
-- ----------------------------
INSERT INTO `hisi_admin_user` VALUES ('1', '1', 'admin', '$2y$10$gbpajS4WTRis7sKIFbOtaO4UzEROCsLGbCZSuqBMUMBvmdltoAdc6', '超级管理员', '18712377078', '1113249273@qq.com', '', '0', '1', '127.0.0.1', '1515827409', '1513670564', '1515827409', null);
INSERT INTO `hisi_admin_user` VALUES ('2', '3', 'laowu', '$2y$10$BWdMG.YMUyn3MLbV8n44i.5aeyi4a9vwiGSgteN4ynv99fWR8Tkmy', '狗屎哥哥', '18712377078', '1262135552@qq.com', '', '0', '1', '127.0.0.1', '1515827365', '1513673972', '1515827540', '2018-01-14 11:44:06');
INSERT INTO `hisi_admin_user` VALUES ('4', '3', 'wudidididid', '$2y$10$1feWxVLmd2XjasM.kXqkhuCm1USZhPKIA/MnN9MGzzFvZXrvUDqT.', '1111', '18712377078', '111@qq.com', '', '0', '1', '127.0.0.1', '1515424701', '1515424119', '1515479649', '2018-01-09 08:00:00');
INSERT INTO `hisi_admin_user` VALUES ('5', '2', 'niubi', '$2y$10$K42hMo/VqAcps.2SYcEnruJA5Vg1ag4vxEsyzjIEtXMtTZQOBsLXO', '1212', '18712377078', '111111@qq.com', '', '0', '1', '127.0.0.1', '0', '1515479850', '1515480945', '2031-09-19 14:50:44');
INSERT INTO `hisi_admin_user` VALUES ('6', '4', 'free', '$2y$10$vd/BqwxbvgQu6rN.CE/Upuj9ApcNvnjyCJt4JTteASFfr6hI3kwGq', '免费用户', '18712377077', '111s@qq.com', '', '0', '1', '127.0.0.1', '1515827034', '1515813258', '1515827034', '2020-10-08 11:14:18');

-- ----------------------------
-- Table structure for hisi_bigdata
-- ----------------------------
DROP TABLE IF EXISTS `hisi_bigdata`;
CREATE TABLE `hisi_bigdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginurl` varchar(250) DEFAULT NULL COMMENT '��¼��ַ',
  `webdoor` varchar(250) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type1` varchar(20) DEFAULT NULL COMMENT '����һ�����ݿ��ܷ���',
  `type2` varchar(20) DEFAULT NULL COMMENT 'С���֪࣬�����򷽵�',
  `min_typename` varchar(20) DEFAULT NULL COMMENT 'ÿһ��type2�����С���������',
  `del` int(2) DEFAULT '0' COMMENT 'ɾ����ť  0 ������ʾ  1Ϊɾ������',
  `type` int(6) DEFAULT '1' COMMENT '表单类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hisi_bigdata
-- ----------------------------
INSERT INTO `hisi_bigdata` VALUES ('249', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://h-s.www.engineeringvillage.com.scnu.vpn358.com/', '2017022922', '2017022922', 'en_data', 'Engineering_Village', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('248', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9155/cluster_call_form.aspx?menu_item=law&amp;EncodingName=&amp;key_word=', '151040100', '151040100', 'law_data', '北大法意', '华东科技大学', '0', '5');
INSERT INTO `hisi_bigdata` VALUES ('247', 'http://218.249.164.207:2048/login?url=http://uni.xinhuaonline.com/', 'http://uni.xinhuaonline.com/', '20070020', '1234', 'ec_data', '道琼斯', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('244', 'http://www.soopat.com/', 'http://www.soopat.com/', '747688447@qq.com', '123456', 'doc_data', '中文医学', 'SOOPAT', '0', '4');
INSERT INTO `hisi_bigdata` VALUES ('243', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.hyit.vpn358.com/', '21161200', '21161200', 'ch_data', '读秀', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('242', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.hyit.vpn358.com/', '21161100', '21161100', 'ch_data', '读秀', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('241', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.hyit.vpn358.com/', '21161000', '21161000', 'ch_data', '读秀', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('240', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://www.duxiu.com.vlib.muc.edu.cn/', '15055030', '15055030', 'ch_data', '读秀', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('239', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://www.duxiu.com.vlib.muc.edu.cn/', '15055020', '15055020', 'ch_data', '读秀', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('238', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://www.duxiu.com.vlib.muc.edu.cn/', '15055010', '15055010', 'ch_data', '读秀', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('237', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://www.duxiu.com.sdcjxy.vpn358.com:8088/', '201331070130', '201331070130', 'ch_data', '读秀', 'JS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('236', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://www.duxiu.com.sdcjxy.vpn358.com:8088/', '201331070120', '201331070120', 'ch_data', '读秀', 'JS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('235', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://www.duxiu.com.sdcjxy.vpn358.com:8088/', '201331070110', '201331070110', 'ch_data', '读秀', 'JS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('234', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.cslg.vpn358.com/', '050515310', '050515310', 'ch_data', '读秀', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('233', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.cslg.vpn358.com/', '050515210', '050515210', 'ch_data', '读秀', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('232', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.cslg.vpn358.com/', '050515110', '050515110', 'ch_data', '读秀', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('231', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070029', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('230', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070008', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('229', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070017', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('228', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070036', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('227', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070026', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('226', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070015', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('225', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070023', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('224', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070012', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('223', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070041', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('222', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070021', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('221', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070030', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('220', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2208/', 'http://218.249.164.207:2208/', '20070020', '1234', 'ch_data', '读秀', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('219', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.scnu.vpn358.com/', '2017022839', '2017022839', 'ch_data', '读秀', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('218', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.scnu.vpn358.com/', '2017022218', '2017022218', 'ch_data', '读秀', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('217', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.scnu.vpn358.com/', '2017022922', '2017022922', 'ch_data', '读秀', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('216', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.bj.cxstar.cn.cslg.vpn358.com/', '050515310', '050515310', 'ch_data', '随书光盘', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('215', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.bj.cxstar.cn.cslg.vpn358.com/', '050515210', '050515210', 'ch_data', '随书光盘', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('214', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.bj.cxstar.cn.cslg.vpn358.com/', '050515110', '050515110', 'ch_data', '随书光盘', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('210', 'http://219.140.173.152:8000/login', 'http://219.140.173.152:8000/go?id=BOOK', '2005040', '2005040', 'ch_data', '博看', 'WC', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('209', 'http://219.140.173.152:8000/login', 'http://219.140.173.152:8000/go?id=BOOK', '2005030', '2005030', 'ch_data', '博看', 'WC', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('208', 'http://219.140.173.152:8000/login', 'http://219.140.173.152:8000/go?id=BOOK', '2005020', '2005020', 'ch_data', '博看', 'WC', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('207', 'http://l.bookan.com.cn/lnlib/index.html ', 'http://l.bookan.com.cn/lnlib/index.html ', 'lnlib', '102095', 'ch_data', '博看', 'LN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('206', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://weikan.magook.com.sdcjxy.vpn358.com:8088/?org=sdcjxylib-wk', '201331070130', '201331070130', 'ch_data', '博看', 'JS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('205', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://weikan.magook.com.sdcjxy.vpn358.com:8088/?org=sdcjxylib-wk', '201331070120', '201331070120', 'ch_data', '博看', 'JS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('204', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://weikan.magook.com.sdcjxy.vpn358.com:8088/?org=sdcjxylib-wk', '201331070110', '201331070110', 'ch_data', '博看', 'JS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('203', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/65&amp;loginid=102901&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '博看', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('202', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/65&amp;loginid=101149&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '博看', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('201', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/65&amp;loginid=101007&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '博看', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('200', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/65&amp;loginid=101113&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '博看', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('199', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/65&amp;loginid=101362&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '博看', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('198', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/65&amp;loginid=101260&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '博看', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('197', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://mag.bookan.com.cn.scnu.vpn358.com/gzdxvclib/index.html', '2017022839', '2017022839', 'ch_data', '博看', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('196', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://mag.bookan.com.cn.scnu.vpn358.com/gzdxvclib/index.html', '2017022218', '2017022218', 'ch_data', '博看', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('195', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://mag.bookan.com.cn.scnu.vpn358.com/gzdxvclib/index.html', '2017022922', '2017022922', 'ch_data', '博看', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('194', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9000/session.fds?SSLHTTPSESSIONID=hMcJnWmkCM85lTw&amp;id=95', '151040110', '151040110', 'ch_data', '龙源', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('193', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9000/session.fds?SSLHTTPSESSIONID=hMcJnWmkCM85lTw&amp;id=95', '151040100', '151040100', 'ch_data', '龙源', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('192', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9000/session.fds?SSLHTTPSESSIONID=hMcJnWmkCM85lTw&amp;id=95', '151040137', '151040137', 'ch_data', '龙源', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('191', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9000/session.fds?SSLHTTPSESSIONID=hMcJnWmkCM85lTw&amp;id=95', '151040108', '151040108', 'ch_data', '龙源', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('190', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9000/session.fds?SSLHTTPSESSIONID=hMcJnWmkCM85lTw&amp;id=95', '151040109', '151040109', 'ch_data', '龙源', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('189', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://sdcjxy.vip.qikan.com.sdcjxy.vpn358.com:8088/', '201331070130', '201331070130', 'ch_data', '龙源', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('188', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://sdcjxy.vip.qikan.com.sdcjxy.vpn358.com:8088/', '201331070120', '201331070120', 'ch_data', '龙源', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('187', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://sdcjxy.vip.qikan.com.sdcjxy.vpn358.com:8088/', '201331070110', '201331070110', 'ch_data', '龙源', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('186', 'http://lnlib.vip.qikan.com/text/text.aspx', 'http://lnlib.vip.qikan.com/text/text.aspx', 'lntsg50', '123456', 'ch_data', '龙源', 'lntsg50', '0', '4');
INSERT INTO `hisi_bigdata` VALUES ('185', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.drcnet.com.cn.cslg.vpn358.com//', '050515310', '050515310', 'ch_data', '国研数据', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('184', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.drcnet.com.cn.cslg.vpn358.com//', '050515210', '050515210', 'ch_data', '国研数据', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('183', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.drcnet.com.cn.cslg.vpn358.com//', '050515110', '050515110', 'ch_data', '国研数据', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('182', 'http://login.njtc.vpn358.com/index.php?r=front/login', 'http://www.drcnet.com.cn.njtc.vpn358.com/', '20130344086', '20130344086', 'ch_data', '国研数据', 'NJ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('181', 'http://login.njtc.vpn358.com/index.php?r=front/login', 'http://www.drcnet.com.cn.njtc.vpn358.com/', '20130344103', '20130344103', 'ch_data', '国研数据', 'NJ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('180', 'http://login.njtc.vpn358.com/index.php?r=front/login', 'http://www.drcnet.com.cn.njtc.vpn358.com/', '20130344081', '20130344081', 'ch_data', '国研数据', 'NJ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('179', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.drcnet.com.cn.scnu.vpn358.com/www/integrated/', '2017022839', '2017022839', 'ch_data', '国研数据', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('178', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.drcnet.com.cn.scnu.vpn358.com/www/integrated/', '2017022218', '2017022218', 'ch_data', '国研数据', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('177', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.drcnet.com.cn.scnu.vpn358.com/www/integrated/', '2017022922', '2017022922', 'ch_data', '国研数据', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('176', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://www.sslibrary.com.hyit.vpn358.com/', '21161200', '21161200', 'ch_data', '超星数字', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('175', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://www.sslibrary.com.hyit.vpn358.com/', '21161100', '21161100', 'ch_data', '超星数字', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('174', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://www.sslibrary.com.hyit.vpn358.com/', '21161000', '21161000', 'ch_data', '超星数字', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('173', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.sslibrary.com.jsafc.vpn358.com/', '201001270120', '201001270120', 'ch_data', '超星数字', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('172', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.sslibrary.com.jsafc.vpn358.com/', '201001270210', '201001270210', 'ch_data', '超星数字', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('171', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.sslibrary.com.jsafc.vpn358.com/', '201001270110', '201001270110', 'ch_data', '超星数字', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('170', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.jsafc.vpn358.com/', '201001270120', '201001270120', 'ch_data', '超星数字', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('169', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.jsafc.vpn358.com/', '201001270210', '201001270210', 'ch_data', '超星数字', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('168', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.duxiu.com.jsafc.vpn358.com/', '201001270110', '201001270110', 'ch_data', '超星数字', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('167', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.zhizhen.com.jsafc.vpn358.com/', '201001270120', '201001270120', 'ch_data', '超星数字', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('166', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.zhizhen.com.jsafc.vpn358.com/', '201001270210', '201001270210', 'ch_data', '超星数字', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('165', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.zhizhen.com.jsafc.vpn358.com/', '201001270110', '201001270110', 'ch_data', '超星数字', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('164', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://shu.sslibrary.com.vlib.muc.edu.cn/', '15055030', '15055030', 'ch_data', '超星数字', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('163', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://shu.sslibrary.com.vlib.muc.edu.cn/', '15055020', '15055020', 'ch_data', '超星数字', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('162', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://shu.sslibrary.com.vlib.muc.edu.cn/', '15055010', '15055010', 'ch_data', '超星数字', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('161', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://ss.zhizhen.com.vlib.muc.edu.cn/', '15055030', '15055030', 'ch_data', '超星数字', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('160', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://ss.zhizhen.com.vlib.muc.edu.cn/', '15055020', '15055020', 'ch_data', '超星数字', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('159', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://ss.zhizhen.com.vlib.muc.edu.cn/', '15055010', '15055010', 'ch_data', '超星数字', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('158', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://pds.sslibrary.com.sdcjxy.vpn358.com:8088/', '201331070130', '201331070130', 'ch_data', '超星数字', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('157', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://pds.sslibrary.com.sdcjxy.vpn358.com:8088/', '201331070120', '201331070120', 'ch_data', '超星数字', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('156', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://pds.sslibrary.com.sdcjxy.vpn358.com:8088/', '201331070110', '201331070110', 'ch_data', '超星数字', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('155', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/101&amp;loginid=102901&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '超星数字', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('154', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/101&amp;loginid=101149&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '超星数字', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('153', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/101&amp;loginid=101007&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '超星数字', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('152', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/101&amp;loginid=101113&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '超星数字', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('151', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/101&amp;loginid=101362&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '超星数字', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('150', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/101&amp;loginid=101260&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '超星数字', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('149', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2378/', 'http://218.249.164.207:2378/', '20070021', '1234', 'ch_data', '超星数字', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('148', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2378/', 'http://218.249.164.207:2378/', '20070030', '1234', 'ch_data', '超星数字', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('147', 'http://218.249.164.207:2048/login?url=http://218.249.164.207:2378/', 'http://218.249.164.207:2378/', '20070020', '1234', 'ch_data', '超星数字', 'WGY', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('146', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070029', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('145', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070008', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('144', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070017', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('143', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070036', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('142', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070026', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('141', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070015', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('140', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070023', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('139', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070012', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('138', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070041', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('137', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070021', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('136', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070030', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('135', 'http://218.249.164.207:2048/login?url=http://www.sslibrary.com/', 'http://www.sslibrary.com/', '20070020', '1234', 'ch_data', '超星数字', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('134', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.sslibrary.com.scnu.vpn358.com/', '2017022839', '2017022839', 'ch_data', '超星数字', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('133', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.sslibrary.com.scnu.vpn358.com/', '2017022218', '2017022218', 'ch_data', '超星数字', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('132', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.sslibrary.com.scnu.vpn358.com/', '2017022922', '2017022922', 'ch_data', '超星数字', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('131', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9077/', '151040110', '151040110', 'ch_data', '超星数字', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('130', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9077/', '151040100', '151040100', 'ch_data', '超星数字', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('129', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9077/', '151040117', '151040117', 'ch_data', '超星数字', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('128', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9077/', '151040127', '151040127', 'ch_data', '超星数字', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('127', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9077/', '151040137', '151040137', 'ch_data', '超星数字', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('126', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9077/', '151040108', '151040108', 'ch_data', '超星数字', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('125', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9077/', '151040109', '151040109', 'ch_data', '超星数字', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('124', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://qikan.cqvip.com.jsafc.vpn358.com/', '201001270120', '201001270120', 'ch_data', '维普', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('123', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://qikan.cqvip.com.jsafc.vpn358.com/', '201001270210', '201001270210', 'ch_data', '维普', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('122', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://qikan.cqvip.com.jsafc.vpn358.com/', '201001270110', '201001270110', 'ch_data', '维普', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('121', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://lib.cqvip.com.vlib.muc.edu.cn/', '15055030', '15055030', 'ch_data', '维普', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('120', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://lib.cqvip.com.vlib.muc.edu.cn/', '15055020', '15055020', 'ch_data', '维普', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('119', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://lib.cqvip.com.vlib.muc.edu.cn/', '15055010', '15055010', 'ch_data', '维普', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('118', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://qikan.cqvip.com.sdcjxy.vpn358.com:8088/', '201331070130', '201331070130', 'ch_data', '维普', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('117', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://qikan.cqvip.com.sdcjxy.vpn358.com:8088/', '201331070120', '201331070120', 'ch_data', '维普', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('116', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://qikan.cqvip.com.sdcjxy.vpn358.com:8088/', '201331070110', '201331070110', 'ch_data', '维普', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('115', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://202.195.136.17.hyit.vpn358.com/', '21161200', '21161200', 'ch_data', '维普', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('114', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://202.195.136.17.hyit.vpn358.com/', '21161100', '21161100', 'ch_data', '维普', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('113', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://202.195.136.17.hyit.vpn358.com/', '21161000', '21161000', 'ch_data', '维普', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('112', 'http://login.hebeu.vpn358.com/index.php?r=front/login', 'http://lib.cqvip.com.hebeu.vpn358.com/', '111200', '111200', 'ch_data', '维普', 'GC', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('111', 'http://login.hebeu.vpn358.com/index.php?r=front/login', 'http://lib.cqvip.com.hebeu.vpn358.com/', '130200', '130200', 'ch_data', '维普', 'GC', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('110', 'http://login.hebeu.vpn358.com/index.php?r=front/login', 'http://lib.cqvip.com.hebeu.vpn358.com/', '190000', '190000', 'ch_data', '维普', 'GC', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('109', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/6&amp;loginid=102901&amp;rdpasswd=123456', '', '', '', 'ch_data', '维普', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('108', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/6&amp;loginid=101149&amp;rdpasswd=123456', '', '', '', 'ch_data', '维普', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('107', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/6&amp;loginid=101007&amp;rdpasswd=123456', '', '', '', 'ch_data', '维普', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('106', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/6&amp;loginid=101113&amp;rdpasswd=123456', '', '', '', 'ch_data', '维普', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('105', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/6&amp;loginid=101362&amp;rdpasswd=123456', '000000', '', '', 'ch_data', '维普', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('104', 'http://sso.dglib.cn/interlibSSO/main/ReaderLogin?cmdACT=login&amp;furl=/interlibSSO/goto/6&amp;loginid=101260&amp;rdpasswd=123456', '000000', '101260', '123456', 'ch_data', '维普', 'DG', '0', '3');
INSERT INTO `hisi_bigdata` VALUES ('103', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://qikan.cqvip.com.scnu.vpn358.com/', '2017022839', '2017022839', 'ch_data', '维普', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('102', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://qikan.cqvip.com.scnu.vpn358.com/', '2017022218', '2017022218', 'ch_data', '维普', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('101', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://qikan.cqvip.com.scnu.vpn358.com/', '2017022839', '2017022839', 'ch_data', '维普', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('100', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040107', '151040107', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('99', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040076', '151040076', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('98', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040116', '151040116', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('97', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040106', '151040106', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('96', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040095', '151040095', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('95', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040075', '151040075', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('94', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040135', '151040135', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('93', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040105', '151040105', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('92', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040114', '151040114', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('91', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040104', '151040104', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('90', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040133', '151040133', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('89', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040082', '151040082', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('88', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040132', '151040132', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('87', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040122', '151040122', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('86', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040121', '151040121', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('85', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040111', '151040111', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('84', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040101', '151040101', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('83', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040080', '151040080', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('82', 'http://202.121.166.131:9000/login.fds', 'http://202.121.166.131:9017/', '151040110', '151040110', 'ch_data', '万方', 'HD', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('81', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.wanfangdata.com.cn.jsafc.vpn358.com/', '201001270120', '201001270120', 'ch_data', '万方', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('80', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.wanfangdata.com.cn.jsafc.vpn358.com/', '201001270210', '201001270210', 'ch_data', '万方', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('79', 'http://login.jsafc.vpn358.com/index.php?r=front/login', 'http://www.wanfangdata.com.cn.jsafc.vpn358.com/', '201001270110', '201001270110', 'ch_data', '万方', 'NL', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('78', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://g.wanfangdata.com.cn.vlib.muc.edu.cn/', '15055030', '15055030', 'ch_data', '万方', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('77', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://g.wanfangdata.com.cn.vlib.muc.edu.cn/', '15055020', '15055020', 'ch_data', '万方', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('76', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://g.wanfangdata.com.cn.vlib.muc.edu.cn/', '15055010', '15055010', 'ch_data', '万方', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('75', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://g.wanfangdata.com.cn.sdcjxy.vpn358.com:8088/', '201331070130', '201331070130', 'ch_data', '万方', 'JS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('74', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://g.wanfangdata.com.cn.sdcjxy.vpn358.com:8088/', '201331070120', '201331070120', 'ch_data', '万方', 'JS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('73', 'http://login.sdcjxy.vpn358.com:8088/index.php?r=front/login', 'http://g.wanfangdata.com.cn.sdcjxy.vpn358.com:8088/', '201331070110', '201331070110', 'ch_data', '万方', 'JS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('72', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://login.cslg.vpn358.com/index.php?r=front/login', '050515310', '050515310', 'ch_data', '万方', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('71', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://login.cslg.vpn358.com/index.php?r=front/login', '050515210', '050515210', 'ch_data', '万方', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('70', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://login.cslg.vpn358.com/index.php?r=front/login', '050515110', '050515110', 'ch_data', '万方', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('69', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://g.wanfangdata.com.cn.hyit.vpn358.com/', '21161200', '21161200', 'ch_data', '万方', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('68', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://g.wanfangdata.com.cn.hyit.vpn358.com/', '21161100', '21161100', 'ch_data', '万方', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('67', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://g.wanfangdata.com.cn.hyit.vpn358.com/', '21161000', '21161000', 'ch_data', '万方', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('66', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://g.wanfangdata.com.cn.scnu.vpn358.com/', '2017022839', '2017022839', 'ch_data', '万方', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('65', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://g.wanfangdata.com.cn.scnu.vpn358.com/', '2017022218', '2017022218', 'ch_data', '万方', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('64', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://g.wanfangdata.com.cn.scnu.vpn358.com/', '2017022922', '2017022922', 'ch_data', '万方', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('63', 'http://218.249.164.207:2048/login?url=http://epub.cnki.net/', 'http://epub.cnki.net/', '20070026', '1234', 'ch_data', '知网', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('62', 'http://218.249.164.207:2048/login?url=http://epub.cnki.net/', 'http://epub.cnki.net/', '20070015', '1234', 'ch_data', '知网', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('61', 'http://218.249.164.207:2048/login?url=http://epub.cnki.net/', 'http://epub.cnki.net/', '20070023', '1234', 'ch_data', '知网', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('60', 'http://218.249.164.207:2048/login?url=http://epub.cnki.net/', 'http://epub.cnki.net/', '20070012', '1234', 'ch_data', '知网', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('59', 'http://218.249.164.207:2048/login?url=http://epub.cnki.net/', 'http://epub.cnki.net/', '20070041', '1234', 'ch_data', '知网', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('58', 'http://218.249.164.207:2048/login?url=http://epub.cnki.net/', 'http://epub.cnki.net/', '20070021', '1234', 'ch_data', '知网', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('57', 'http://218.249.164.207:2048/login?url=http://epub.cnki.net/', 'http://epub.cnki.net/', '20070030', '1234', 'ch_data', '知网', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('56', 'http://218.249.164.207:2048/login?url=http://epub.cnki.net/', 'http://epub.cnki.net/', '20070020', '1234', 'ch_data', '知网', 'BJ', '0', '2');
INSERT INTO `hisi_bigdata` VALUES ('52', 'http://login.njxzc.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.njxzc.vpn358.com/', '14530310', '14530310', 'ch_data', '知网', 'XZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('51', 'http://login.njxzc.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.njxzc.vpn358.com/', '14530210', '14530210', 'ch_data', '知网', 'XZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('50', 'http://login.njxzc.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.njxzc.vpn358.com/', '14530110', '14530110', 'ch_data', '知网', 'XZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('49', 'http://login.njtc.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.njtc.vpn358.com/', '20141535006', '20141535006', 'ch_data', '知网', 'NJ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('48', 'http://login.njtc.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.njtc.vpn358.com/', '20141535032', '20141535032', 'ch_data', '知网', 'NJ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('47', 'http://login.njtc.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.njtc.vpn358.com/', '20141535020', '20141535020', 'ch_data', '知网', 'NJ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('46', 'http://login.hebeu.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.hebeu.vpn358.com/', '111200', '111200', 'ch_data', '知网', 'GC', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('45', 'http://login.hebeu.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.hebeu.vpn358.com/', '130200', '130200', 'ch_data', '知网', 'GC', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('44', 'http://login.hebeu.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.hebeu.vpn358.com/', '190000', '190000', 'ch_data', '知网', 'GC', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('43', 'http://www.lib-ycfw.xatu.edu.cn/index.php?r=front/login', 'http://www.cnki.net.lib-ycfw.xatu.edu.cn/', '140121201', '140121201', 'ch_data', '知网', 'XA', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('42', 'http://www.lib-ycfw.xatu.edu.cn/index.php?r=front/login', 'http://www.cnki.net.lib-ycfw.xatu.edu.cn/', '140121101', '140121101', 'ch_data', '知网', 'XA', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('41', 'http://www.lib-ycfw.xatu.edu.cn/index.php?r=front/login', 'http://www.cnki.net.lib-ycfw.xatu.edu.cn/', '140121710', '140121710', 'ch_data', '知网', 'XA', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('40', 'http://login.pro.wxcu.edu.cn:81/index.php?r=front/login', 'http://www.cnki.net.pro.wxcu.edu.cn:81/', '1170109101', '1170109101', 'ch_data', '知网', 'WX', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('39', 'http://login.pro.wxcu.edu.cn:81/index.php?r=front/login', 'http://www.cnki.net.pro.wxcu.edu.cn:81/', '1170109120', '1170109120', 'ch_data', '知网', 'WX', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('38', 'http://login.pro.wxcu.edu.cn:81/index.php?r=front/login', 'http://www.cnki.net.pro.wxcu.edu.cn:81/', '1170109110', '1170109110', 'ch_data', '知网', 'WX', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('37', 'http://login.yctc.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.yctc.vpn358.com/', '17313310', '17313310', 'ch_data', '知网', 'YC', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('36', 'http://login.yctc.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.yctc.vpn358.com/', '17313210', '17313210', 'ch_data', '知网', 'YC', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('35', 'http://login.yctc.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.yctc.vpn358.com/', '17313110', '17313110', 'ch_data', '知网', 'YC', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('34', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.scnu.vpn358.com/', '2017022839', '2017022839', 'ch_data', '知网', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('33', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.scnu.vpn358.com/', '2017022218', '2017022218', 'ch_data', '知网', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('32', 'http://login.scnu.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.scnu.vpn358.com/', '2017022922', '2017022922', 'ch_data', '知网', 'HN', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('31', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.cslg.vpn358.com/', '050515310', '050515310', 'ch_data', '知网', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('30', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.cslg.vpn358.com/', '050515210', '050515210', 'ch_data', '知网', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('29', 'http://login.cslg.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.cslg.vpn358.com/', '050515110', '050515110', 'ch_data', '知网', 'CS', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('28', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.hyit.vpn358.com/', '21161200', '21161200', 'ch_data', '知网', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('27', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.hyit.vpn358.com/', '21161100', '21161100', 'ch_data', '知网', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('26', 'http://login.hyit.vpn358.com/index.php?r=front/login', 'http://www.cnki.net.hyit.vpn358.com/', '21161000', '21161000', 'ch_data', '知网', 'HY', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('19', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://www.cnki.net.vlib.muc.edu.cn/', '15055030', '15055030', 'ch_data', '知网', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('17', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://www.cnki.net.vlib.muc.edu.cn/', '15055020', '15055020', 'ch_data', '知网', 'MZ', '0', '1');
INSERT INTO `hisi_bigdata` VALUES ('16', 'http://login.vlib.muc.edu.cn/index.php?r=front/login', 'http://www.cnki.net.vlib.muc.edu.cn/', '15055010', '15055010', 'ch_data', '知网', 'MZ', '0', '1');

-- ----------------------------
-- Table structure for hisi_bigdata1
-- ----------------------------
DROP TABLE IF EXISTS `hisi_bigdata1`;
CREATE TABLE `hisi_bigdata1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webdoor` varchar(250) DEFAULT NULL COMMENT '网站入口',
  `loginurl` varchar(250) DEFAULT NULL COMMENT '登录地址',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type1` varchar(20) DEFAULT NULL COMMENT '分类一：数据库总分类',
  `type2` varchar(20) DEFAULT NULL COMMENT '小分类，知乎，万方等',
  `min_typename` varchar(20) DEFAULT NULL COMMENT '每一个type2下面的小分类的名称',
  `del` int(2) DEFAULT '0' COMMENT '删除按钮  0 正常显示  1为删除数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hisi_bigdata1
-- ----------------------------
INSERT INTO `hisi_bigdata1` VALUES ('1', null, 'https://www.kancloud.cn/manual/thinkphp5/135176', 'l1132111', '18712377078', 'ch_data', 'zhihu', 'DX', '0');
INSERT INTO `hisi_bigdata1` VALUES ('4', null, 'https://gitee.com/swoole/swoole/tree/v1.9.22', 'wudi1', '123456', 'ch_data', 'asd', 'eeee', '0');
INSERT INTO `hisi_bigdata1` VALUES ('5', null, 'https://gitee.com/swoole/swoole/tree/v1.9.22', 'asdsad', 'asdadas', 'en_data', 'asdasdsa', 'sadasdas', '0');
INSERT INTO `hisi_bigdata1` VALUES ('8', null, 'asdadasdqw', 'qweqweqweq', 'qweqeqeqweq', 'ec_data', 'qweqweqweq', 'qweqweqeqweq', '0');
INSERT INTO `hisi_bigdata1` VALUES ('9', null, 'asdasdqwewq', 'qweqeqw', 'eqeqw', 'law_data', 'ewqeqeq', 'weqeqe', '0');
INSERT INTO `hisi_bigdata1` VALUES ('14', null, 'qw', 'qwe', 'qwe', 'ch_data', 'qwe', 'qwe', '0');
INSERT INTO `hisi_bigdata1` VALUES ('11', null, 'https://gitee.com/swoole/swoole/tree/v1.9.22', 'asdad1', 'asdasdad', 'ch_data', 'asdadasd', 'asdsadad', '0');
INSERT INTO `hisi_bigdata1` VALUES ('13', null, 'ndiasd', 'asdasdm', 'asdmakdam', 'en_data', 'asdajskda', '9idasdia9', '0');
