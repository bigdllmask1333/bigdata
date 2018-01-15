{if condition="input('param.hisi_iframe') || cookie('hisi_iframe')"}
</body>
</html>
{else /}
        </div>
    </div>
    <div class="layui-footer footer">
        <span class="fl">数据时代</span>
<!--        <span class="fl">数据时代<a href="{:config('hisiphp.url')}" target="_blank">{:config('hisiphp.name')}</a> v{:config('hisiphp.version')}</span>-->
<!--        <span class="fr"> © 2017-2018 <a href="{:config('hisiphp.url')}" target="_blank">{:config('hisiphp.copyright')}</a> All Rights Reserved.</span>-->
    </div>
</div>
</body>
</html>
{/if}