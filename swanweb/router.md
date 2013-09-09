SWANWEB 项目路由整体规划
------------------------

###项目简介

SWANWEB 项目是为了满足团队内部文档、博客、官方网站等功能开发的不依赖任何数据库纯文本站点。内部实现主要是遵守 Markdown 协议，对基本协议进行进一步的扩展。
本项目也是完全开源的，代码托管地址：[swanweb][swanweb]

###项目主要功能模块

1. 官网首页

(index) 页面

2. 博客内容展示列表

3. 博客内容

4. API 手册


###Markdown 路由规则

1. 设立特殊页面

主要是官网首页等一些信息 (目录在该库的 \_\_swan 中)

2. 常规页面

常规页面规则是 

- /[目录]/[目录].../文件名(去掉后缀)

- 其中有一别名是 /[文件名]   前提是该文件名唯一，如果在多个目录中有该文件，直接将其列表列出


###Markdown 头信息约定

头部以 


	<!--
		ctime: [文件创建时间]
		cate : [文件分类,用逗号分割可以添加多个]
		........

	-->
	

开始，结尾空1各空行结束


[swanweb]:https://github.com/nmred/swanweb



<!--
	ctime: Mon Sep  9 23:24:15 CST 2013
	cate : 1, 2, 3 
-->