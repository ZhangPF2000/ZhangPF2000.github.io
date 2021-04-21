---
title: fcitx使用搜狗词库
toc: true
recommend: 1
keywords: fcitx 搜狗词库
uniqueId: '2021-04-11 03:23:28/fcitx使用搜狗词库.html'
mathJax: false
date: 2021-04-11 11:23:28
thumbnail:
tags:
  - fcitx
categories:
  - linux
  - fcitx
---

# 如果你需要 fcitx5,请看后面的文章

# 我升级了输入法,fcitx5 的效果要更好,我推荐使用 fcitx5

# [链接](https://zhangpf2000.github.io/2021/04/14/debian10%E5%AE%89%E8%A3%85fcitx5/)

---

> # fcitx 使用搜狗词库
>
> ---
>
> 简介: 在使用 debian 的时候,我是使用的 fcitx 框架+google 输入法
> 但是这个 fcitx 不是特别的好用,输入的时候没有在 win10 输入法的那种舒服感
> 至于词库,在输入的时候,不是特别的好用,今天无意间看到 fcitx 可以使用搜狗的词库
> 就试了试,下面是我的操作步骤

[手动设置](#手动配置) && [自动配置](#自动配置)

<!-- more -->

## 手动配置

- 下载[搜狗词库文件](https://pinyin.sogou.com/dict/),下载的文件格式是`*.scel`
- 这个格式的文件 fcitx 是无法使用的,fcitx 的词库文件是`*.mb`文件
- 将`scel`转换为`mb`格式
  - `sudo apt install fcitx-tools` 这是转换工具
  - `scel2org xxx.scel -o xxx.org` 转换成 org 文件, org 文件是可以查看的
  - `cat *.org > tot.org` 合并转换的 org 文件,
  - 下载下面的两个文件`gbkpy.org`和`pyPhrase.org`
  - `https://raw.githubusercontent.com/LuoshuiTianyi/Varia/master/gbkpy.org`
  - `https://raw.githubusercontent.com/LuoshuiTianyi/Varia/master/pyPhrase.org`
  - `cat pyPhrase.org >> tot.org` 词汇合并
  - `sort tot.org > ord.org` 排序
  - `uniq ord.org > final.org` 去重复
  - `createPYMB gbkpy.org final.org` 生成 mb 文件
  - `cp *.mb ~/.config/fcitx/googlepinyin` 将生成的 mb 文件复制到配置文件下
  - 重启 fcitx 即可
- [批量下载搜狗词库的爬虫](https://github.com/Ingram7/SogouWordSpider/tree/master/SogouWordSpider)

## 自动配置

> [下载地址](https://download.zsxwz.com/dir/16220046-40179353-fd1d9a?40183169)
> 下载现成的文件也可以,上面的下载后也是两个`mb文件`,
> 将这两个文件放到`~/.config/fcitx/googlepinyin`下重启即可
> 这两个文件,应该是整合了很多的词库的,可以使用的

参考文章:  
[Fcitx 使用搜狗词库与皮肤](https://www.cnblogs.com/luoshuitianyi/p/11669619.html)

# 希望能对你有所帮助(p_o)
