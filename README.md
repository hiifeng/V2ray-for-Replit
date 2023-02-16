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
<p>登录 <a href="https://replit.com">Replit.com</a> 账户，Template 选择 Bash ,Title 任意填，创建一个实例。</p>
<img src="https://www.hicairo.com/zb_users/upload/2022/12/202212221671676417413561.webp">
<p>使用以下链接下载文件到本地并解压，然后上传解压后的文件，可以全选后拖动到 Files 框内。</p>
<p>https://github.com/hiifeng/V2ray-for-Replit/raw/main/V2ray-for-Replit.zip</p>
<img src="https://hicairo.com/zb_users/upload/2023/02/202302131676266061661306.webp">
<p>等待文件上传完成，大约需要2分钟左右，当出现 Overwrite file 时，选择 Yes，overwrite this file 。</p>
<img src="https://hicairo.com/zb_users/upload/2022/12/202212291672276356316990.webp?">

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

# 反馈与交流：
在使用过程中，如果遇到问题，请使用Telegram与我联系。（ https://t.me/HiaiFeng ）
