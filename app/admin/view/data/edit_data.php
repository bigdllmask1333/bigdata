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

<form class="layui-form layui-form-pane" action="{:url()}"  method="post">
    <fieldset class="layui-elem-field layui-field-title">
        <legend>数据录入</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">大区数据库</label>
        <div class="layui-input-inline">
            <select name="type1" class="field-role_id" type="select">
                <option value="ch_data" {if condition="$data_info.type1 eq 'ch_data'"}selected=""{/if}>中文数据库</option>
                <option value="en_data" {if condition="$data_info.type1 eq 'en_data'"}selected=""{/if} >英文数据库</option>
                <option value="doc_data"  {if condition="$data_info.type1 eq 'doc_data'"}selected=""{/if}>医学数据库</option>
                <option value="law_data" {if condition="$data_info.type1 eq 'law_data'"}selected=""{/if} >法律数据库</option>
                <option value="ec_data"  {if condition="$data_info.type1 eq 'ec_data'"}selected=""{/if}>经济数据库</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">表单类型</label>
        <div class="layui-input-inline">
            <select name="type" class="field-role_id" type="select">
                <option value="1" {if condition="$data_info.type eq '1'"}selected=""{/if}>username&password</option>
                <option value="2" {if condition="$data_info.type eq '2'"}selected=""{/if} >user&pass</option>
                <option value="3"  {if condition="$data_info.type eq '3'"}selected=""{/if}>在一起</option>
                <option value="4"  {if condition="$data_info.type eq '4'"}selected=""{/if}>进去就行</option>
                <option value="5"  {if condition="$data_info.type eq '5'"}selected=""{/if}>类型一&&类型二</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">登录地址</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-username"  value="{$data_info['loginurl']}" name="loginurl" lay-verify="title" autocomplete="off" placeholder="请输入登录地址">
        </div>
        <div class="layui-form-mid layui-word-aux">表单操作提示</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">网站入口</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-username"  value="{$data_info['webdoor']}" name="webdoor" lay-verify="title" autocomplete="off" placeholder="请输入登录地址">
        </div>
        <div class="layui-form-mid layui-word-aux">表单操作提示</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用 户 名</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick"  value="{$data_info['username']}" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登陆密码</label>
        <div class="layui-input-inline">
            <input type="password" class="layui-input" name="password"  value="{$data_info['password']}"  lay-verify="password" autocomplete="off" placeholder="******">
        </div>
    </div>





    <div class="layui-form-item">
        <label class="layui-form-label">入口分组</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick"  value="{$data_info['type2']}" name="type2" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">分组子孙</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-nick"  value="{$data_info['min_typename']}" name="min_typename" lay-verify="title" autocomplete="off" placeholder="请输入用户名">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="hidden" class="field-id" name="id" value="{$data_info['id']}">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="formSubmit">提交</button>
            <a href="{:url('add_data')}" class="layui-btn layui-btn-primary ml10"><i class="aicon ai-fanhui"></i>返回</a>
        </div>
    </div>
</form>
<!--<script src="/wdata/static/admin/js/footer.js"></script>-->

</body>
</html>