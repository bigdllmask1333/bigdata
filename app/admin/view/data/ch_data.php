<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>中文数据库</title>
    <link type="text/css" href="{php}echo config('statics');{/php}css/sdcms.css" rel="stylesheet">
    <link type="text/css" href="{php}echo config('statics');{/php}css/index.css" rel="stylesheet">
    <link type="text/css" href="{php}echo config('statics');{/php}css/style.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="zone"></div>

    <div id="maincolumn">
        <div id="broadcast">
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