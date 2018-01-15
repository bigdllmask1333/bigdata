<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <title>后台管理登陆</title>
    <link type="text/css" rel="stylesheet" href="__ADMIN_LOGIN__/css/default.css" />
    <!--必要样式-->
    <link type="text/css" rel="stylesheet" href="__ADMIN_LOGIN__/css/styles.css" />
    <link type="text/css" rel="stylesheet" href="__ADMIN_LOGIN__/css/demo.css" />
    <link type="text/css" rel="stylesheet" href="__ADMIN_LOGIN__/css/loaders.css" />
</head>

<body>
<div class='login'>
    <div class='login_title'>
        <span>图书馆登录</span>
    </div>
    <div class='login_fields'>
        <div class='login_fields__user'>
            <div class='icon'>
                <img alt="" src='__ADMIN_LOGIN__/img/user_icon_copy.png'>
            </div>
            <input name="username" placeholder='用户名' maxlength="16" type='text' autocomplete="off" value="" />
            <div class='validation'>
                <img alt="" src='__ADMIN_LOGIN__/img/tick.png'>
            </div>
        </div>
        <div class='login_fields__password'>
            <div class='icon'>
                <img alt="" src='__ADMIN_LOGIN__/img/lock_icon_copy.png'>
            </div>
            <input name="password" placeholder='密码' maxlength="16" type='text' autocomplete="off">
            <div class='validation'>
                <img alt="" src='__ADMIN_LOGIN__/img/tick.png'>
            </div>
        </div>
        <div class='login_fields__password'>
            <div class='icon'>
                <img alt="" src='__ADMIN_LOGIN__/img/key.png'>
            </div>
            <input name="code" placeholder='验证码' maxlength="4" type='text' name="ValidateNum" autocomplete="off">
            <div class='validation' style="opacity: 1; right: -5px;top: -3px;">
                <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
            </div>
            <div id="shauxin">{:token('__token__', 'sha1')}</div>
        </div>
        <div class='login_fields__submit'>
            <input type='button' value='登录' id="qushuaxin">
        </div>
    </div>
    <div class='success'></div>

    <div class='disclaimer'>

        <p>欢迎登陆后台管理系统 <a href="#" target="_blank" style="float:right;color:#ff1d80;font-size: 12px;font-weight: 800">没有账号？免费注册</a></p>
        <br>
        <p><span href="#"  style="float:right;color:#ebff0e;font-size: 12px;font-weight: 800">账号到期无法登陆？登录免费账号:free密码:123456,到后台购买续费</span></p>

    </div>
</div>
<div class='authent'>
    <div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <p>验证登录中...</p>
</div>
<div class="OverWindows"></div>

