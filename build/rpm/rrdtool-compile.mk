RRDTOOL 安装说明
----------------

(目前未安装)

1. 用 yum 安装相关的依赖
	
注意：
在 centos5.5中千万不要用互联网 yum 更新 gcc* 会出现httpd不能编译的情况，（待找解决办法）

	yum install -y cairo-devel libxml2-devel pango-devel pango libpng-devel freetype freetype-devel libart_lgpl-devel pear pear-devel

2. 编译安装

	./configure –disable-perl –disable-ruby –disable-lua –disable-python –prefix=/usr/local/dev_swan/opt/rrdtool
	make && make install
