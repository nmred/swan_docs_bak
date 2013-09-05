MYSQL 5.5 安装说明
------------------

MYSQL 采用二进制源码安装，即直接将源码拷贝到对应的目录

删除一些没用的文件或对打包影响的文件：

	rm -rf $INSTALL_MYSQL/mysql-test
	rm -rf $INSTALL_MYSQL/lib/plugin/libdaemon_example*
