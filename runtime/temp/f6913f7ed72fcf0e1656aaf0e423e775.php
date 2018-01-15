<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:50:"D:\wamp\www\wdata/app/admin\view\data\law_data.php";i:1514876893;s:43:"D:\wamp\www\wdata/app/admin\view\layout.php";i:1510139904;s:49:"D:\wamp\www\wdata/app/admin\view\block\header.php";i:1510139904;s:49:"D:\wamp\www\wdata/app/admin\view\block\footer.php";i:1514879062;}*/ ?>
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
    <title>法律数据库</title>
    <link type="text/css" href="<?php echo config('statics'); ?>css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/index.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/style.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="zone"></div>


<!--    <div id="leftcolumn">-->
<!--        <div class="module-coursemenu icon">-->
<!--            <h3>资源类型</h3>-->
<!--            <ul class="menu" id="faqmenu">-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=61"><span>中文数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=63"><span>英文数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=64"><span>法律数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=65"><span>经济金融库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=66"><span>医学数据库</span></a></li>-->
<!--            </ul>-->
<!--        </div>-->
<!--    </div>-->

    <div id="maincolumn">
        <div id="broadcast">



<!--            <div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">北大法意</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=695" target="_blank"> 北大法律&lt;华东科技大学&gt;</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=274" target="_blank"> 北大法意入口2</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=273" target="_blank"> 北大法意1（推荐入口）</a> </span>-->
<!---->
<!---->
<!---->
<!--                </div>-->
<!--            </div><div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">律商网</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=119&amp;id=698" target="_blank"> 律商网&lt;华东政法大学&gt;</a> </span>-->
<!---->
<!---->
<!---->
<!--                </div>-->
<!--            </div>-->


            <?php if(is_array($datalist) || $datalist instanceof \think\Collection || $datalist instanceof \think\Paginator): $i = 0; $__LIST__ = $datalist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp"><?php echo $vo[0]['type2']; ?></span></div>
                <div class="new-rec-soft new tool-links">
                    <?php if(is_array($vo) || $vo instanceof \think\Collection || $vo instanceof \think\Paginator): $i = 0; $__LIST__ = $vo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($i % 2 );++$i;?>
                    <span> <a href="<?php echo url('data/data_show', ['type2' => $vos['type2'],'min_typename' => $vos['min_typename']]); ?>" > <?php echo $vos['type2']; ?>【<?php echo $vos['min_typename']; ?>】</a> </span>
                    <!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?type2=<?php echo $vos['type2']; ?>&min_typename=<?php echo $vos['min_typename']; ?>" target="_blank"> <?php echo $vos['type2']; ?>【<?php echo $vos['min_typename']; ?>】</a> </span>-->
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
            <?php endforeach; endif; else: echo "" ;endif; ?>




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
    <title>法律数据库</title>
    <link type="text/css" href="<?php echo config('statics'); ?>css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/index.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/style.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="zone"></div>


<!--    <div id="leftcolumn">-->
<!--        <div class="module-coursemenu icon">-->
<!--            <h3>资源类型</h3>-->
<!--            <ul class="menu" id="faqmenu">-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=61"><span>中文数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=63"><span>英文数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=64"><span>法律数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=65"><span>经济金融库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=66"><span>医学数据库</span></a></li>-->
<!--            </ul>-->
<!--        </div>-->
<!--    </div>-->

    <div id="maincolumn">
        <div id="broadcast">



<!--            <div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">北大法意</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=695" target="_blank"> 北大法律&lt;华东科技大学&gt;</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=274" target="_blank"> 北大法意入口2</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=273" target="_blank"> 北大法意1（推荐入口）</a> </span>-->
<!---->
<!---->
<!---->
<!--                </div>-->
<!--            </div><div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">律商网</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=119&amp;id=698" target="_blank"> 律商网&lt;华东政法大学&gt;</a> </span>-->
<!---->
<!---->
<!---->
<!--                </div>-->
<!--            </div>-->


            <?php if(is_array($datalist) || $datalist instanceof \think\Collection || $datalist instanceof \think\Paginator): $i = 0; $__LIST__ = $datalist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp"><?php echo $vo[0]['type2']; ?></span></div>
                <div class="new-rec-soft new tool-links">
                    <?php if(is_array($vo) || $vo instanceof \think\Collection || $vo instanceof \think\Paginator): $i = 0; $__LIST__ = $vo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($i % 2 );++$i;?>
                    <span> <a href="<?php echo url('data/data_show', ['type2' => $vos['type2'],'min_typename' => $vos['min_typename']]); ?>" > <?php echo $vos['type2']; ?>【<?php echo $vos['min_typename']; ?>】</a> </span>
                    <!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?type2=<?php echo $vos['type2']; ?>&min_typename=<?php echo $vos['min_typename']; ?>" target="_blank"> <?php echo $vos['type2']; ?>【<?php echo $vos['min_typename']; ?>】</a> </span>-->
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
            <?php endforeach; endif; else: echo "" ;endif; ?>




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
    <title>法律数据库</title>
    <link type="text/css" href="<?php echo config('statics'); ?>css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/index.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/style.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="zone"></div>


