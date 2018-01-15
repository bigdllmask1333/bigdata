<div class="fl" style="width:49%">
    <table class="layui-table" lay-skin="line">
        <colgroup>
            <col width="160">
            <col>
        </colgroup>
        <thead>
            <tr>
                <th colspan="2">平台介绍</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2" style="font-size: large;line-height: 30px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每次写论文都在网上搜索文章是一个非常费时费力的痛苦过程。此时免费也就成为昂贵！为方便大家，本站于2010年初终于诞生，它的宗旨就是要使大家只需花极少的一点零花钱，即可享受到稳定的学术文献查询和下载服务。有缘成为我站会员的朋友再不必为写论文查文献的事发愁了。加入付费会员，节省宝贵时间!</td>
            </tr>
            <tr>
                <td colspan="2"  style="font-size:20px;line-height: 30px;background: rgba(101,94,226,0.11);">本站会员可使用哪些数据库</td>
            </tr>
            <tr>
                <td colspan="2">

                    <li>（1）中文、英文、法律、经济、医学</li>
                    <li>（2）其它中文数据库</li>
                    <li>（3）外文文献数据库应有尽有</li>
                </td>
            </tr>

            <tr>
                <td colspan="2"  style="font-size:20px;line-height: 30px;background: rgba(101,94,226,0.11);">本站性质</td>
            </tr>
            <tr>
                <td colspan="2" style="font-size: large;line-height: 30px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本站发现社会未满足之需求，并满足之，方便科研人员、促进科技发展，具有免费和公益性质；对VIP会员收取少量费用仅限维持网站正常运转之必需（维持一到两名兼职工作人员基本生活费用，也算为社会提供一两个就业岗位）。 </td>
            </tr>
            <tr>
                <td colspan="2" style="font-size:20px;line-height: 30px;background: rgba(101,94,226,0.11);">帐号的并发数</td>
            </tr>
            <tr>
                <td colspan="2"><h5>会员帐号的并发数默认是1，也就是帐号只能会员自己使用，而不能与他人分享。</h5></td>
            </tr>
        </tbody>
    </table>
</div>
<div class="fr" style="width:49%">
    <table class="layui-table" lay-skin="line">
        <colgroup>
            <col width="160">
            <col>
        </colgroup>
        <thead>
            <tr>
                <th colspan="2">网站公告</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="color: red;font-size: 26px;" id="cc0" >年底钜惠</td>
                <td style="color: #ca41ff;font-size: 20px;font-weight: 800">
                    <marquee direction=left>永久账号：5元即可开通!!!</marquee>

                </td>
            </tr>
            <tr>
                <td style="color: red;font-size: 26px;" id="cc1" >利好消息</td>
                <td style="color: #ca41ff;font-size: 20px;font-weight: 800">
                    <marquee direction=left scrollamount=20>账号推广分红系统即将上线！！！</marquee>

                </td>
            </tr>
        </tbody>
    </table>
</div>
<div class="fr" style="width:49%">
    <table class="layui-table" lay-skin="line">
        <colgroup>
            <col width="160">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th colspan="2" >账号充值: <span style="font-size: 23px;margin-left: 120px;box-shadow: deeppink">1元/天     <span style="color: red">8元/永久账号</span>      年底活动价：5元/永久账号</span></th>
        </tr>
        </thead>
    </table>
    <div  style="float: left;padding:20px;padding-left: 130px">
        <p style="text-align: center;margin-bottom: 10px;font-weight: 800;font-size: 25px">微信支付</p>
        <img src="__ADMIN_LOGIN__/img/wxpay.png"  style="width:200px;height:200px;"  alt="微信支付">
    </div>
    <div style="float: right;padding:20px;padding-right: 130px">
        <p style="text-align: center;margin-bottom: 10px;font-weight: 800;font-size: 25px">支付宝支付</p>
        <img src="__ADMIN_LOGIN__/img/alipay.png"  style="width:200px;height:200px;"  alt="支付宝支付">
    </div>
    <table class="layui-table" lay-skin="line">
        <colgroup>
            <col width="160">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th colspan="2"><a target="_blank" href="tencent://message/?uin=1113249273"><img border="0" src="__ADMIN_LOGIN__/img/counseling_style_52.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>
                &nbsp;&nbsp;&nbsp;&nbsp;付款后，请附上支付截图跟您的注册的用户名跟客服联系！为您开通资源权限。
            </th>

         </tr>
        </thead>
    </table>
</div>
<script>
    var title0=document.getElementById('cc0');
    var title1=document.getElementById('cc1');
        var c=0;
        function showLogin()
        {
            if(c%2==1){
                title0.setAttribute('style','font-size:20px;color:#eb8063');
                title1.setAttribute('style','font-size:20px;color:#eb8063');
            }else{
                title0.setAttribute('style','font-size:30px;font-weight:800;color:#ff1d80');
                title1.setAttribute('style','font-size:30px;font-weight:800;color:#ff1d80');
            }
            c++;
        }
        setInterval("showLogin()","200");
</script>