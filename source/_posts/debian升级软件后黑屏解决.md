---
title: debian升级软件后黑屏解决
toc: true
recommend: 1
keywords: debian,黑屏,升级
uniqueId: '2021-04-03 12:58:30/debian升级软件后黑屏解决.html'
mathJax: false
date: 2021-04-03 20:58:30
thumbnail:
tags:
    - debian
    - kde plasma
categories:
    - linux
---
> # debian大升级
> 上篇文章中升级内核时,我的推荐是不要对其他软件包进行安装  
> 防止出现黑屏,这个升级之后虽然能用,但是很不方便,所以当时我不推荐  
> 今天在使用debian的时候要使用libreoffice进行操作,发现其版本太低  
> 然后再次升级了软件包,发现还是黑屏  
> 不过上网查阅后,并通过不断的测试,还是解决了这个问题  
> 
> ----
> 升级  
> - `deb https://mirrors.tuna.tsinghua.edu.cn/debian/ sid main contrib non-free`
> - `deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ sid main contrib non-free`
> 
> 我测试时是使用的sid源(不是太安全),你们可以考虑`testing版`或`bullseye版`  
> [国内源地址](https://mirrors.tuna.tsinghua.edu.cn/help/debian/)  
> 升级步骤  
> - 换源
> - `$ sudo apt update`
> - `$ sudo apt full-upgrade && sudo apt upgrade`
> - `sudo reboot`
> ---
> 重启之后就再打开就可以了  
> 黑屏特点
> - 整个开机没有任何问题,也可以登录,就是登录之后桌面是黑的
> - 鼠标左键右键都不能用,但是好像左右键一起按有用,会弹出菜单(没有啥用)
> - 找不到桌面设置,不能更换壁纸,不能添加部件
> - 快捷键`alt+空格`打开的`kruner`不能使用,一直打不开
> - 快捷键`alt+f1`可以打开左下角的面板,可以从里面启动程序
> - 使用里面的程序没有任何问题,只是桌面很难看,也不能修改
> - 没有任务栏,我的电脑开机自动连接`wifi`和`pppoe`(没升级前设置的)
> - ......
> ---
> 解决办法: 注意要联网
> - 打开终端`ctrl+alt+t`(我的快捷键)
> - `$ sudo apt remove plasma-*`
> - `$ sudo apt remove *plasma-*`
> - `$ sudo apt autoremove`
> - `$ sudo apt install plasma-*`
> - `$ sudo reboot`
> - 我推测好像是升级的时候,plasma的软件和设置出现了问题
> - 导致plasma软件和设置不能其作用,导致桌面不能显示
> - 按照上面的方法,重启之后,再登录就可以显示桌面了
> - 当初还遇到一种情况:桌面可以设置壁纸(右上角有个小东西,点击可以设置桌面)
> - 但是没有任务栏,默认面板也不能使用(原因估计和这个一样(没试过))
> - 重启之后,一切基本都好了,剩下的再慢慢的配置下就好了,然后再备份下
> ---
> 升级后感觉如何
> - 升级完成之后发现这些配置是真的爽
> - 更加方便的设置
> - 更加完善的默认软件(设置有个护眼的很棒[debian太亮了,不适应,还是暖色好])
> - 更加好看的系统(主要都是在一些小地方,但是很实用的)
> - 我升级的是sid版本,都是最新的,也不知道有没有啥大问题,但是目前感觉不错
> - 软件的整体升级,这个就很舒服了,好多软件在稳定版上都是太老了,界面,功能都很少
> - 我以前使用kubuntu的时候,用的也很舒服,那些都是自动设置的,不过debian是自行升级的
> - 默认版本的还是太稳了,稳如老狗啊
> - 想要kubuntu那种新版软件和新感觉的可以考虑升级一下
> ---
> 注意事项
> - 一定要备份,这个最为重要,失败了可以恢复,不然就玩了
> - 一定要联网,下载plasma包的时候要用

<!-- more -->
## 升级后图片
![图片1](https://cdn.jsdelivr.net/gh/ZhangPF2000/Image@main/img/20210403213234.png)
![图片2](https://cdn.jsdelivr.net/gh/ZhangPF2000/Image@main/img/20210403213754.png )
![图片3](https://cdn.jsdelivr.net/gh/ZhangPF2000/Image@main/img/20210403214834.png)

# 希望能对你有所帮助(p_o)