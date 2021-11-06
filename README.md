-----------------本期内容涉及的材料-----------------
⛳Railway云的注册网址：
https://railway.app/

-----------------------------------------------------------------------------------------------
🚩🚩🚩🚩⛳由于git链接文件过期，请大家自行下载zip文件自建git链接，自行使用：⛳🚩🚩🚩🚩
⛳罗叔huochechou项目zip文件下载地址：https://link.jscdn.cn/sharepoint/aHR0...

🚩⛳使用方法请看视频：https://youtu.be/ynWrq4bEcr4 
🚩从 6分09秒开始看---介绍自己的GitHub如何自建Git链接教程
-----------------------------------------------------------------------------------------------

💪⛳在您自己的Linux VPS上的操作：

A. 在Linux VPS的Terminal上安装配置命令：

1. 安装npm命令：

apt install npm

2. 安装wstunnel命令：

sudo npm install -g wstunnel


B. 在Linux VPS上远程登录Railway云的Linux系统命令：

如果提示输入密码验证，密码为 uncleluo

请在自己Linux VPS的网络安全组和系统防火墙中放行7001端口，最好端口全开以免麻烦！

1. 配置连接进程命令

wstunnel -t 7001:127.0.0.1:22 wss://uncleluo.up.railway.app &

注意：这里wss://后面是你自己自定义后的域名，不要忘记&符号前面有个空格，我这里以uncleluo为域名开头，你可以替换为你自己的。

2. 自己的Linux VPS远程登录Railway云VPS命令：

ssh root@127.0.0.1 -p 7001


-----------------本期内容涉及的材料-----------------
