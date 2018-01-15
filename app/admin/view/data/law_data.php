<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>法律数据库</title>
    <link type="text/css" href="{php}echo config('statics');{/php}css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="{php}echo config('statics');{/php}css/index.css" rel="stylesheet">
    <link type="text/css" href="{php}echo config('statics');{/php}css/style.css" rel="stylesheet">
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


            {volist name="datalist" id="vo"}
            <div class="new-rec-box">
                <div class="sub-mark"><span class="mark h4 imp">{$vo[0]['type2']}</span></div>
                <div class="new-rec-soft new tool-links">
                    {volist name="$vo" id="vos"}
                    <span> <a href="{:url('data/data_show', ['type2' => $vos['type2'],'min_typename' => $vos['min_typename']])}" > {$vos['type2']}【{$vos['min_typename']}】</a> </span>
                    <!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?type2={$vos['type2']}&min_typename={$vos['min_typename']}" target="_blank"> {$vos['type2']}【{$vos['min_typename']}】</a> </span>-->
                    {/volist}
                </div>
            </div>
            {/volist}




        </div>
    </div>
</div>
</body>
</html>