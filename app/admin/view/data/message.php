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
<div class="container-fluid">
    <include file="Public/head" liu='active'/>
    <!-- <p class="bg-warning msgs">...</p> -->
    <div class="left_kuang">
        <div class="left_main">
            <div class="min-title"	>
            </div>
            <div id="cyReward" role="cylabs" data-use="reward"></div>
            <div id="SOHUCS" sid="123"></div>
            <script type="text/javascript" charset="utf-8" src="https://changyan.itc.cn/js/lib/jquery.js"></script>
            <script type="text/javascript" charset="utf-8" src="https://changyan.sohu.com/js/changyan.labs.https.js?appid=cyt1GVIeW"></script>
            <script charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/changyan.js" ></script>
            <script type="text/javascript">
                window.changyan.api.config({
                    appid: 'cyt1GVIeW',
                    conf: 'prod_a05b1115e27c6e3da36c9124cfd5cf4b'
                });
            </script>
            <!-- 	<iframe src="http://cssnb.com/iframe/unicode/encode.html" style="width: 100%;height:430px;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe> -->
        </div>
    </div>
    <include file="Public/right_box" more='active'/>
    <include file="Public/button" more='active'/>
</div>
</body>
</html>