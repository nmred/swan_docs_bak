REDIS 编译安装说明
------------------

1. 由于是在 x64 下编译，需要修改 src/Makefile 文件

 将 OPT 修改为 OPT=-O2 -march=i686

2. make && make test 在test的时候可能会出现tcl版本低的现象，安装[tcl][tcl]

需要注意 redis 的安装方法

	make PREFIX=/usr/local/dev_swan/opt/redis/ install

3. 复制配置文件（一般是打包的时候覆盖）

[tcl]: http://www.linuxfromscratch.org/blfs/view/cvs/general/tcl.html
