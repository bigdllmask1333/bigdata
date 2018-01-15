<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<!--类型1：需要先验证用户名密码，再点击进入-->
{if condition="($choose_type == 1)"}
<h3>使用方法：先点"步骤1"任意入口，弹出success页面，然后再点"步骤2"进入知网，如果弹出非success页面，则切换入口</h3>

<h3 id="link_list"> 步骤1.
    {volist name="choose_list" id="vo"}
        <form id="asder" name="formLogin" method="post" target="_blank" action="{$vo.loginurl}">
            <input name="username" type="hidden" value="{$vo.username}">
            <input name="password" type="hidden" value="{$vo.password}">
            <input type="submit" value="入口：{$i}">
        </form><br>
    {/volist}
</h3>
<h3>步骤2.<a href="{$webdoor}" target="_blank">点击进入{$webname}</a>
</h3>

<!--类型2：没有点击进入这一项-->
{elseif condition="($choose_type == 2)"/}
<h3>使用方法：先点任意入口，如果出现“该用户并发已满”，请换个入口；</h3>
{volist name="choose_list" id="vo"}
<form id="form-login" action="{$vo.loginurl}" method="post" target="_blank">
    <input type="hidden" value="{$vo.username}" name="user">
    <input type="hidden" value="{$vo.password}" name="pass">
    <input type="hidden" name="url" value="{$vo.webdoor}">
    <input type="submit" value="入口：{$i}">
</form>
<br>
<br>
{/volist}

<!--类型3：在表单提交的地方直接填充所有的东西-->
{elseif condition="($choose_type == 3)"/}
使用说明:
1.若显示“账号或者密码不正确”更换其他入口既可
{volist name="choose_list" id="vo"}
<form id="form-login" action="{$vo.loginurl}" method="post" target="_blank"><input type="submit" value="入口：{$i}"></form>
<br>
<br>
{/volist}



<!--类型4：给出用户名密码，需要自己手动填写-->
{elseif condition="($choose_type == 4)"/}
{volist name="choose_list" id="vo"}
<div id="headDiv">
    普通用户名：{$vo.username}  密码：{$vo.password}             <a href="{$vo.loginurl}" target="_blank"><font color="red">点击登录

        </font></a>
    {if condition="($vo.username == '747688447@qq.com')"}
    <br>使用说明：“点击登录”后选择右上角“普通用户登录”，登录后点击左上角“SooPAT首页”，然后“中国专利”搜索下载就行，“世界专利”无权限。
    {else /}
    {/if}
</div>
{/volist}



<!--类型5：类型一 的 给出用户名密码是  pass、user-->
{elseif condition="($choose_type == 5)"/}

<h3>使用方法：先点"步骤1"任意入口，弹出success页面，然后再点"步骤2"进入知网，如果弹出非success页面，则切换入口</h3>

<h3 id="link_list"> 步骤1.
    {volist name="choose_list" id="vo"}
    <form id="asder" name="formLogin" method="post" target="_blank" action="{$vo.loginurl}">
        <input name="user" type="hidden" value="{$vo.username}">
        <input name="pass" type="hidden" value="{$vo.password}">
        <input type="submit" value="入口：{$i}">
    </form><br>
    {/volist}
</h3>
<h3>步骤2.<a href="{$webdoor}" target="_blank">点击进入{$webname}</a>
</h3>


{else /}
{/if}


</body>
</html>