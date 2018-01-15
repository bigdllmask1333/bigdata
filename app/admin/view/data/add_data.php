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
    <!--
    +----------------------------------------------------------------------
    | 列表页实例模板，Ctrl+A 可直接复制以下代码使用
    +----------------------------------------------------------------------
    -->
    <form class="page-list-form">
        <div class="page-toolbar">
            <div class="layui-btn-group fl">

<!--                <button onclick="alert(1)" class="layui-btn layui-btn-primary"><i class="aicon ai-tianjia"></i>添加</button>-->
                <a href="{:url('add')}" class="layui-btn layui-btn-primary"><i class="aicon ai-tianjia"></i>添加</a>
<!--                <a href="{:url('deldata')}" class="layui-btn layui-btn-primary j-page-btns confirm"><i class="aicon ai-jinyong"></i>删除</a>-->

            </div>
            <div class="page-filter fr">
                <form class="layui-form layui-form-pane" action="{:url()}" method="get">
                    <div class="layui-form-item">
                        <label class="layui-form-label">搜索</label>
                        <div class="layui-input-inline">
                            <input type="text" name="q" lay-verify="required" placeholder="请输入关键词搜索" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="layui-form">
            <table class="layui-table mt10" lay-even="" lay-skin="row">
                <colgroup>
                    <col width="20">
                    <col width="300">
                    <col width="250">
                    <col width="100">
                    <col width="100">
                    <col width="200">
                    <col width="100">
                    <col width="100">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th><input type="checkbox" lay-skin="primary" lay-filter="allChoose"></th>
                    <th>登录地址</th>
                    <th>网站入口</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>总分类</th>
                    <th>一级分类</th>
                    <th>二级分类</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                {volist name="datalist" id="vo"}
                <tr>
                    <td><input type="checkbox" class="layui-checkbox checkbox-ids" name="ids[]" value="{$vo['id']}" lay-skin="primary"></td>
                    <td>{$vo.loginurl}</td>
                    <td>{$vo.webdoor}</td>
                    <td>{$vo.username}</td>
                    <td>{$vo.password}</td>
                    <td>{$Think.config.bigtype[$vo.type1]}</td>
                    <td>{$vo.type2}</td>
                    <td>{$vo.min_typename}</td>
                    <td>
                        <div class="layui-btn-group">
                            <div class="layui-btn-group">
                                <a href="{:url('edit_data?id='.$vo['id'])}" class="layui-btn layui-btn-primary layui-btn-small"><i class="layui-icon"></i></a>
                                <a href="{:url('deldata?id='.$vo['id'])}" class="layui-btn layui-btn-primary layui-btn-small j-tr-del"><i class="layui-icon"></i></a>
                            </div>
                        </div>
                    </td>
                </tr>
                {/volist}

                </tbody>

            </table>
            <div style="float: left">{$page}</div>
        </div>
    </form>

    <script>

    </script>

</body>
</html>