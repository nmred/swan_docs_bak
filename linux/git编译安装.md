git编译安装
-----------

1.下载git源码：

	[shell]
	$wget http://down1.chinaunix.net/distfiles/git-1.7.9.7.tar.gz

2.安装依赖的软件包：

	[shell]
	$yum -y install curl-devel expat-devel gettext-devel  openssl-devel zlib-devel

3.配置编译安装:
	
	[shell]
	$./configure –prefix=/usr/local
	$make && make install

