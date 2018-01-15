<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:54:"D:\wamp\www\hisiphp-master/app/admin\view\data\add.php";i:1513842028;s:52:"D:\wamp\www\hisiphp-master/app/admin\view\layout.php";i:1510139904;s:58:"D:\wamp\www\hisiphp-master/app/admin\view\block\header.php";i:1510139904;s:58:"D:\wamp\www\hisiphp-master/app/admin\view\block\footer.php";i:1510139904;}*/ ?>
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
    <title>数据新增</title>
</head>
<body>

<form class="layui-form layui-form-pane" action="<?php echo url(); ?>"  method="post">
    <fieldset class="layui-elem-field layui-field-title">
        <legend>数据录入</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">大区数据库</label>
        <div class="layui-input-inline">
            <select name="type1" class="field-role_id" type="select">
                <option value="ch_data" selected="">中文数据库</option>
                <option value="en_data" >英文数据库</option>
                <option value="doc_data" >医学数据库</option>
                <option value="law_data" >法律数据库</option>
                <option value="ec_data" >经济数据库</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登录地址</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-username" name="loginurl" lay-verify="title" autocomplete="off" placeholder="请输入登录地址">
        </div>
        <div class="layui-form-mid layui-word-aux">表单操作提示</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用 户 名</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登陆密码</label>
        <div class="layui-input-inline">
            <input type="password" class="layui-input" name="password" lay-verify="password" autocomplete="off" placeholder="******">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">入口分组</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="type2" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">分组子孙</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="min_typename" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="hidden" class="field-id" name="id">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="formSubmit">提交</button>
            <a href="<?php echo url('add_data'); ?>" class="layui-btn layui-btn-primary ml10"><i class="aicon ai-fanhui"></i>返回</a>
        </div>
    </div>
</form>


<script src="/hisiphp-master/static/admin/js/footer.js"></script>


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
    <title>数据新增</title>
</head>
<body>

<form class="layui-form layui-form-pane" action="<?php echo url(); ?>"  method="post">
    <fieldset class="layui-elem-field layui-field-title">
        <legend>数据录入</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">大区数据库</label>
        <div class="layui-input-inline">
            <select name="type1" class="field-role_id" type="select">
                <option value="ch_data" selected="">中文数据库</option>
                <option value="en_data" >英文数据库</option>
                <option value="doc_data" >医学数据库</option>
                <option value="law_data" >法律数据库</option>
                <option value="ec_data" >经济数据库</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登录地址</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-username" name="loginurl" lay-verify="title" autocomplete="off" placeholder="请输入登录地址">
        </div>
        <div class="layui-form-mid layui-word-aux">表单操作提示</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用 户 名</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登陆密码</label>
        <div class="layui-input-inline">
            <input type="password" class="layui-input" name="password" lay-verify="password" autocomplete="off" placeholder="******">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">入口分组</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="type2" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">分组子孙</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="min_typename" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="hidden" class="field-id" name="id">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="formSubmit">提交</button>
            <a href="<?php echo url('add_data'); ?>" class="layui-btn layui-btn-primary ml10"><i class="aicon ai-fanhui"></i>返回</a>
        </div>
    </div>
</form>


<script src="/hisiphp-master/static/admin/js/footer.js"></script>


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
    <title>数据新增</title>
</head>
<body>

<form class="layui-form layui-form-pane" action="<?php echo url(); ?>"  method="post">
    <fieldset class="layui-elem-field layui-field-title">
        <legend>数据录入</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">大区数据库</label>
        <div class="layui-input-inline">
            <select name="type1" class="field-role_id" type="select">
                <option value="ch_data" selected="">中文数据库</option>
                <option value="en_data" >英文数据库</option>
                <option value="doc_data" >医学数据库</option>
                <option value="law_data" >法律数据库</option>
                <option value="ec_data" >经济数据库</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登录地址</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-username" name="loginurl" lay-verify="title" autocomplete="off" placeholder="请输入登录地址">
        </div>
        <div class="layui-form-mid layui-word-aux">表单操作提示</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用 户 名</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登陆密码</label>
        <div class="layui-input-inline">
            <input type="password" class="layui-input" name="password" lay-verify="password" autocomplete="off" placeholder="******">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">入口分组</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="type2" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">分组子孙</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="min_typename" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="hidden" class="field-id" name="id">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="formSubmit">提交</button>
            <a href="<?php echo url('add_data'); ?>" class="layui-btn layui-btn-primary ml10"><i class="aicon ai-fanhui"></i>返回</a>
        </div>
    </div>
</form>


<script src="/hisiphp-master/static/admin/js/footer.js"></script>


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
    <title>数据新增</title>
</head>
<body>

<form class="layui-form layui-form-pane" action="<?php echo url(); ?>"  method="post">
    <fieldset class="layui-elem-field layui-field-title">
        <legend>数据录入</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">大区数据库</label>
        <div class="layui-input-inline">
            <select name="type1" class="field-role_id" type="select">
                <option value="ch_data" selected="">中文数据库</option>
                <option value="en_data" >英文数据库</option>
                <option value="doc_data" >医学数据库</option>
                <option value="law_data" >法律数据库</option>
                <option value="ec_data" >经济数据库</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登录地址</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-username" name="loginurl" lay-verify="title" autocomplete="off" placeholder="请输入登录地址">
        </div>
        <div class="layui-form-mid layui-word-aux">表单操作提示</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用 户 名</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登陆密码</label>
        <div class="layui-input-inline">
            <input type="password" class="layui-input" name="password" lay-verify="password" autocomplete="off" placeholder="******">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">入口分组</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="type2" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">分组子孙</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick" name="min_typename" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="hidden" class="field-id" name="id">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="formSubmit">提交</button>
            <a href="<?php echo url('add_data'); ?>" class="layui-btn layui-btn-primary ml10"><i class="aicon ai-fanhui"></i>返回</a>
        </div>
    </div>
</form>


<script src="/hisiphp-master/static/admin/js/footer.js"></script>


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