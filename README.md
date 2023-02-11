# V2ray for Replit
Create By xiaowansm<br>
Modlfy By ifeng<br>
Web Site: https://www.hicairo.com <br>
Telegram: https://t.me/HiaiFeng <br>

# 简介：
本项目用于在 Replit.com 免费服务上部署 V2ray ，采用的方案为 Nginx + WebSocket + VMess/VLess + TLS。
# 注意事项：
<b>请勿滥用，账号封禁风险自负。网络流量每月有100GB软上限。</b>
# 部署：
在 <a href="https://replit.com">Replit.com</a> 上注册账户，然后点击下方按钮
<p><a href="https://repl.it/github/hiifeng/V2ray-for-Replit" rel="nofollow"><img alt="Run on Repl.it" src="https://camo.githubusercontent.com/8f3d0bdc332bfddbb9694b553bba8319754153b39f2efdf3c78b17fbbb6b7990/68747470733a2f2f7265706c2e69742f62616467652f6769746875622f616e6462727569626d2f7265616465722d7265706c6974" style="height: 40px; width: 190px; max-width: 100%;" data-canonical-src="https://repl.it/badge/github/andbruibm/reader-replit"></a></p>
<p>再点击 <b>Import from Github</b>。</p>

<p>或者直接 fork 以下链接进行使用：</p>
https://replit.com/@hifeng/v2rayN?v=1

# 使用方法：
<p>点击顶部的 Run 按钮后，服务会自动运行。然后在屏幕 Console 窗口内拷贝 VMess/VLess 协议的链接，导入客户端软件即可。或者使用手机客户端软件扫描 VMess/VLess 协议的二维码。</p>

<p><b>自定义节点中的 UUID（用户ID）或伪装路径：</b></p>
<p>由于 UUID 默认使用了 Replit 平台提供的 REPL_ID 变量，每个实例 UUID 都是唯一的，别人不会知道，不会出现节点信息泄露问题。因此自定义 UUID 等信息意义不大。如确实要修改，请参考以下步骤：</p>
<p>1、使用第三方工具（ https://www.v2fly.org/awesome/tools.html ）生成一个新的 UUID。</p>
<p>2、点击左侧 Tools 菜单中的 Secrets 按钮。添加三个系统变量。 key 值分别为</p>
"UUID"、"VMESS_WSPATH" 和 "VLESS_WSPATH"。</p>
value 值分别为"使用第三方工具生成的UUID"，"vmess的伪装路径"和"vless的伪装路径"。</p>
<p>3、注意："VMESS_WSPATH" 和 "VLESS_WSPATH"的 value 值需要以"/"符号开头。</p>
<pre class="notranslate"><code># example:
UUID                        de04add9-5c68-8bab-950c-08cd5320df18
VMESS_WSPATH                /vm
VLESS_WSPATH                /vl
</code></pre>
<p><b>一行代码实现 Repl 保活：</b></p>
<p>最近群里的小伙伴反馈 Repl 总是休眠停止服务，究其原因是官方为节约服务器资源开支，对于没有活动的 Repl 会停止服务，除非重新启动。如果你也安装了 <a href="https://www.hicairo.com/post/55.html" target="_blank">Doprax.com</a> 节点，可以在如下图所示的位置添加一行代码。原理为每隔5分钟让程序自动访问一次你的 Repl 服务。当然，如果你没有 Doprax.com 节点，也可以将这行代码添加到你的软路由上。</p>
<img src="https://www.hicairo.com/zb_users/upload/2022/12/202212291672276356316990.webp">
<pre class="notranslate"><code># 将这行代码中的域名替换成 Replit 为你项目分配的域名
while true ;do curl https://xx.xx.repl.co; sleep 300; done &
</code></pre>

# 反馈与交流：
在使用过程中，如果遇到问题，请使用Telegram与我联系。（ https://t.me/HiaiFeng ）
