---
title: debian10安装fcitx5
toc: true
recommend: 1
keywords: fcitx5
uniqueId: '2021-04-14 07:23:25/debian10安装fcitx5.html'
mathJax: false
date: 2021-04-14 15:23:25
thumbnail:
tags:
  - fcitx5
categories:
  - linux
  - fcitx
---

> # 摘要
>
> 我把我的 debian10.8 系统的输入法换成了 fcitx5
> 原因:
>
> - fcitx4 的这个输入法不是很友好
> - fcitx4 不够智能的显示
> - 我安装了 fcitx5 之后试了试,发现效果不错
> - 更加的智能化,好多词汇都可以直接出现
> - 而 fcitx4 中的词汇通常是固定位置,这个就比较难受了
> - fcitx5 的词库导入也是十分的方便,不用再去转换文件格式了
> - fcitx5 的皮肤更加的舒服,我再 github 上找到了我很喜欢的一个皮肤

<!-- more -->

# 正文

- 卸载 fcitx4
  - `sudo apt remove --purge fcitx*`
  - `sudo apt remove --purge *fcitx*`
  - `sudo apt autoremove`
  - 卸载的时候最好退出 fcitx4
- 安装 fcitx5
  - `sudo apt install --install-recommends fcitx5 fcitx5-chinese-addons --fix-missing`
  - `sudo apt install --no-install-recommends fcitx5 fcitx5-chinese-addons fcitx5-frontend-gtk3 fcitx5-frontend-qt5 fcitx5-module-xorg kde-config-fcitx5 im-config`
- 配置 fcitx5
  - 安装完成之后就可以打开 fcitx5
  - 默认安装完成之后,只有一堆没有的设置,需要自行设置
  - debian 不需要配置一些文件,修改主题输入法等相关操作都可以图形化完成
  - ![](https://cdn.jsdelivr.net/gh/ZhangPF2000/Image@main/img/2021-04-14_15-48-28.png)
  - ![](https://cdn.jsdelivr.net/gh/ZhangPF2000/Image@main/img/2021-04-14_15-42-24.png)
  - ![](https://cdn.jsdelivr.net/gh/ZhangPF2000/Image@main/img/2021-04-14_15-47-20.png)
- 主题演示:

  - 主题文件夹可以放在`~/.local/share/fcitx5/themes/`下
  - Alpha-white-2.0
    ![Alpha-black-2.0](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/Alpha-black-2.0/h.png)
  - Alpha-black
    ![Alpha-black](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/Alpha-black/h.png)

  - Alpha-white-2.0
    ![Alpha-white-2.0](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/Alpha-white-2.0/h.png)

  - Alpha-white
    ![Alpha-white](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/Alpha-white/h.png)
  - 【安然】简单白（默认皮肤圆角纯白版）
    ![【安然】简单白（默认皮肤圆角纯白版）](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/【安然】简单白（默认皮肤圆角纯白版）/h.png)
  - 【竹子】极简花青
    ![【竹子】极简花青](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/【竹子】极简花青/h.png)
  - 倬彼昊天·格子
    ![倬彼昊天·格子](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/倬彼昊天·格子/h.png)
  - 倬彼昊天·灰色 MAC
    ![倬彼昊天·灰色MAC](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/倬彼昊天·灰色MAC/h.png)
  - 珍珠白
    ![珍珠白](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/珍珠白/h.png)
  - 白色卡片
    ![白色卡片](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/白色卡片/h.png)
  - 珍珠白（无阴影版）
    ![珍珠白（无阴影版）](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/珍珠白（无阴影版）/h.png)
  - 简约白
    ![简约白](https://cdn.jsdelivr.net/gh/sxqsfun/fcitx5-sogou-themes@master/简约白/h.png)

参考文章:  
[Fcitx5 (简体中文)](<https://wiki.archlinux.org/index.php/fcitx5_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>)
[I18n Fcitx5](https://wiki.debian.org/I18n/Fcitx5)
[如何现在就在 Ubuntu 20.04 用上 Fcitx 5](https://plumz.me/archives/11740/)
[fcitx5 的搜狗主题下载](https://github.com/sxqsfun/fcitx5-sogou-themes)

# 希望能对你有所帮助(p_o)
