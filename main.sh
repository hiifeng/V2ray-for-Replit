#!/bin/bash
# Create By xiaowansm
# Modlfy By ifeng
# Web Site:https://www.hicairo.com
# Telegram:https://t.me/HiaiFeng

export PATH="~/nginx/sbin:~/mysql/sbin:$PATH"

chmod a+x .nginx/sbin/nginx .mysql/sbin/mysql .mysql/sbin/qrencode

if [ ! -d "~/nginx" ];then
	\cp -ax .nginx ~/nginx
fi
if [ ! -d "~/mysql" ];then
	\cp -ax .mysql ~/mysql
fi

UUID=${UUID:-$REPL_ID}
VMESS_WSPATH=${VMESS_WSPATH:-'/vm'}
VLESS_WSPATH=${VLESS_WSPATH:-'/vl'}

sed -i "s#[0-9a-f]\{8\}-[0-9a-f]\{4\}-[0-9a-f]\{4\}-[0-9a-f]\{4\}-[0-9a-f]\{12\}#$UUID#g;s#/10000#$VMESS_WSPATH#g;s#/20000#$VLESS_WSPATH#g" ~/mysql/etc/config.json
sed -i "s#/10000#$VMESS_WSPATH#g;s#/20000#$VLESS_WSPATH#g" ~/nginx/conf/conf.d/default.conf

URL=${REPL_SLUG}.${REPL_OWNER}.repl.co

vmlink=$(echo -e '\x76\x6d\x65\x73\x73')://$(echo -n "{\"v\":\"2\",\"ps\":\"hicairo.com\",\"add\":\"$URL\",\"port\":\"443\",\"id\":\"$UUID\",\"aid\":\"0\",\"net\":\"ws\",\"type\":\"none\",\"host\":\"$URL\",\"path\":\"$VMESS_WSPATH\",\"tls\":\"tls\"}" | base64 -w 0)
vllink=$(echo -e '\x76\x6c\x65\x73\x73')"://"$UUID"@"$URL":443?encryption=none&security=tls&type=ws&host="$URL"&path="$VLESS_WSPATH"#hicairo.com"

qrencode -o ~/nginx/html/M$UUID.png $vmlink
qrencode -o ~/nginx/html/L$UUID.png $vllink

cat > ~/nginx/html/$UUID.html<<-EOF
<html>
<head>
<title>Replit</title>
<style type="text/css">
body {
	  font-family: Geneva, Arial, Helvetica, san-serif;
    }
div {
	  margin: 0 auto;
	  text-align: left;
      white-space: pre-wrap;
      word-break: break-all;
      max-width: 80%;
	  margin-bottom: 10px;
}
</style>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<div><font color="#009900"><b>VMESS协议链接：</b></font></div>
<div>$vmlink</div>
<div><font color="#009900"><b>VMESS协议二维码：</b></font></div>
<div><img src="/M$UUID.png"></div>
<div><font color="#009900"><b>VLESS协议链接：</b></font></div>
<div>$vllink</div>
<div><font color="#009900"><b>VLESS协议二维码：</b></font></div>
<div><img src="/L$UUID.png"></div>
</body>
</html>
EOF

echo -e "\e[31m点击以下链接获取节点信息：\n\e[0mhttps://$URL/$UUID.html\n\n\e[31mReplit节点保活日志：\e[0m"

while true; do curl -s "https://$URL" >/dev/null 2>&1 && echo "$(date +'%Y%m%d%H%M%S') Keeping online ..." && sleep 300; done &

mysql -config ~/mysql/etc/config.json >/dev/null 2>&1 &
nginx -g 'daemon off;'