<!--    <div id="leftcolumn">-->
<!--        <div class="module-coursemenu icon">-->
<!--            <h3>资源类型</h3>-->
<!--            <ul class="menu" id="faqmenu">-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=61"><span>中文数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=63"><span>英文数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=64"><span>法律数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=65"><span>经济金融库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=66"><span>医学数据库</span></a></li>-->
<!--            </ul>-->
<!--        </div>-->
<!--    </div>-->

    <div id="maincolumn">
        <div id="broadcast">



<!--            <div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">北大法意</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=695" target="_blank"> 北大法律&lt;华东科技大学&gt;</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=274" target="_blank"> 北大法意入口2</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=273" target="_blank"> 北大法意1（推荐入口）</a> </span>-->
<!---->
<!---->
<!---->
<!--                </div>-->
<!--            </div><div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">律商网</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=119&amp;id=698" target="_blank"> 律商网&lt;华东政法大学&gt;</a> </span>-->
<!---->
<!---->
<!---->
<!--                </div>-->
<!--            </div>-->


            <?php if(is_array($datalist) || $datalist instanceof \think\Collection || $datalist instanceof \think\Paginator): $i = 0; $__LIST__ = $datalist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp"><?php echo $vo[0]['type2']; ?></span></div>
                <div class="new-rec-soft new tool-links">
                    <?php if(is_array($vo) || $vo instanceof \think\Collection || $vo instanceof \think\Paginator): $i = 0; $__LIST__ = $vo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($i % 2 );++$i;?>
                    <span> <a href="<?php echo url('data/data_show', ['type2' => $vos['type2'],'min_typename' => $vos['min_typename']]); ?>" > <?php echo $vos['type2']; ?>【<?php echo $vos['min_typename']; ?>】</a> </span>
                    <!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?type2=<?php echo $vos['type2']; ?>&min_typename=<?php echo $vos['min_typename']; ?>" target="_blank"> <?php echo $vos['type2']; ?>【<?php echo $vos['min_typename']; ?>】</a> </span>-->
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
            <?php endforeach; endif; else: echo "" ;endif; ?>




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
    <title>法律数据库</title>
    <link type="text/css" href="<?php echo config('statics'); ?>css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/index.css" rel="stylesheet">
    <link type="text/css" href="<?php echo config('statics'); ?>css/style.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="zone"></div>


<!--    <div id="leftcolumn">-->
<!--        <div class="module-coursemenu icon">-->
<!--            <h3>资源类型</h3>-->
<!--            <ul class="menu" id="faqmenu">-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=61"><span>中文数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=63"><span>英文数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=64"><span>法律数据库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=65"><span>经济金融库</span></a></li>-->
<!--                <li><a href="http://www.tencentwegame.org/e/action/ListInfo/?classid=66"><span>医学数据库</span></a></li>-->
<!--            </ul>-->
<!--        </div>-->
<!--    </div>-->

    <div id="maincolumn">
        <div id="broadcast">



<!--            <div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">北大法意</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=695" target="_blank"> 北大法律&lt;华东科技大学&gt;</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=274" target="_blank"> 北大法意入口2</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=116&amp;id=273" target="_blank"> 北大法意1（推荐入口）</a> </span>-->
<!---->
<!---->
<!---->
<!--                </div>-->
<!--            </div><div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">律商网</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=119&amp;id=698" target="_blank"> 律商网&lt;华东政法大学&gt;</a> </span>-->
<!---->
<!---->
<!---->
<!--                </div>-->
<!--            </div>-->


            <?php if(is_array($datalist) || $datalist instanceof \think\Collection || $datalist instanceof \think\Paginator): $i = 0; $__LIST__ = $datalist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp"><?php echo $vo[0]['type2']; ?></span></div>
                <div class="new-rec-soft new tool-links">
                    <?php if(is_array($vo) || $vo instanceof \think\Collection || $vo instanceof \think\Paginator): $i = 0; $__LIST__ = $vo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vos): $mod = ($i % 2 );++$i;?>
                    <span> <a href="<?php echo url('data/data_show', ['type2' => $vos['type2'],'min_typename' => $vos['min_typename']]); ?>" > <?php echo $vos['type2']; ?>【<?php echo $vos['min_typename']; ?>】</a> </span>
                    <!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?type2=<?php echo $vos['type2']; ?>&min_typename=<?php echo $vos['min_typename']; ?>" target="_blank"> <?php echo $vos['type2']; ?>【<?php echo $vos['min_typename']; ?>】</a> </span>-->
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
            <?php endforeach; endif; else: echo "" ;endif; ?>




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
        <span class="fl">数据时代</span>
<!--        <span class="fl">数据时代<a href="<?php echo config('hisiphp.url'); ?>" target="_blank"><?php echo config('hisiphp.name'); ?></a> v<?php echo config('hisiphp.version'); ?></span>-->
<!--        <span class="fr"> © 2017-2018 <a href="<?php echo config('hisiphp.url'); ?>" target="_blank"><?php echo config('hisiphp.copyright'); ?></a> All Rights Reserved.</span>-->
    </div>
</div>
</body>
</html>
<?php endif; ?>