APACHE 安装说明
---------------

1. 安装pcre的源码到httpd的安装目录

	./configure --prefix=$INSTALL_PCRE
	make -j $CPU_NUM
	make install

2. 导入apr和apr-utli依赖包

	cp -rf $SRC_APR $INSTALL_APR
	cp -rf $SRC_APR_UTIL  $INSTALL_APR_UTIL

3. 正式的编译安装 APACHE 软件

	./configure \
		--prefix=$INSTALL_HTTPD  \
		--sysconfdir=$ETC_DIR \
		--with-included-apr \
		--enable-so \
		--enable-deflate=shared \
		--enable-expires=shared \
		--enable-rewrite=shared \
		--enable-static-support \
		--enable-cache \
		--enable-disk-cache \
		--enable-mem-cache \
		--with-pcre=$INSTALL_PCRE \
	make -j $CPU_NUM && make install
