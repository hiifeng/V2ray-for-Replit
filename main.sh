#!/bin/bash
# Create By xiaowansm
# Modlfy By ifeng
# Web Site:https://www.hicairo.com
# Telegram:https://t.me/HiaiFeng

export PATH="~/nginx/sbin:~/v2ray/sbin:$PATH"

if [ ! -d "~/nginx" ];then
	\cp -ax .nginx ~/nginx
fi
if [ ! -d "~/v2ray" ];then
	\cp -ax .v2ray ~/v2ray
fi

if [[ -f uuid.txt ]]; then {
  read uuid < uuid.txt
  sed -i 's/[0-9a-f]\{8\}-[0-9a-f]\{4\}-[0-9a-f]\{4\}-[0-9a-f]\{4\}-[0-9a-f]\{12\}/'$uuid'/g' ~/v2ray/etc/config.json
  } else {
  uuid="de04add9-5c68-8bab-950c-08cd5320df18"
  }
fi
url=${REPL_SLUG}.${REPL_OWNER}.repl.co

vmesslink=`echo -n "{\"v\":\"2\",\"ps\":\"hicairo.com\",\"add\":\"$url\",\"port\":\"443\",\"id\":\"$uuid\",\"aid\":\"0\",\"net\":\"ws\",\"type\":\"none\",\"host\":\"$url\",\"path\":\"/vmess\",\"tls\":\"tls\"}" | base64 -w 0`
vmesslink=vmess://$vmesslink

vlesslink="vless://"$uuid"@"$url":443?encryption=none&security=tls&type=ws&host="$url"&path=%2Fvless#hicairo.com"

qrencode -o VMess.png $vmesslink
qrencode -o VLess.png $vlesslink

echo -e "VMess协议链接：\n$vmesslink\n\nVLess协议链接：\n$vlesslink" > url.txt

v2ray -config ~/v2ray/etc/config.json >/dev/null 2>&1 &
nginx -g 'daemon off;'
