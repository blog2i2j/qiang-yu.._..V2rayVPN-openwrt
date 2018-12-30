V2rayVPN-openwrt
---

v2ray 的 openwrt 工程，简单、好用、够用 

- 下载 v2ray 执行程序，放到 /etc/V2rayVPN 目录下

   请自己去 [v2ray 工程][1] 下载适合你的路由器的程序，解压缩，把 v2ray/v2ctrl 两个文件放到 /etc/V2rayVPN 目录下，只有放到这个目录下，程序才可以使用
   
   注意：需要确保 v2ray/v2ctrl 有执行权限， chmod a+x v2ray/v2ctrl 

![1](https://github.com/qiang-yu/V2rayVPN-openwrt/blob/master/misc/1.jpg)

- 配置 v2ray 服务器信息

![2](https://github.com/qiang-yu/V2rayVPN-openwrt/blob/master/misc/2.jpg)

- 程序自带 gfwlist 列表 

![3](https://github.com/qiang-yu/V2rayVPN-openwrt/blob/master/misc/3.jpg)

- 把你自己想加入的域名加入到这里

![4](https://github.com/qiang-yu/V2rayVPN-openwrt/blob/master/misc/4.jpg)

- IP直通：把你需要爬墙的 IP 都放到这里，你懂的 

![5](https://github.com/qiang-yu/V2rayVPN-openwrt/blob/master/misc/5.jpg)

- 监控日志：显示系统运行的日志，每10分钟会自动检测一次

![6](https://github.com/qiang-yu/V2rayVPN-openwrt/blob/master/misc/6.jpg)


联系我  
---

如果你在 L有大雕 的 Gargoyle 石像鬼固件大群 里面，联系 孤狼吠月 就可以了。


如果你不在固件群里面，就 github 发 issue 吧。

----------

[1]: https://github.com/v2ray/v2ray-core/releases


