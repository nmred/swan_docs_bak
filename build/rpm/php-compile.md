PHP 编译安装说明
----------------

###编译前需要安装编译的软件

- **jpeg-6b**
 - 加入时间: 2013-03-28
 - 更新时间: 2013-03-28
 - 依赖模块：GD库
 - [下载地址][jpeg-download]
 - 编译方法: 需要创建 $INSTALL\_JPEG、$INSTALL\_JPEG/bin、$INSTALL\_JPEG\/lib、$INSTALL\_JPEG/include、$INSTALL\_JPEG/man、$INSTALL\_JPEG/man1、$INSTALL\_JPEG/man/man1目录在编译前，然后执行

	./configure --prefix=$INSTALL_JPEG \
	--enable-shared \
	--enable-static \
	make -j $CPU_NUM && make install

- **png**
 - 加入时间: 2013-03-28
 - 更新时间: 2013-03-28
 - 依赖模块：GD库
 - [下载地址][png-download]
 - 编译方法:

	[shell]
	# 需要把配置 makefile
	cp scripts/makefile.std makefile
	./configure --prefix=$INSTALL_LIBPNG 
	make -j $CPU_NUM && make install

- **freetype**
 - 加入时间: 2013-03-28
 - 更新时间: 2013-03-28
 - 依赖模块：GD库
 - [下载地址][freetype-download]
 - 编译方法:

	# 需要建立目录
	mkdir $INSTALL_FREETYPE
	./configure --prefix=$INSTALL_FREETYPE 
	make -j $CPU_NUM && make install

- **zlib**
 - 加入时间: 2013-03-28
 - 更新时间: 2013-03-28
 - 依赖模块：GD库
 - [下载地址][zlib-download]
 - 编译方法:

	# 需要建立目录
	mkdir $INSTALL_ZLIB
	./configure --prefix=$INSTALL_ZLIB 
	make -j $CPU_NUM && make install

- **gd**
 - 加入时间: 2013-03-28
 - 更新时间: 2013-03-28
 - 依赖模块：PHP GD 扩展
 - [下载地址][gd-download]
 - 编译方法:

	# 需要建立目录
	mkdir $INSTALL_GD
	./configure --prefix=$INSTALL_GD \
	  --with-jpeg=$INSTALL_JPEG \
	  --with-png=$INSTALL_LIBPNG \
	  --with-zlib=$INSTALL_ZLIB \
	  --with-freetype=$INSTALL_FREETYPE \
	make -j $CPU_NUM && make install

- **libxml2**
 - 加入时间: 2013-03-28
 - 更新时间: 2013-03-28
 - 依赖模块：PHP XML 扩展
 - [下载地址][libxml2-download]
 - 编译方法:

	# 需要建立目录
	mkdir $INSTALL_LIBXML
	./configure --prefix=$INSTALL_LIBXML
	make -j $CPU_NUM && make install

- **libxstl**
 - 加入时间: 2013-08-25
 - 更新时间: 2013-08-26
 - 依赖模块：PHP XSL 扩展
 - [下载地址][libxstl-download]
 - 编译方法: 必须先编译 [libxml2][libxml2] 因为依赖这个库

	# 需要建立目录
	mkdir $INSTALL_LIBXSLT
	./configure --prefix=$INSTALL_LIBXSLT \
		--with-libxml-prefix=$INSTALL_LIBXML \
		--with-libxml-include-prefix=$INSTALL_LIBXML/include \
		--with-libxml-libs-prefix=$INSTALL_LIBXML/lib
	make -j $CPU_NUM && make install

- **openssl (默认安装到系统中)**
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - 依赖模块：PHP EVENT / OPENSSL 扩展
 - 编译方法: 

	# 默认安装到系统中
	yum -y install openssl openssl-devel

- **libevent**
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - 依赖模块：PHP EVENT EIO 扩展
 - [下载地址][libevent-download]
 - 编译方法: 

	# 默认安装到系统中
	./configure --prefix=$INSTALL_LIBEVENT 
	make -j $CPU_NUM && make install

- **zmq**
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - 依赖模块：PHP ZMQ 扩展
 - [下载地址][zmq-download]
 - 编译方法: 需要注意 zmq 的单元测试文件错误  test_connect_delay.cpp , 需要在文件末尾加上空行 

	# 默认安装到系统中
	cp $FIXED_BUG_DIR/zmq/test_connect_delay.cpp $SRC_ZMQ/tests/test_connect_delay.cpp
	./configure --prefix=$INSTALL_ZMQ 
	make -j $CPU_NUM && make install

###PHP编译安装

- **修正一些bug 错误**


gd_io.h 在 build_rpm 库中存放

	cp ${OPENSOURCE}gd_io.h $INSTALL_GD/include

- **将静态编译的扩展源码拷贝到 ext 目录**


pthreads 扩展

	mkdir $INSTALL_EXT/pthreads
	cp -r $SRC_PTHREADS $INSTALL_EXT

