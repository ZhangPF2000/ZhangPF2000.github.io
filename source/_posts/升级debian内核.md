---
title: 升级debian内核
toc: true
recommend: 1
keywords: debian内核
uniqueId: '2021-04-02 02:59:48/升级debian内核.html'
mathJax: false
date: 2021-04-02 10:59:48
thumbnail:
tags:
    - linux
    - debian
categories:
    - linux
---
> # 原因
> debian10.8版本安装完成之后默认安装的是4.19内核,不过这个内核已经有点老了  
> 还不支持一些的硬件:我的wifi网卡不能被识别到  
> 上网查阅资料得知:要识别到网卡需要5.12的内核(cf-ax200无线网卡)  
> 升级内核后安装驱动重启即可  
<!-- more -->
# 重要的事情说三遍
## **备份数据** **备份数据** **备份数据**
---
我使用的是timeshift软件进行备份  
很简单的就可以完成对debian系统内所有文件的备份(注意硬盘容量)  
我在升级内核的时候,遇到了好多次失败,所以备份是一个重要的良好的习惯  

---
## 升级内核
---
> 首先[换源](#bullseye版)  
> 其次`sudo apt update`  
> 不要使用`sudo apt upgrade`  
> 然后`sudo apt list --upgradable | grep "linux-image"`找到可升级的内核
> `sudo apt upgrade xxx`升级内核

---
> 由于我的电脑是nvidia显卡,参考[Debian 10.2命令安装Nvidia显卡驱动成功，问题回顾](https://blog.csdn.net/qq_21595501/article/details/103705776)之后就可以打开桌面了  
> 但是在升级内核的时候遇到了些问题  
> 大致就是升级内核之后,更新grub,以新内核进行启动  
> 会无法加载nvidia模块之类的,总之就是无法打开桌面  
> 经过我的测试发现,按照上面的教程确实可以解决nvidia的显卡问题,  
> 但是升级内核之后这些配置就成了阻碍打开桌面的原因了  
> - 解决办法
> - sudo apt remove --purge nvidia*
> - sudo apt remove --purge \*nvidia\*
> - sudo apt autoremove
> - 上面的设置是去除所有的nvidia设置和包
> - sudo rm /etc/X11/xorg.conf
> - sudo rm /usr/local/bin/switch_nvidia.sh
> - 打开`/usr/share/sddm/scripts/Xsetup` 去除`/usr/local/bin/switch_nvidia.sh`这一行
> - 我的是sddm,这些是修改内核加载模块顺序(我猜的)
> - 上面的完成之后重启应该就可以以新内核打开桌面了
> - 注意: 我一直使用的都是默认开源内核nouveau, 不需要禁用  
> 
> 重启之后进入桌面链接网络(我的pppoe拨号)  
> 总之联网然后sudo apt update && sudo apt upgrade更新一下  
> [换源bullseye版本](#bullseye版)  
> 然后安装`firmware-iwlwifi模块`(使用`bullseye版`源更新)重启后就可以看到wifi了  
> `sudo apt update && sudo apt install firmware-iwlwifi`  
> firmware-iwlwifi这个模块的稳定版中版本有点低不能用,所以要换源  
> ~~提醒:不要随便升级包,我把我的源换成了sid(unable:不可靠的)后更新~~(已解决)  
> ~~发现能进入桌面,但是好多的设置都变了,桌面没了,任务栏没了,我也设置不好~~  
> ~~所以我又换成了以前的源(稳定版),必要的时候使用其他源~~  
> ~~总之就是不要随便更新源尤其是不稳定的源(如果要更新,请提前备份数据)~~  
> 上面划线的已解决,[请看下一篇文章](https://zhangpf2000.github.io/2021/04/03/debian%E5%8D%87%E7%BA%A7%E8%BD%AF%E4%BB%B6%E5%90%8E%E9%BB%91%E5%B1%8F%E8%A7%A3%E5%86%B3/)  
> 防止出现问题后无法恢复导致只能重新安装  
> 
> ==================================================================
> 升级内核后遇到的问题  
> 升级之后,确实可以使用wifi了,桌面设置之类的也没有太大变化  
> 不过我发现firefox和chrome不能输入中文了  
> 大致就是在终端启动firefox之后,会显示加载xxx失败  
> 还有个xx版本太老(我忘了.写博客的时候已经修改好了,我使用的备份,也没有我的搜索记录了)  
> 这个的解决办法就是彻底卸载fcitx,然后再安装上  
> 注意顺序是先安装firmware-iwlwifi再安装fcitx,不然会冲突  
> 如果已经安装了fcitx就卸载  
> ```
> sudo apt remove --purge fcitx*
> sudo apt remove --purge *fcitx*
> sudo apt autoremove
> # 上面是卸载fcitx
> sudo apt install fcitx-frontend-gtk2 fcitx-frontend-gtk3 fcitx-ui-classic fcitx-ui-light
> sudo apt install fcitx-sunpinyin fcitx-googlepinyin
> sudo apt install fcitx-table*
> sudo apt install fcitx-frontend-qt4 fcitx-frontend-qt5
> sudo apt install kde-config-fcitx fcitx-module-cloudpinyin
> # 这些是安装fictx和一些配置(我找不到参考文档了)
> # 上面这些基本都是必备的
> # 最后一行的是安装kde中fcitx的配置文件,可以在设置中找到fcitx
> # fcitx-module-cloudpinyin是可以使用云拼音
> ```


## 我的debian源
---
### 稳定版debian源
``` buster版
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
```

### bullseye版
```
# 当buster版(稳定版)的源不支持你的软件时,可以考虑这个源
# 这个还是比较常用的,毕竟debian的稳定版源有些软件太老了
# 使用该源的时候,可以sudo apt update
# 但是不要sudo apt upgrade,这会导致软件全部升级,可能会出现未知错误
# 需要更新的时候请先sudo apt update
# 然后sudo apt install xxx 或者 sudo apt upgrade xxx
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
```

### testing版
```
# 这个是测试版的源
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ testing main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ testing main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ testing-updates main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ testing-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ testing-backports main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ testing-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security testing-security main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security testing-security main contrib non-free
```
### sid 版
```
# 这个最不稳定不要随便用
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ sid main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ sid main contrib non-free
```

# 希望能对你有所帮助(p_o)