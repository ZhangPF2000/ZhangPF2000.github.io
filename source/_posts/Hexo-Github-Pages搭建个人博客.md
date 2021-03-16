---
title: Hexo+Github Pages搭建个人博客
toc: true
recommend: 1
keywords: Hexo个人博客
uniqueId: '2021-03-13 12:39:16/Hexo+Github Pages搭建个人博客.html'
mathJax: false
date: 2021-03-13 20:39:16
thumbnail:
tags:
    - hexo
    - github
categories:
---

# Hexo+Github个人博客

> 摘要  
> 搭建个人博客  
> 借助Hexo和Github完成操作  
> 本人环境相关信息:  
>> 使用Kubuntu 20.04.2 LTS系统  
>> node版本 `v12.18.0`  
>> npm版本 `6.14.4`  
>> hexo版本 `5.4.0`  
>> hexo-cli版本 `4.2.0`  
>
> 参考链接:  
>> [Hexo官网](https://hexo.io/zh-cn/)  
>> [Amazing主题](https://github.com/removeif/hexo-theme-amazing)  
>> [Amazing主题参考](https://removeif.github.io/theme/%E5%8D%9A%E5%AE%A2%E6%BA%90%E7%A0%81%E5%88%86%E4%BA%AB.html)  
>> [Icarus主题(Amazing基于Icarus改造)](https://github.com/ppoffice/hexo-theme-icarus)  

<br>

<!-- more -->
```txt 简述 >folded
    我处于猎奇心理,在寒假打算搭建一个个人博客,在寒假最后几天,最终确定了我使用Hexo+Github来搭建属于我个人的博客.
初次选用的主题是Icarus,由于初次了解这些东西,什么也不懂,不断的通过百度和其他网友的搭建过程了解了搭建过程.
后遇到了Amazing主题, 博主removeif的网站有着对该主题的详细解释和操作,另外这个主题我也是十分的喜欢,就选中了这个主题.
在此十分的感谢博主removeif
```
## 详细搭建过程
---
- 操作系统:
  - 选择了KUbuntu来做为我的系统环境
  - 也是为了更加的熟悉Linux
  - 选择理由
    - ubuntu装了两次都崩溃了(装到u盘中)
    - debian装进去之后打不开图形化界面(显卡驱动也有些问题)
    - 其他Linux系统不太熟
    - kde很好看nice
- npm安装
  - 不晓得为啥使用包管理apt安装的版本低而且有些问题
  - 去官方下载[源代码(点击下载v12.18.0)](https://nodejs.org/dist/v12.18.0/node-v12.18.0.tar.gz)编译
  - 解压出源代码编译(不需要管理员权限)
  - ./configure
  - make (过程十分漫长)
  - make install
  - make clean
- npm安装hexo-cli
  - npm -g install hexo-cli
  - 有时候会出现npm没有全局权限的报错(npm安装全局权限报错 Error: EACCES: permission denied)
  - [解决办法](https://www.jianshu.com/p/6b2ac5bd77b6)
  - 1.创建一个全局安装目录(以后全局安装的包都在这)`mkdir ~/.npm-global`
  - 2.配置npm使用新的目录路径`npm config set prefix '~/.npm-global'`
  - 3.添加系统变量`export PATH=~/.npm-global/bin:$PATH`只能当前使用,永久使用请手动添加`PATH="~/.npm-global/bin:$PATH"`到`~/.profile`中
  - 4.更新系统变量`source ~/.profile`
- [本地搭建并预览](#本地搭建并预览)
  - 这个搭建的博客只能[本地预览](http://localhost:4000)
  - 使用的主题是默认主题
- [更换hexo主题](#更换hexo主题)
  - 更换主题之后要修改部分配置以适合自己
  - [配置主题细节](#配置主题细节)
  - 每次更新主题之后请预览一下,防止出错不知道咋回事
- [配置hexo](#配置hexo)
  - 配置完成之后一定要预览查看有没有出现问题
  - 初次配置的时候推荐使用博主的配置
- [Github](#Github)
  - 注册Github和创建仓库就不说了,网上很多教程
  - 部署到github: `hexo d`
  - 过一会应该就可以访问`<username>.github.io`看到你的博客了
- 后续
  - 部署到github还有很多可以做的:比如利用分支来保存hexo信息
  - hexo中还有很多有趣的地方可以开发
  - amazing主题中还有许多强大的功能
  - 目前我很多东西还不晓得咋搞,先放着吧
  - 配置hexo,多看看[官网](https://hexo.io/zh-cn/docs/)
  - 配置hexo主题.多看看博主的[帖子](https://removeif.github.io/theme/%E5%8D%9A%E5%AE%A2%E6%BA%90%E7%A0%81%E5%88%86%E4%BA%AB.html)和[个人博客](https://removeif.github.io)
  - [Hexo框架(一)：使用Hexo快速搭建个人博客](https://blog.juanertu.com/archives/e3dc5cbb.html)


#### 本地搭建并预览
---
```sh
$ hexo init Blog
$ cd Blog
# 文件目录结构
:<<!
.
├── _config.yml
├── package.json
├── scaffolds
├── source
│   ├── _drafts
│   └── _posts
└── themes
!
$ npm install # 安装依赖
# 推荐博主的依赖:https://removeif.github.io/theme/%E5%8D%9A%E5%AE%A2%E6%BA%90%E7%A0%81%E5%88%86%E4%BA%AB.html
# 把博主帖子最后的package.json内容复制到你的package.json文件中再执行npm install
$ hexo g
$ hexo s
```


#### 更换hexo主题
---
```sh 更换hexo主题 >folded
# 以Amazing为例
$ cd Blog
$ git clone https://github.com/removeif/hexo-theme-amazing.git themes/amazing
$ vim _config.yml # 注释:这个_config.yml是Blog文件夹下的.yml文件,不是刚才下载的那个
# 修改主题
# theme: amazing
$ cd ./theme/amazing
$ npm install #安装主题的依赖,这个在clone的时候package.json这就有内容了
```

#### 配置主题细节
---
```config _config.yml配置文件 >folded

# 文件是Blog/theme/amazing/_config.yml
# 我只是讲解一些我所配置的东西,很多东西我也不会搞

# 版本号
version: 4.0.0

# Icarus 主题选择: "default" or "cyberpunk"
variant: default
# 网站Logo的URL
logo: https://cdn.jsdelivr.net/gh/ZhangPF2000/Image@main/img/签名.png
# 页面数据配置
head:
    # 博客的icon地址(URL)
    favicon: https://cdn.jsdelivr.net/gh/ZhangPF2000/Image@main/img/logo.jpg
    # Open Graph metadata(翻译:打开图形元数据)
    # https://hexo.io/docs/helpers.html#open-graph
    open_graph:
        # Page title (og:title) (optional)
        # You should leave this blank for most of the time
        title: ZhangPF2000
        # Page type (og:type) (optional)
        # You should leave this blank for most of the time
        type: blog
        # Page URL (og:url) (optional)
        # You should leave this blank for most of the time
        url: https://ZhangPF2000.github.io/
        # Page cover (og:image) (optional)
        # You should leave this blank for most of the time
        image: https://i1.hdslb.com/bfs/face/e2ddc2275df94af1cebf7028aa1bdc1bb30e78f4.jpg
        # Site name (og:site_name) (optional)
        # You should leave this blank for most of the time
        site_name: ZhangPF2000
        # Page author (article:author) (optional)
        # You should leave this blank for most of the time
        author: ZhangPF2000
        # Page description (og:description) (optional)
        # You should leave this blank for most of the time
        description: 
        # Twitter card type (twitter:card)
        twitter_card: 
        # Twitter ID (twitter:creator)
        twitter_id: 
        # Twitter Site (twitter:site)
        twitter_site: 
        # Google+ profile link (deprecated)
        google_plus: 
        # Facebook admin ID
        fb_admins: 
        # Facebook App ID
        fb_app_id: 
    # Structured data of the page
    # https://developers.google.com/search/docs/guides/intro-structured-data
    # 这个可以不填
    structured_data:
        # Page title (optional)
        # You should leave this blank for most of the time
        title: 
        # Page description (optional)
        # You should leave this blank for most of the time
        description: 
        # Page URL (optional)
        # You should leave this blank for most of the time
        url: 
        # Page author (article:author) (optional)
        # You should leave this blank for most of the time
        author: 
        # Page images (optional)
        # You should leave this blank for most of the time
        image: 
    # Additional HTML meta tags in an array
    # 这个也可以不填
    meta:
        # Meta tag specified in <attribute>=<value> style
        # E.g., name=theme-color;content=#123456 => <meta name="theme-color" content="#123456">
        - ''
    # URL or path to the website's RSS atom.xml
    rss: 
# Page top navigation bar configurations
navbar:
    # Naviagtion menu items
    menu:
        # 这个地方把"Home"改成"主页"就可以在页面显示中文菜单了(全部都改,后面的/和/tags之类的不要动)
        主页: /
        归档: /archives
        分类: /categories
        标签: /tags
        影音: /media
        相册: /album
        友链: /friend
        # 留言: /message
        # 碎碎念: /self-talking
        # 音乐: /music
        关于: /about
    # Links to be shown on the right of the navigation bar
    links:
        # 这两个链接是页面右上的搜索那个位置(搜索左边有一个github和四条竖杠的图表)
        # 不推荐动
        Join Gitter:
            # 这个是amazing论坛,里面有些对amazing主题的交流,可以去看看
            icon: fab fa-gitter
            url: 'https://gitter.im/hexo-theme-amazing/community'
        Download on GitHub:
            # 这个是amazing的下载链接
            icon: fab fa-github
            url: 'https://github.com/removeif/hexo-theme-amazing'
# Page footer configurations
footer:
    # Links to be shown on the right of the footer section
    # 这个也不推荐动
    links:
        # 这个是右下角的三个图标
        # 一个圆圈cc
        # 一个圆圈小人
        # 一个github图表
        Creative Commons:
            icon: fab fa-creative-commons
            url: 'https://creativecommons.org/'
        Attribution 4.0 International:
            icon: fab fa-creative-commons-by
            url: 'https://creativecommons.org/licenses/by/4.0/'
        Download on GitHub:
            icon: fab fa-github
            url: 'https://github.com/removeif/hexo-theme-amazing'
# Article related configurations
article:
    # Code highlight settings
    highlight:
        # Code highlight themes
        # https://github.com/highlightjs/highlight.js/tree/master/src/styles
        theme: atom-one-light
        # Show copy code button
        clipboard: true
        # Default folding status of the code blocks. Can be "", "folded", "unfolded"
        fold: unfolded
    # Whether to show estimated article reading time
    readtime: true
    # Article licensing block
    licenses:
        Creative Commons:
            icon: fab fa-creative-commons
            url: 'https://creativecommons.org/'
        Attribution:
            icon: fab fa-creative-commons-by
            url: 'https://creativecommons.org/licenses/by/4.0/'
        Noncommercial:
            icon: fab fa-creative-commons-nc
            url: 'https://creativecommons.org/licenses/by-nc/4.0/'
# Search plugin configurations
# https://ppoffice.github.io/hexo-theme-icarus/categories/Plugins/Search/
# 这个是搜索设置(我没动过,还是有的好)
search:
    type: insight
# Comment plugin configurations
# https://ppoffice.github.io/hexo-theme-icarus/categories/Plugins/Comment/


# 下面这些是评论设置:我没啥空去搞这个评论
# 目前也不打算搞这个,有需要的去https://removeif.github.io/theme/%E5%8D%9A%E5%AE%A2%E6%BA%90%E7%A0%81%E5%88%86%E4%BA%AB.html博主贴子看看如何设置
# 我全部都注释掉了
#comment:
#    type: disqus
#    # Disqus shortname
#    shortname: ''
# Comment plugin configurations
# https://ppoffice.github.io/hexo-theme-icarus/categories/Plugins/Comment/
#comment:
#    type: gitalk
#    language: zh-CN #zh-CN #Localization language key, en, zh-CN and zh-TW are currently available.
#    owner: removeif         # (required) GitHub user name
#    repo: blog_comment          # (required) GitHub repository name
#    client_id: 46a9f34ea0129d8     # (required) OAuth application client id
#    client_secret: 79c7c9cb847e141757d78bcbf89f0655b24 # (required) OAuth application client secret
#    admin: ['removeif']
#    create_issue_manually: true
#    distraction_free_mode: false
#    has_hot_recommend: true # 是否有热门推荐
#    has_latest_comment: true #是否有最新评论
    
# comment:
#     type: valine
#     app_id: rOtVIhvG3kd7QaSU9R-gzGzoHsz
#     app_key: F2sNV0Ckqvb3DEn3z
#     notify: false
#     verify: false
#     avatar: 'mp'
#     placeholder: '留下您的高见！'
#     has_latest_comment: true #是否有最新评论 true-有，false-无
#     owner: 辣椒の酱 #博主名 最新评论标注[博主]
#     required_fields: ['nick', 'mail', 'link']
#     lang: en #zh-CN zh-TW en ja


# utteranc site: https://utteranc.es/
# comment:
#     type: utteranc
#     repo: removeif/utteranc_comment # (required) GitHub userName & repository name
#     issue_term: pathname 
#     issue_number: 
#     label: 
#     theme: github-light



# Donate plugin configurations
# https://ppoffice.github.io/hexo-theme-icarus/categories/Plugins/Donation/
#donates:
  # 支付宝和微信支付的图标
  # 我注释掉了
  # 一般是在文章的最下面的位置
  # Alipay donate button configurations
    #-
        # Donation entry name
        #type: alipay
        # Qrcode image URL
        #qrcode: 'https://raw.githubusercontent.com/removeif/blog_image/master/img/2019/20190802135456.png'
    #-
        # Donation entry name
        #type: wechat
        # Qrcode image URL
        #qrcode: 'https://raw.githubusercontent.com/removeif/blog_image/master/img/2019/20190802135550.png'

    # 其他支付....
    # "Buy me a coffee" donate button configurations
#    -
#        type: buymeacoffee
#        # URL to the "Buy me a coffee" page
#        url: ''
#    # Patreon donate button configurations
#    -
#        type: patreon
#        # URL to the Patreon page
#        url: ''
#    # Paypal donate button configurations
#    -
#        type: paypal
#        # Paypal business ID or email address
#        business: ''
#        # Currency code
#        currency_code: USD
#    # Wechat donate button configurations
#    -
#        type: wechat
#        # Wechat qrcode image URL
#        qrcode: ''


# Share plugin configurations
# https://ppoffice.github.io/hexo-theme-icarus/categories/Plugins/Share/
# 分享设置:我没咋动过
share:
    type: sharejs
    # URL to the ShareThis share plugin script
    install_url: ''

# Sidebar configurations.
# Please be noted that a sidebar is only visible when it has at least one widget
# 下面这些好像是设置整体布局的
# 我感觉自带的布局就挺好,没动,需要的请自行设置然后预览一下看看
sidebar:
    # Left sidebar configurations
    left:
        # Whether the sidebar sticks to the top when page scrolls
        sticky: true
    # Right sidebar configurations
    right:
        # Whether the sidebar sticks to the top when page scrolls
        sticky: false
# Sidebar widget configurations
# http://ppoffice.github.io/hexo-theme-icarus/categories/Widgets/
widgets:
    # Table of contents widget configurations
    -
        # Where should the widget be placed, left sidebar or right sidebar
        position: left
        type: toc
        # Select show index
        index: false
    # Profile widget configurations
    -
        # Where should the widget be placed, left sidebar or right sidebar
        position: left
        type: profile
        # Author name
        # 页面左边的那个大大的作者名
        author: ZhangPF2000
        # Author title
        # 作者的标题
        author_title: 大二宅男
        # Author's current location
        # 作者位置
        location: 浦东新区
        # URL or path to the avatar image
        # 那个大大的头像
        avatar: https://cdn.jsdelivr.net/gh/ZhangPF2000/Image@main/img/logo.jpg
        # Whether show the rounded avatar image
        avatar_rounded: true
        # Email address for the Gravatar
        gravatar:
        # URL or path for the follow button
        follow_link: 'https://github.com/ppoffice'
        # Links to be shown on the bottom of the profile widget
        social_links:
            # "关注我"下面的几个图标
            Github:
                icon: fab fa-github
                url: 'https://github.com/ZhangPF2000'
            #Weibo:
                #icon: fab fa-weibo
                #url: 'https://weibo.com/removeif'
            Email:
                icon: fa fa-envelope
                url: 'mailto:2812827294@qq.com'
            #Next:
                #icon: fab fa-dribbble
                #url: 'https://removeif.github.io/remove.io'
            RSS:
                icon: fas fa-rss
                url: /atom.xml
        has_hitokoto: true
    # Recommendation links widget configurations
    -
        # Where should the widget be placed, left sidebar or right sidebar
        position: left
        type: links
        # Names and URLs of the sites
        # 网站链接,自己添加几个喜欢的网站(只显示域名)
        links:
            Hexo: 'https://hexo.io'
            bilibili: 'https://space.bilibili.com/476971740'
            amazing: 'https://github.com/removeif/hexo-theme-amazing'
            #Bulma: 'https://bulma.io'
    # Latest comment widget configurations
    -
        # Where should the widget be placed, left sidebar or right sidebar
        position: right
        type: latest_comment
    # Recent posts widget configurations
    -
        # Where should the widget be placed, left sidebar or right sidebar
        position: right
        type: recent_posts
    # Categories widget configurations
    -
        # Where should the widget be placed, left sidebar or right sidebar
        position: right
        type: categories
    # Archives widget configurations
    -
        # Where should the widget be placed, left sidebar or right sidebar
        position: right
        type: archives
    # Tags widget configurations
    -
        # Where should the widget be placed, left sidebar or right sidebar
        position: right
        type: tags
    # Google FeedBurner email subscription widget configurations
    -
        # Where should the widget be placed, left sidebar or right sidebar
        position: right
        type: subscribe_email
        # Hint text under the email input
        description: 
        # Feedburner ID
        feedburner_id: ''
    # Google AdSense unit configurations
    -
        # Where should the widget be placed, left sidebar or right sidebar
        position: right
        type: adsense

# AdSense client ID
#adsense_client_id: #'ca-pub7634'
# AdSense AD unit ID
#adsense_slot_id: '5588'
# article head ad
#article_head_has_ad: true
# comment head ad
#comment_head_has_ad: true
# other ad
#index_zero_position_ad: true
#index_ad_positions: 2,5,9 #首页adsense放置广告的位置，尽量少配置些，多了有可能不显示。一位的时候，加个逗号，如1,或者1,5,9
# Plugin configurations
# https://ppoffice.github.io/hexo-theme-icarus/categories/Plugins/
plugins:
    # Enable page startup animations
    animejs: true
    # Show the "back to top" button
    back_to_top: true
    # Baidu Analytics plugin settings
    # https://tongji.baidu.com
    baidu_analytics:
        # Baidu Analytics tracking ID
        tracking_id: 
    # BuSuanZi site/page view counter
    # https://busuanzi.ibruce.info
    busuanzi: true
    # CNZZ statistics
    # https://www.umeng.com/web
    cnzz:
        # CNZZ tracker id
        id: 
        # CNZZ website id
        web_id: 
    # Enable the lightGallery and Justified Gallery plugins
    gallery: true
    # Google Analytics plugin settings
    # https://analytics.google.com
    google_analytics:
        # Google Analytics tracking ID
        tracking_id: 
    # Hotjar user feedback plugin
    # https://www.hotjar.com/
    hotjar:
        # Hotjar site id
        site_id: 
    # Enable the KaTeX math typesetting supprot
    # https://katex.org/
    katex: false
    # Enable the MathJax math typesetting support
    # https://www.mathjax.org/
    mathjax: false
    # Enable the Outdated Browser plugin
    # http://outdatedbrowser.com/
    outdated_browser: false
    # Show a progress bar at top of the page on page loading
    progressbar: true
# CDN provider settings
# https://ppoffice.github.io/hexo-theme-icarus/Configuration/Theme/speed-up-your-site-with-custom-cdn/
providers:
    # Name or URL template of the JavaScript and/or stylesheet CDN provider
    cdn: loli
    # Name or URL template of the webfont CDN provider
    fontcdn: loli
    # Name or URL of the fontawesome icon font CDN provider
    iconcdn: loli
    # https://cdn.jsdelivr.net/gh/removeif/removeif.github.io@v1.0.6/json_data/record.json, cdn前缀，对于hexo new page 页面中引用的资源文件不生效，需要手动改，如friend友链页中引用的资源
    # my_cdn_pre: https://cdn.jsdelivr.net/gh/removeif/removeif-demo@v1.0.8/ #https://cdn.jsdelivr.net/gh/removeif/removeif.github.io@v2.2.1


#footer_copyright_dsec: © 版权说明：[本网站所有内容均收集于互联网或自己创作,<br />&nbsp;&nbsp;&nbsp;&nbsp;方便于网友与自己学习交流，如有侵权，请<a href="/message" target="_blank">留言</a>，立即处理]<br /> #footer 版权说明 可自由配置
website_start_time: 2018/11/11 00:00:00 #网站运行开始时间,不填不显示
#footer_registered_no: 川ICP备88888888号-8（测试） #备案号
#side_music_netease_id: 2364053447 #侧边栏网易云歌单id
busuanzi_only_count: false #当上面plugins中busuanzi: true时，此配置busuanzi_only_count为true时，网站不显示不蒜子统计数据，但是会每次统计。false时显示统计数据。
has_live_2D_switch: true #live2D开关 true-开 false-关
use_pjax: true #是否pjax


#-----------------------
# 这些是我自己对页面设置的一些配置
# 更加详细的内容请看博主的帖子:https://removeif.github.io/theme/%E5%8D%9A%E5%AE%A2%E6%BA%90%E7%A0%81%E5%88%86%E4%BA%AB.html
#-----------------------
```

#### 配置hexo
---
```config _config.yml配置文件 >folded
# 这个_config.yml文件是在Blog下的,是配置hexo的,要和配置主题的_config.yml区分开来
# 配置完主题就可以设置一些hexo的东西了(配置主题和配置hexo的顺序可以调换过来)

# URL
## Set your site url here. For example, if you use GitHub Page, set url as 'https://username.github.io/project'

# 注意:这个地方不要设置成
# https://zhangpf2000.github.io/root
# root: /root
# 博主也没设置,如果添加上root或其他,会导致部分博客其他某些地方出现错误,无法加载数据资源等
url: https://zhangpf2000.github.io
root: /
permalink: :year/:month/:day/:title/
permalink_defaults:
pretty_urls:
  trailing_index: true # Set to false to remove trailing 'index.html' from permalinks
  trailing_html: true # Set to false to remove trailing '.html' from permalinks


# Extensions
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
theme: amazing
# 使用主题: amazing


# Deployment
# 这个是使用github的时候设置的
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  repo: https://github.com/ZhangPF2000/ZhangPF2000.github.io.git
  branch: main
```

#### Github
---
```txt github >folded
1->注册帐号
2->创建<username>.github.io仓库
3->配置好git用户名/邮箱和ssh设置,确保你的git能链接到你的github
4->配置_config.yml中的远程仓库信息
5->hexo clean
6->hexo g
7->hexo d
```

### 希望能对你有所帮助 (p_o)