<link type="text/css" rel="stylesheet" href="__ADMIN_LOGIN__/layui/css/layui.css" />
<script type="text/javascript" src="__ADMIN_LOGIN__/js/jquery.min.js"></script>
<script type="text/javascript" src="__ADMIN_LOGIN__/js/jquery-ui.min.js"></script>
<script type="text/javascript" src='__ADMIN_LOGIN__/js/stopExecutionOnTimeout.js?t=1'></script>
<script type="text/javascript" src="__ADMIN_LOGIN__/layui/layui.js"></script>
<script type="text/javascript" src="__ADMIN_LOGIN__/js/particleground.js"></script>
<script type="text/javascript" src="__ADMIN_LOGIN__/js/treatment.js"></script>
<script type="text/javascript" src="__ADMIN_LOGIN__/js/jquery.mockjax.js"></script>
<script type="text/javascript">





    var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
    var ajaxmockjax = 1;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
    //默认账号密码
    var trueusername = "Richer";
    var truepassword = "freedom";

    var CodeVal = 0;
    Code();
    function Code() {
        if(canGetCookie == 1){
            createCode("AdminCode");
            var AdminCode = getCookieValue("AdminCode");
            showCheck(AdminCode);
        }else{
            showCheck(createCode(""));
        }
    }
    function showCheck(a) {
        CodeVal = a;
        var c = document.getElementById("myCanvas");
        var ctx = c.getContext("2d");
        ctx.clearRect(0, 0, 1000, 1000);
        ctx.font = "80px 'Hiragino Sans GB'";
        ctx.fillStyle = "#E8DFE8";
        ctx.fillText(a, 0, 100);
    }
    $(document).keypress(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $('input[type="button"]').click();
        }
    });
    //粒子背景特效
    $('body').particleground({
        dotColor: '#E8DFE8',
        lineColor: '#133b88'
    });
    $('input[name="password"]').focus(function () {
        $(this).attr('type', 'password');
    });
    $('input[type="text"]').focus(function () {
        $(this).prev().animate({ 'opacity': '1' }, 200);
    });
    $('input[type="text"],input[type="password"]').blur(function () {
        $(this).prev().animate({ 'opacity': '.5' }, 200);
    });
    $('input[name="username"],input[name="password"]').keyup(function () {
        var Len = $(this).val().length;
        if (!$(this).val() == '' && Len >= 5) {
            $(this).next().animate({
                'opacity': '1',
                'right': '30'
            }, 200);
        } else {
            $(this).next().animate({
                'opacity': '0',
                'right': '20'
            }, 200);
        }
    });
    var open = 0;
    layui.use('layer', function () {
        // var msgalert = '默认账号:' + trueusername + '<br/> 默认密码:' + truepassword;
        // var index = layer.alert(msgalert, { icon: 6, time: 4000, offset: 't', closeBtn: 0, title: '友情提示', btn: [], anim: 2, shade: 0 });
        // layer.style(index, {
        //     color: '#777'
        // });
        //非空验证
        $('input[type="button"]').click(function () {

            // $("#shauxin").load(location.href+" #shauxin");


            var username = $('input[name="username"]').val();
            var password = $('input[name="password"]').val();
            var __token__=$('input[name="__token__"]').val();
            var code = $('input[name="code"]').val();


            if (username == '') {
                ErroAlert('请输入您的账号');
            } else if (password == '') {
                ErroAlert('请输入密码');
            } else if (code == '' || code.length != 4) {
                ErroAlert('输入验证码');
            } else {
                if(code.toUpperCase() != CodeVal.toUpperCase()){
                    layer.msg("验证码错误", function(){
                    });
                    return;
                }
                //认证中..
                fullscreen();
                $('.username').addClass('test'); //倾斜特效
                setTimeout(function () {
                    $('.username').addClass('testtwo'); //平移特效
                }, 300);
                setTimeout(function () {
                    $('.authent').show().animate({ right: -320 }, {
                        easing: 'easeOutQuint',
                        duration: 600,
                        queue: false
                    });
                    $('.authent').animate({ opacity: 1 }, {
                        duration: 200,
                        queue: false
                    }).addClass('visible');
                }, 500);

                //登陆
                var JsonData = { username: username, password: password, code: code ,__token__:__token__};
                //此处做为ajax内部判断
                var url = "";
                // if(JsonData.username == trueusername && JsonData.password == truepassword && JsonData.code.toUpperCase() == CodeVal.toUpperCase()){
                //     url = "Ajax/Login";
                // }else{
                //     url = "Ajax/LoginFalse";
                // }



                // console.log('koko'+url);
                // console.log('kdkd'+JsonData);
                // exit;
                // die();
                $.ajax({
                    //提交数据的类型 POST GET
                    type:"POST",
                    //提交的网址
                    // url:url,
                    url: "{:url('/admin/Publics')}", //orderModifyStatus
                    //提交的数据
                    data:JsonData,
                    dataType:"json",
                    async:false,
                    cache:false,
                    success:function (data) {
                        console.log(data);
                        //ajax返回
                        //认证完成
                        setTimeout(function () {
                            $('.authent').show().animate({ right: 90 }, {
                                easing: 'easeOutQuint',
                                duration: 600,
                                queue: false
                            });
                            $('.authent').animate({ opacity: 0 }, {
                                duration: 200,
                                queue: false
                            }).addClass('visible');
                            $('.username').removeClass('testtwo'); //平移特效
                        }, 2000);
                        setTimeout(function () {
                            $('.authent').hide();
                            $('.username').removeClass('test');
                            if (data.status == 'ok') {

                                console.log(data.status);
                                //登录成功
                                $('.username div').fadeOut(100);
                                $('.success').fadeIn(1000);
                                window.location.href="{:url('/admin/index')}";
                                // layer.msg(data.msg, function(){
                                // });
                                // $('.success').html(data.Text);
                                //跳转操作

                            } else {
                                layer.msg(data.msg, function(){
                                });
                                // AjaxErro(data);
                            }
                        }, 2400);
                    },
                    error: function(){
                        //请求出错处理
                    }
                });
            }
        })
    })
    var fullscreen = function () {
        elem = document.body;
        if (elem.webkitRequestFullScreen) {
            elem.webkitRequestFullScreen();
        } else if (elem.mozRequestFullScreen) {
            elem.mozRequestFullScreen();
        } else if (elem.requestFullScreen) {
            elem.requestFullscreen();
        } else {
            //浏览器不支持全屏API或已被禁用
        }
    }
    if(ajaxmockjax == 1){
        $.mockjax({
            url: 'Ajax/Login',
            status: 200,
            responseTime: 50,
            responseText: {"Status":"ok","Text":"登陆成功<br /><br />欢迎回来"}
        });
        $.mockjax({
            url: 'Ajax/LoginFalse',
            status: 200,
            responseTime: 50,
            responseText: {"Status":"Erro","Erro":"账号名或密码或验证码有误"}
        });
    }
</script>
</body>
</html>