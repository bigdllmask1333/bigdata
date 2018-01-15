<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:58:"D:\wamp\www\hisiphp-master/app/admin\view\data\ch_data.php";i:1513826261;s:52:"D:\wamp\www\hisiphp-master/app/admin\view\layout.php";i:1510139904;s:58:"D:\wamp\www\hisiphp-master/app/admin\view\block\header.php";i:1510139904;s:58:"D:\wamp\www\hisiphp-master/app/admin\view\block\footer.php";i:1510139904;}*/ ?>
<?php if(input('param.hisi_iframe') || cookie('hisi_iframe')): ?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $_admin_menu_current['title']; ?> -  Powered by <?php echo config('hisiphp.name'); ?></title>
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <link rel="stylesheet" href="__ADMIN_JS__/layui/css/layui.css?v=<?php echo config('hisiphp.version'); ?>">
    <link rel="stylesheet" href="__ADMIN_CSS__/style.css?v=<?php echo config('hisiphp.version'); ?>">
    <link rel="stylesheet" href="__STATIC__/fonts/typicons/min.css?v=<?php echo config('hisiphp.version'); ?>">
    <link rel="stylesheet" href="__STATIC__/fonts/font-awesome/min.css?v=<?php echo config('hisiphp.version'); ?>">
    <script src="__ADMIN_JS__/layui/layui.js?v=<?php echo config('hisiphp.version'); ?>"></script>
    <script>
        var ADMIN_PATH = "<?php echo $_SERVER['SCRIPT_NAME']; ?>", LAYUI_OFFSET = 0;
        layui.config({
            base: '__ADMIN_JS__/',
            version: '<?php echo config("hisiphp.version"); ?>'
        }).use('global');
    </script>
</head>
<body>
<div style="padding:0 10px;" class="mcolor"><?php echo runhook('system_admin_tips'); ?></div>
<?php else: ?>
<!DOCTYPE html>
<html>
<head>
    <title><?php if($_admin_menu_current['url'] == 'admin/index/index'): ?>管理控制台<?php else: ?><?php echo $_admin_menu_current['title']; endif; ?> -  Powered by <?php echo config('hisiphp.name'); ?></title>
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <link rel="stylesheet" href="__ADMIN_JS__/layui/css/layui.css?v=<?php echo config('hisiphp.version'); ?>">
    <link rel="stylesheet" href="__ADMIN_CSS__/style.css?v=<?php echo config('hisiphp.version'); ?>">
    <link rel="stylesheet" href="__STATIC__/fonts/typicons/min.css?v=<?php echo config('hisiphp.version'); ?>">
    <link rel="stylesheet" href="__STATIC__/fonts/font-awesome/min.css?v=<?php echo config('hisiphp.version'); ?>">
    <script src="__ADMIN_JS__/layui/layui.js?v=<?php echo config('hisiphp.version'); ?>"></script>
    <script>
        var ADMIN_PATH = "<?php echo $_SERVER['SCRIPT_NAME']; ?>", LAYUI_OFFSET = 60;
        layui.config({
            base: '__ADMIN_JS__/',
            version: '<?php echo config("hisiphp.version"); ?>'
        }).use('global');
    </script>
