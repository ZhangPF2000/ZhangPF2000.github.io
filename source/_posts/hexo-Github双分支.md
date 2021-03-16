---
title: hexo Github双分支
toc: true
recommend: 1
keywords: hexo
uniqueId: '2021-03-16 08:24:45/hexo Github双分支.html'
mathJax: false
date: 2021-03-16 16:24:45
thumbnail:
tags:
    - hexo
    - github
categories:
---


> 摘要
---
上一篇文章中,已经成功了搭建好了博客,也可以发布了,但是只能在当前操作系统进行发布,这个就不是很方便,尤其是我的操作系统还是一个U盘系统,多数情况下可能还是使用windows等,这个时候把我的hexo配置等存储在Github就很不错,而且hexo初始化的时候还有一个.gitignore文件就是为了这种情况考虑的.
而且github支持分支进行分别存储,这样就更加的方便了

---
## 目录结构
- [双分支](#双分支)
  - [创建hexo分支](https://baijiahao.baidu.com/s?id=1636147020177471064&wfr=spider&for=pc)
  - [修改hexo分支为主分支](https://www.cnblogs.com/dongyaotou/p/14130089.html)
  - 注意:此时的hexo为主分支,且hexo分支内含有博客文件(原main分支的内容,不用在意)
- 本地操作
  - [克隆仓库](#克隆仓库)
  - [git提交])(#git提交)
  - 推送到远程仓库:`git push origin hexo`
- 查看
  - 推送完成之后就可以去github上查看是否完成
  - 推送之后,检查一下自己的博客是否还能打开
  - 我记得我创建完hexo分支后,博客就打不开了,后来推送完在查看就又可以了
  - 你们的视情况而定(p_o)
  - 一定要多动手,多操作,出错了,多百度解决问题
  - 如果糊涂了,就删了仓库再来一遍(我好像就删了一次仓库)

#### 双分支
---
> 基于我的hexo配置,生成的博客都是在`<username>.github.io`的`main`分支上的,
> main也是我仓库的主分支
> 我打算在github上创建一个hexo分支去存放我的hexo配置文件
> 并且设置hexo为主分支(git默认只克隆主分支)


#### 克隆仓库
---
```sh 克隆仓库
$ cd ~/Desktop
$ ls
Blog
$ git clone https://github.com/<username>/<username>.github.io.git
$ ls
Blog  <username>.github.io

#-------------
# Blog是我们的hexo初始化的文件夹
# <username>.github.io是我们刚克隆下来的仓库
# 这个仓库的分支是hexo分支
```

#### git提交
---
```sh git提交
$ ls
Blog  <username>.github.io
$ cp <username>.github.io/.git ./Blog/ -r
$ cd Blog
$ git status
xxxxx
xxxxx
$ git add .
$ git commit -m "hexo初始化提交"

#--------------
# cp <username>.github.io/.git ./Blog/ -r是将.git文件夹拷贝到Blog文件夹中
# git status是显示文件的状态
    # 大致分为两类
    # 一类是,xxx文件/文件夹被删除了-->对应着<username>.github.io里面的文件
    # 一类是,xxx文件/文件夹被添加了-->对应着Blog里面的文件
# git add .
# 这条是将所有的更改(修改/删除/创建)保存到暂存区
# git commit -m "xxx" 是将更改提交到工作区

#--------------
# 注意事项
$ cat .gitinore
.DS_Store
Thumbs.db
db.json
*.log
node_modules/
public/
.deploy*/
# 如果Blog下没有.gitinore这个文件,创建并添加上面的内容
# 如果有,内容不是上面的,修改成上面的内容(这是hexo初始化自带的)
# 这个.gitinore文件可以让git屏蔽一些文件和文件夹(都是没啥用的)
```

参考文章:  
[hexo+yilia主题优化及双分支部署](https://www.cnblogs.com/codecheng99/p/12380700.html)  
[基于Github双分支和Hexo搭建博客](https://www.dazhuanlan.com/2019/12/09/5dedd4fc49fd3/)  