- 开始生成 Makefile 配置
 - with-config-file-path: 配置文件位置
 - enable-maintainer-zts : 线程安全模式
 - enable-pthreads: PHP 多线程开发支持，需要将扩展安装到 ext 目录
 - with-mysql: MYSQL 扩展
 - with-pdo-mysql: MYSQL-PDO 扩展
 - with-apxs2: APACHE 扩展
 - enable-ftp: FTP 相关方法支持
 - with-gettext: 多语言支持
 - enable-shmop：共享内存支持
 - enable-pcntl：进程控制扩展
 - with-libxml-dir: libXML 扩展
 - enable-soap: SOAP 扩展
 - with-gd: GD 库扩展
 - with-snmp: SNMP 扩展
 - with-jpeg-dir: GD 库支持类型
 - with-png-dir: GD 库支持类型
 - with-zlib-dir: GD 库编译所需库
 - with-freetype-dir: GD 库编译所需库
 - enable-mbstring: MB 扩展
 - enable-sockets: SOCKET 扩展 
 - with-xsl: XSL 扩展 

	./configure --prefix=$INSTALL_PHP \
		--with-config-file-path=$ETC_DIR \
		--enable-maintainer-zts \
		--enable-pthreads \
		--with-pdo-mysql=$INSTALL_MYSQL \
		--with-mysql=$INSTALL_MYSQL \
		--with-apxs2=$INSTALL_HTTPD/bin/apxs \
		--enable-ftp \
		--with-gettext \
		--enable-shmop \
		--enable-pcntl \
		--with-libxml-dir=$INSTALL_LIBXML \
		--enable-soap \
		--with-gd=$INSTALL_GD \
		--with-snmp=$INSTALL_SNMP \
		--with-jpeg-dir=$INSTALL_JPEG \
		--with-zlib-dir=$INSTALL_ZLIB \
		--with-png-dir=$INSTALL_LIBPNG \
		--with-freetype-dir=$INSTALL_FREETYPE \
		--enable-mbstring \
		--enable-sockets \
		--with-xsl=$INSTALL_LIBXSLT \
	aclocal && autoconf
	make && make install


###PHP编译安装后的需要安装的扩展

- event
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - [下载地址][event-download]
 - 编译方法: 

	$INSTALL_PHP/bin/phpize
	./configure --with-php-config=$INSTALL_PHP/bin/php-config \
		--with-event-libevent-dir=$INSTALL_LIBEVENT \
	make -j $CPU_NUM && make install

- php-zmq
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - [下载地址][php-zmq-download]
 - 编译方法: 

	$INSTALL_PHP/bin/phpize
	./configure --with-php-config=$INSTALL_PHP/bin/php-config \
		--with-zmq=$INSTALL_LIBEVENT \
	make -j $CPU_NUM && make install

- eio
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - [下载地址][eio-download]
 - 编译方法: 

	$INSTALL_PHP/bin/phpize
	./configure --with-php-config=$INSTALL_PHP/bin/php-config \
	make -j $CPU_NUM && make install

- redis
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - [下载地址][redis-download]
 - 编译方法: 

	$INSTALL_PHP/bin/phpize
	./configure --with-php-config=$INSTALL_PHP/bin/php-config \
	make -j $CPU_NUM && make install

- xdebug
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - [下载地址][xdebug-download]
 - 编译方法: 

	$INSTALL_PHP/bin/phpize
	./configure --with-php-config=$INSTALL_PHP/bin/php-config \
	make -j $CPU_NUM && make install

###PEAR 安装 (安装好PHP 进行手动安装)

- **PHPUnit**
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - 配置：php.ini includes='/usr/local/dev_swan/opt/php/lib/php/'
 - 安装方法: 

	pear config-set auto_discover 1
	pear install pear.phpunit.de/PHPUnit
	pear install phpunit/DbUnit

- **PHP_CodeCoverage**
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - 配置：php.ini includes='/usr/local/dev_swan/opt/php/lib/php/'
 - 安装方法: 

	pear config-set auto_discover 1
	pear install pear.phpunit.de/PHP_CodeCoverage

- **PHP_UML**
 - 加入时间: 2013-08-26
 - 更新时间: 2013-08-26
 - 安装方法: 

	pear config-set auto_discover 1
	pear install PHP_UML
	



[jpeg-download]: http://code.google.com/p/google-desktop-for-linux-mirror/downloads/detail?name=jpeg-6b.tar.gz&can=2&q
[png-download]: http://www.libpng.org/pub/png/libpng.html
[freetype-download]: http://www.freetype.org/download.html
[zlib-download]:http://www.zlib.net/
[gd-download]: http://libgd.bitbucket.org/
[libxml2-download]: http://www.xmlsoft.org/
[libxstl-download]: http://www.xmlsoft.org/
[libevent-download]: https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
[event-download]: http://pecl.php.net/get/event
[zeromq-download]: http://download.zeromq.org/zeromq-3.2.3.tar.gz
[php-zmq-download]:https://github.com/mkoppanen/php-zmq
[eio-download]: http://pecl.php.net/get/eio
[xdebug-download]: http://xdebug.org/files/xdebug-2.2.3.tgz
