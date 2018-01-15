<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>经济数据库</title>
    <link type="text/css" href="{php}echo config('statics');{/php}css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="{php}echo config('statics');{/php}css/index.css" rel="stylesheet">
    <link type="text/css" href="{php}echo config('statics');{/php}css/style.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="zone"></div>

    <div id="maincolumn">
        <div id="broadcast">

<!---->
<!---->
<!--            <div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">道琼斯财经资讯</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=74&amp;id=752" target="_blank"> 道琼斯【BJ】</a> </span>-->
<!---->
<!--                </div>-->
<!--            </div><div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">人大复印</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=126&amp;id=685" target="_blank"> 人大复印&lt;东莞&gt;</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=126&amp;id=708" target="_blank"> 人大复印&lt;青岛&gt;</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=126&amp;id=486" target="_blank">  人大复印入口二</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=126&amp;id=745" target="_blank"> 人大复印【NJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=126&amp;id=736" target="_blank"> 人大复印【CS】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=126&amp;id=723" target="_blank"> 人大复印【TJ】</a> </span>      <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=126&amp;id=697" target="_blank"> 人大复印&lt;华东政法大学&gt;</a> </span>-->
<!---->
<!---->
<!---->
<!--                </div>-->
<!--            </div><div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">锐思金融</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=127&amp;id=696" target="_blank"> 瑞思金融&lt;华东政法大学&gt;</a> </span>-->
<!---->
<!---->
<!---->
<!--                </div>-->
<!--            </div><div class="new-rec-box">-->
<!--                <div class="sub-mark"><span class="mark h4 imp">巨灵金融</span></div>-->
<!--                <div class="new-rec-soft new tool-links">-->
<!--                    <span> <a href="http://www.tencentwegame.org/e/action/ShowInfo.php?classid=128&amp;id=492" target="_blank">  巨灵金融服务平台</a> </span>-->
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