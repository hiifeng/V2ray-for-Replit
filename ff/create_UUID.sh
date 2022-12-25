#!/bin/bash
# Made By ifeng
# Web Site:https://www.hicairo.com
# Telegram:https://t.me/HiaiFeng

export PATH="~/nginx/sbin:~/v2ray/sbin:$PATH"

if [ ! -d "~/nginx" ];then
	\cp -ax .nginx ~/nginx
fi
if [ ! -d "~/v2ray" ];then
	\cp -ax .v2ray ~/v2ray
fi

v2ctl uuid > uuid.txt