</head>
<body>
<?php 
$ca = strtolower(request()->controller().'/'.request()->action());
 ?>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="z-index:999!important;">
        <div class="fl header-logo">管理控制台</div>
        <div class="fl header-fold"><a href="javascript:;" title="打开/关闭左侧导航" class="aicon ai-caidan" id="foldSwitch"></a></div>
        <ul class="layui-nav fl nobg main-nav">
            <?php if(is_array($_admin_menu) || $_admin_menu instanceof \think\Collection || $_admin_menu instanceof \think\Paginator): $i = 0; $__LIST__ = $_admin_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if(($_admin_menu_parents['pid'] == $vo['id'] and $ca != 'plugins/run') or ($ca == 'plugins/run' and $vo['id'] == 3)): ?>
               <li class="layui-nav-item layui-this">
                <?php else: ?>
                <li class="layui-nav-item">
                <?php endif; ?> 
                <a href="javascript:;"><?php echo $vo['title']; ?></a></li>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <ul class="layui-nav fr nobg head-info">
            <li class="layui-nav-item">
                <a href="javascript:void(0);"><?php echo $admin_user['nick']; ?>&nbsp;&nbsp;</a>
                <dl class="layui-nav-child">
                    <dd><a href="<?php echo url('admin/user/info'); ?>">个人设置</a></dd>
                    <dd><a href="<?php echo url('admin/user/iframe?val=1'); ?>" class="j-ajax" refresh="yes">框架布局</a></dd>
                    <dd><a href="<?php echo url('admin/publics/logout'); ?>">退出登陆</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:void(0);"><?php echo $languages[cookie('admin_language')]['name']; ?>&nbsp;&nbsp;</a>
                <dl class="layui-nav-child">
                    <?php if(is_array($languages) || $languages instanceof \think\Collection || $languages instanceof \think\Paginator): $i = 0; $__LIST__ = $languages;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if($vo['pack']): ?>
                        <dd><a href="<?php echo url('admin/index/index'); ?>?lang=<?php echo $vo['code']; ?>"><?php echo $vo['name']; ?></a></dd>
                        <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                    <dd><a href="<?php echo url('admin/language/index'); ?>">语言包管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="__ROOT_DIR__" target="_blank">前台</a></li>
            <li class="layui-nav-item"><a href="<?php echo url('admin/index/clear'); ?>" class="j-ajax" refresh="yes">清缓存</a></li>
            <li class="layui-nav-item"><a href="javascript:void(0);" id="lockScreen">锁屏</a></li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black" id="switchNav">
        <div class="layui-side-scroll">
            <?php if(is_array($_admin_menu) || $_admin_menu instanceof \think\Collection || $_admin_menu instanceof \think\Paginator): $i = 0; $__LIST__ = $_admin_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;if(($_admin_menu_parents['pid'] == $v['id'] and $ca != 'plugins/run') or ($ca == 'plugins/run' and $v['id'] == 3)): ?>
            <ul class="layui-nav layui-nav-tree">
            <?php else: ?>
            <ul class="layui-nav layui-nav-tree" style="display:none;">
            <?php endif; if(is_array($v['childs']) || $v['childs'] instanceof \think\Collection || $v['childs'] instanceof \think\Paginator): $kk = 0; $__LIST__ = $v['childs'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vv): $mod = ($kk % 2 );++$kk;?>
                <li class="layui-nav-item <?php if($kk == 1): ?>layui-nav-itemed<?php endif; ?>">
                    <a href="javascript:;"><i class="<?php echo $vv['icon']; ?>"></i><?php echo $vv['title']; ?><span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <?php if($vv['title'] == '快捷菜单'): ?>
                            <dd><a class="admin-nav-item" href="<?php echo url('admin/index/index'); ?>"><i class="aicon ai-shouye"></i> 后台首页</a></dd>
                            <?php if(is_array($vv['childs']) || $vv['childs'] instanceof \think\Collection || $vv['childs'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vv['childs'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vvv): $mod = ($i % 2 );++$i;?>
                            <dd><a class="admin-nav-item" href="<?php echo url($vvv['url'].'?'.$vvv['param']); ?>"><i class="<?php echo $vvv['icon']; ?>"></i> <?php echo $vvv['title']; ?></a><i data-href="<?php echo url('menu/del?ids='.$vvv['id']); ?>" class="layui-icon j-del-menu">&#xe640;</i></dd>
                            <?php endforeach; endif; else: echo "" ;endif; else: if(is_array($vv['childs']) || $vv['childs'] instanceof \think\Collection || $vv['childs'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vv['childs'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vvv): $mod = ($i % 2 );++$i;?>
                            <dd><a class="admin-nav-item" href="<?php if(strpos('http', $vvv['url']) === false): ?><?php echo url($vvv['url'].'?'.$vvv['param']); else: ?><?php echo $vvv['url']; endif; ?>"><i class="<?php echo $vvv['icon']; ?>"></i> <?php echo $vvv['title']; ?></a></dd>
                            <?php endforeach; endif; else: echo "" ;endif; endif; ?>
                    </dl>
                </li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </div>
    <div class="layui-body" id="switchBody">
        <ul class="bread-crumbs">
            <?php if(is_array($_bread_crumbs) || $_bread_crumbs instanceof \think\Collection || $_bread_crumbs instanceof \think\Paginator): $i = 0; $__LIST__ = $_bread_crumbs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;if($key > 0 && $i != count($_bread_crumbs)): ?>
                    <li>></li>
                    <li><a href="<?php echo url($v['url'].'?'.$v['param']); ?>"><?php echo $v['title']; ?></a></li>
                <?php elseif($i == count($_bread_crumbs)): ?>
                    <li>></li>
                    <li><a href="javascript:void(0);"><?php echo $v['title']; ?></a></li>
                <?php else: ?>
                    <li><a href="javascript:void(0);"><?php echo $v['title']; ?></a></li>
                <?php endif; endforeach; endif; else: echo "" ;endif; ?>
            <li><a href="<?php echo url('admin/menu/quick?id='.$_admin_menu_current['id']); ?>" title="添加到首页快捷菜单" class="j-ajax">[+]</a></li>
        </ul>
        <div style="padding:0 10px;" class="mcolor"><?php echo runhook('system_admin_tips'); ?></div>
        <div class="page-body">
<?php endif; switch($tab_type): case "1": ?>
    
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <?php if(is_array($tab_data['menu']) || $tab_data['menu'] instanceof \think\Collection || $tab_data['menu'] instanceof \think\Paginator): $i = 0; $__LIST__ = $tab_data['menu'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if($vo['url'] == $_admin_menu_current['url'] or (url($vo['url']) == $tab_data['current'])): ?>
                    <li class="layui-this">
                    <?php else: ?>
                    <li>
                    <?php endif; if(substr($vo['url'], 0, 4) == 'http'): ?>
                        <a href="<?php echo $vo['url']; ?>" target="_blank"><?php echo $vo['title']; ?></a>
                    <?php else: ?>
                        <a href="<?php echo url($vo['url']); ?>"><?php echo $vo['title']; ?></a>
                    <?php endif; ?>
                    </li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
                <div class="tool-btns">
                    <a href="javascript:location.reload();" title="刷新当前页面" class="aicon ai-shuaxin2 font18"></a>
                    <a href="javascript:;" class="aicon ai-quanping1 font18" id="fullscreen-btn" title="打开/关闭全屏"></a>
                </div>
            </ul>
            <div class="layui-tab-content page-tab-content">
                <div class="layui-tab-item layui-show">
                    <!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>中文数据库</title>
    <link type="text/css" href="<?php echo config('statics'); ?>css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/index.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/style.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="zone"></div>

    <div id="maincolumn">
        <div id="broadcast">
            <div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">知网</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=784" target="_blank"> 知网【AH】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=373" target="_blank"> <font color="#FF0000">【知网专利】</font></a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=657" target="_blank"> 知网【HD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=712" target="_blank"> 知网【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=720" target="_blank"> 知网【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=719" target="_blank"> 知网【HN】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=713" target="_blank"> 知网【SL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=717" target="_blank"> 知网【YC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=718" target="_blank"> 知网【WX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=714" target="_blank"> 知网【XA】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=613" target="_blank"> 知网【GC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=722" target="_blank"> 知网【SL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=661" target="_blank"> 知网【JM】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=654" target="_blank"> 知网【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=627" target="_blank"> 知网【GX】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">维普资讯</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=651" target="_blank"> 维普【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=683" target="_blank"> 维普【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=395" target="_blank">  维普【changsx】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=693" target="_blank"> 维普【GC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=762" target="_blank"> 维普【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=710" target="_blank"> 维普【XM】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=655" target="_blank"> 维普【ZQ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=775" target="_blank"> 维普【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=650" target="_blank"> 维普【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=649" target="_blank"> 维普【DL】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">读秀资源 </span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=686" target="_blank"> 读秀【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=688" target="_blank"> 读秀【WGY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=703" target="_blank"> 读秀【WC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=398" target="_blank"> 读秀【FS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=397" target="_blank"> 读秀【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=562" target="_blank"> 读秀【LN】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=751" target="_blank"> 读秀【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=781" target="_blank"> 读秀【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=728" target="_blank"> 读秀【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=763" target="_blank"> 读秀【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=726" target="_blank"> 读秀【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">超星数字</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=687" target="_blank"> 超星【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=750" target="_blank"> 超星【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=689" target="_blank"> 超星【WGY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=777" target="_blank"> 超星【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=692" target="_blank"> 超星【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=679" target="_blank"> 超星【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=782" target="_blank"> 超星【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=771" target="_blank"> 超星视频【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=570" target="_blank"> 超星视频</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=725" target="_blank"> 超星【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">国研数据</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=408" target="_blank"> 国研【SX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=707" target="_blank"> 国研【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=747" target="_blank"> 国研【NJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=737" target="_blank"> 国研【CS】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">龙源</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=774" target="_blank"> 龙源【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=411" target="_blank"> 龙源【lntsg50】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=711" target="_blank"> 龙源【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">博看</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=415" target="_blank"> 博看【SY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=684" target="_blank"> 博看【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=709" target="_blank"> 博看【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=702" target="_blank"> 博看【WC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=575" target="_blank"> 博看【LN】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">万方</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=776" target="_blank"> 万方【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=629" target="_blank"> 万方【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=632" target="_blank"> 万方【NJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=729" target="_blank"> 万方【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=615" target="_blank"> 万方【XJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=658" target="_blank"> 万方【HD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=634" target="_blank"> 万方【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=772" target="_blank"> <font color="#FF0000">【万方专利】</font></a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=724" target="_blank"> 万方【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">其他</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=773" target="_blank"> 随书光盘【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=428" target="_blank">  哲学社会科学学术期刊</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=682" target="_blank"> 书香东莞【DG】</a> </span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
                </div>
            </div>
        </div>
    <?php break; case "2": ?>
    
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <?php if(is_array($tab_data['menu']) || $tab_data['menu'] instanceof \think\Collection || $tab_data['menu'] instanceof \think\Paginator): $k = 0; $__LIST__ = $tab_data['menu'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;if($k == 1): ?>
                    <li class="layui-this">
                    <?php else: ?>
                    <li>
                    <?php endif; ?>
                    <a href="javascript:;"><?php echo $vo['title']; ?></a>
                    </li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
                <div class="tool-btns">
                    <a href="javascript:location.reload();" title="刷新当前页面" class="aicon ai-shuaxin2 font18"></a>
                    <a href="javascript:;" class="aicon ai-quanping1 font18" id="fullscreen-btn" title="打开/关闭全屏"></a>
                </div>
            </ul>
            <div class="layui-tab-content page-tab-content">
                <!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>中文数据库</title>
    <link type="text/css" href="<?php echo config('statics'); ?>css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/index.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/style.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="zone"></div>

    <div id="maincolumn">
        <div id="broadcast">
            <div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">知网</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=784" target="_blank"> 知网【AH】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=373" target="_blank"> <font color="#FF0000">【知网专利】</font></a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=657" target="_blank"> 知网【HD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=712" target="_blank"> 知网【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=720" target="_blank"> 知网【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=719" target="_blank"> 知网【HN】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=713" target="_blank"> 知网【SL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=717" target="_blank"> 知网【YC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=718" target="_blank"> 知网【WX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=714" target="_blank"> 知网【XA】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=613" target="_blank"> 知网【GC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=722" target="_blank"> 知网【SL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=661" target="_blank"> 知网【JM】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=654" target="_blank"> 知网【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=627" target="_blank"> 知网【GX】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">维普资讯</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=651" target="_blank"> 维普【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=683" target="_blank"> 维普【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=395" target="_blank">  维普【changsx】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=693" target="_blank"> 维普【GC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=762" target="_blank"> 维普【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=710" target="_blank"> 维普【XM】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=655" target="_blank"> 维普【ZQ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=775" target="_blank"> 维普【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=650" target="_blank"> 维普【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=649" target="_blank"> 维普【DL】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">读秀资源 </span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=686" target="_blank"> 读秀【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=688" target="_blank"> 读秀【WGY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=703" target="_blank"> 读秀【WC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=398" target="_blank"> 读秀【FS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=397" target="_blank"> 读秀【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=562" target="_blank"> 读秀【LN】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=751" target="_blank"> 读秀【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=781" target="_blank"> 读秀【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=728" target="_blank"> 读秀【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=763" target="_blank"> 读秀【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=726" target="_blank"> 读秀【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">超星数字</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=687" target="_blank"> 超星【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=750" target="_blank"> 超星【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=689" target="_blank"> 超星【WGY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=777" target="_blank"> 超星【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=692" target="_blank"> 超星【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=679" target="_blank"> 超星【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=782" target="_blank"> 超星【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=771" target="_blank"> 超星视频【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=570" target="_blank"> 超星视频</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=725" target="_blank"> 超星【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">国研数据</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=408" target="_blank"> 国研【SX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=707" target="_blank"> 国研【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=747" target="_blank"> 国研【NJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=737" target="_blank"> 国研【CS】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">龙源</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=774" target="_blank"> 龙源【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=411" target="_blank"> 龙源【lntsg50】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=711" target="_blank"> 龙源【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">博看</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=415" target="_blank"> 博看【SY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=684" target="_blank"> 博看【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=709" target="_blank"> 博看【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=702" target="_blank"> 博看【WC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=575" target="_blank"> 博看【LN】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">万方</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=776" target="_blank"> 万方【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=629" target="_blank"> 万方【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=632" target="_blank"> 万方【NJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=729" target="_blank"> 万方【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=615" target="_blank"> 万方【XJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=658" target="_blank"> 万方【HD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=634" target="_blank"> 万方【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=772" target="_blank"> <font color="#FF0000">【万方专利】</font></a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=724" target="_blank"> 万方【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">其他</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=773" target="_blank"> 随书光盘【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=428" target="_blank">  哲学社会科学学术期刊</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=682" target="_blank"> 书香东莞【DG】</a> </span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
            </div>
        </div>
    <?php break; case "3": ?>
    
        <!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>中文数据库</title>
    <link type="text/css" href="<?php echo config('statics'); ?>css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/index.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/style.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="zone"></div>

    <div id="maincolumn">
        <div id="broadcast">
            <div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">知网</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=784" target="_blank"> 知网【AH】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=373" target="_blank"> <font color="#FF0000">【知网专利】</font></a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=657" target="_blank"> 知网【HD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=712" target="_blank"> 知网【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=720" target="_blank"> 知网【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=719" target="_blank"> 知网【HN】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=713" target="_blank"> 知网【SL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=717" target="_blank"> 知网【YC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=718" target="_blank"> 知网【WX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=714" target="_blank"> 知网【XA】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=613" target="_blank"> 知网【GC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=722" target="_blank"> 知网【SL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=661" target="_blank"> 知网【JM】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=654" target="_blank"> 知网【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=627" target="_blank"> 知网【GX】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">维普资讯</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=651" target="_blank"> 维普【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=683" target="_blank"> 维普【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=395" target="_blank">  维普【changsx】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=693" target="_blank"> 维普【GC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=762" target="_blank"> 维普【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=710" target="_blank"> 维普【XM】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=655" target="_blank"> 维普【ZQ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=775" target="_blank"> 维普【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=650" target="_blank"> 维普【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=649" target="_blank"> 维普【DL】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">读秀资源 </span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=686" target="_blank"> 读秀【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=688" target="_blank"> 读秀【WGY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=703" target="_blank"> 读秀【WC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=398" target="_blank"> 读秀【FS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=397" target="_blank"> 读秀【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=562" target="_blank"> 读秀【LN】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=751" target="_blank"> 读秀【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=781" target="_blank"> 读秀【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=728" target="_blank"> 读秀【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=763" target="_blank"> 读秀【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=726" target="_blank"> 读秀【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">超星数字</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=687" target="_blank"> 超星【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=750" target="_blank"> 超星【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=689" target="_blank"> 超星【WGY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=777" target="_blank"> 超星【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=692" target="_blank"> 超星【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=679" target="_blank"> 超星【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=782" target="_blank"> 超星【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=771" target="_blank"> 超星视频【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=570" target="_blank"> 超星视频</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=725" target="_blank"> 超星【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">国研数据</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=408" target="_blank"> 国研【SX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=707" target="_blank"> 国研【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=747" target="_blank"> 国研【NJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=737" target="_blank"> 国研【CS】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">龙源</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=774" target="_blank"> 龙源【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=411" target="_blank"> 龙源【lntsg50】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=711" target="_blank"> 龙源【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">博看</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=415" target="_blank"> 博看【SY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=684" target="_blank"> 博看【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=709" target="_blank"> 博看【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=702" target="_blank"> 博看【WC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=575" target="_blank"> 博看【LN】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">万方</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=776" target="_blank"> 万方【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=629" target="_blank"> 万方【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=632" target="_blank"> 万方【NJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=729" target="_blank"> 万方【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=615" target="_blank"> 万方【XJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=658" target="_blank"> 万方【HD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=634" target="_blank"> 万方【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=772" target="_blank"> <font color="#FF0000">【万方专利】</font></a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=724" target="_blank"> 万方【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">其他</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=773" target="_blank"> 随书光盘【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=428" target="_blank">  哲学社会科学学术期刊</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=682" target="_blank"> 书香东莞【DG】</a> </span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
    <?php break; default: ?>
    
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <a href="javascript:;" id="curTitle"><?php echo $_admin_menu_current['title']; ?></a>
                </li>
                <div class="tool-btns">
                    <a href="javascript:location.reload();" title="刷新当前页面" class="aicon ai-shuaxin2 font18"></a>
                    <a href="javascript:;" class="aicon ai-quanping1 font18" id="fullscreen-btn" title="打开/关闭全屏"></a>
                </div>
            </ul>
            <div class="layui-tab-content page-tab-content">
                <div class="layui-tab-item layui-show">
                    <!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>中文数据库</title>
    <link type="text/css" href="<?php echo config('statics'); ?>css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/index.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/style.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="zone"></div>

    <div id="maincolumn">
        <div id="broadcast">
            <div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">知网</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=784" target="_blank"> 知网【AH】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=373" target="_blank"> <font color="#FF0000">【知网专利】</font></a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=657" target="_blank"> 知网【HD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=712" target="_blank"> 知网【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=720" target="_blank"> 知网【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=719" target="_blank"> 知网【HN】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=713" target="_blank"> 知网【SL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=717" target="_blank"> 知网【YC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=718" target="_blank"> 知网【WX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=714" target="_blank"> 知网【XA】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=613" target="_blank"> 知网【GC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=722" target="_blank"> 知网【SL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=661" target="_blank"> 知网【JM】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=654" target="_blank"> 知网【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=62&amp;id=627" target="_blank"> 知网【GX】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">维普资讯</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=651" target="_blank"> 维普【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=683" target="_blank"> 维普【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=395" target="_blank">  维普【changsx】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=693" target="_blank"> 维普【GC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=762" target="_blank"> 维普【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=710" target="_blank"> 维普【XM】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=655" target="_blank"> 维普【ZQ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=775" target="_blank"> 维普【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=650" target="_blank"> 维普【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=68&amp;id=649" target="_blank"> 维普【DL】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">读秀资源 </span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=686" target="_blank"> 读秀【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=688" target="_blank"> 读秀【WGY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=703" target="_blank"> 读秀【WC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=398" target="_blank"> 读秀【FS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=397" target="_blank"> 读秀【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=562" target="_blank"> 读秀【LN】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=751" target="_blank"> 读秀【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=781" target="_blank"> 读秀【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=728" target="_blank"> 读秀【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=763" target="_blank"> 读秀【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=69&amp;id=726" target="_blank"> 读秀【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">超星数字</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=687" target="_blank"> 超星【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=750" target="_blank"> 超星【BJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=689" target="_blank"> 超星【WGY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=777" target="_blank"> 超星【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=692" target="_blank"> 超星【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=679" target="_blank"> 超星【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=782" target="_blank"> 超星【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=771" target="_blank"> 超星视频【HB】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=570" target="_blank"> 超星视频</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=70&amp;id=725" target="_blank"> 超星【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">国研数据</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=408" target="_blank"> 国研【SX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=707" target="_blank"> 国研【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=747" target="_blank"> 国研【NJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=71&amp;id=737" target="_blank"> 国研【CS】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">龙源</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=774" target="_blank"> 龙源【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=411" target="_blank"> 龙源【lntsg50】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=75&amp;id=711" target="_blank"> 龙源【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">博看</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=415" target="_blank"> 博看【SY】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=684" target="_blank"> 博看【DG】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=709" target="_blank"> 博看【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=702" target="_blank"> 博看【WC】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=76&amp;id=575" target="_blank"> 博看【LN】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">万方</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=776" target="_blank"> 万方【QL】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=629" target="_blank"> 万方【QD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=632" target="_blank"> 万方【NJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=729" target="_blank"> 万方【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=615" target="_blank"> 万方【XJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=658" target="_blank"> 万方【HD】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=634" target="_blank"> 万方【GX】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=772" target="_blank"> <font color="#FF0000">【万方专利】</font></a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=79&amp;id=724" target="_blank"> 万方【XM】</a> </span>
                </div>
            </div><div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">其他</span></div>
                <div class="new-rec-soft new tool-links">
                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=773" target="_blank"> 随书光盘【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=428" target="_blank">  哲学社会科学学术期刊</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=113&amp;id=682" target="_blank"> 书香东莞【DG】</a> </span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
                </div>
            </div>
        </div>
<?php endswitch; if(input('param.hisi_iframe') || cookie('hisi_iframe')): ?>
</body>
</html>
<?php else: ?>
        </div>
    </div>
    <div class="layui-footer footer">
        <span class="fl">Powered by <a href="<?php echo config('hisiphp.url'); ?>" target="_blank"><?php echo config('hisiphp.name'); ?></a> v<?php echo config('hisiphp.version'); ?></span>
        <span class="fr"> © 2017-2018 <a href="<?php echo config('hisiphp.url'); ?>" target="_blank"><?php echo config('hisiphp.copyright'); ?></a> All Rights Reserved.</span>
    </div>
</div>
</body>
</html>
<?php endif; ?>