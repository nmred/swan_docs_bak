SWAN 产品线打包 RPM 软件说明
----------------------------

整个产品先目前 RPM 包出包流程基本一样，唯一特殊的是 dev\_swan 开发包的流程，因为会依赖自身的一些工具，
而 swansoft 等出包需要安装最新的 dev\_swan 包在对应的打包机器上。

###打包前的预处理 (手动干预)

- **编译 OPT 相关内容**


如果没有更新开源的软件即不用更新，直接将最新的 opt 拷贝到 /usr/local/dev_swan 即可。

如果更新则需要编译，具体的过程参考 [开发环境编译全过程][rpm-all-compile](手动执行脚本)

目前编译的环境需要用 pear 安装的工具不支持自动执行，需要参考build_dev\_swan中的 install\_pear 函数手动执行

开源软件的相关配置：

如果更新了相关的软件需要相应的更新 dev_swan 库中的配置

- **更新 dev_swan 仓库**


为了打包的 dev_swan 工具是最新的，另外需要将代码 make 到目标方便打包工具调用，因为打包工具依赖自身的一些工具。

- **修改打包相关配置**


需要修改 build\_rpm/dev\_swan中一下文件：

core.php 

	[php]
	define('SWAN_VERSION', '0.3.1'); // 版本号
	define('SWANBR_RELEASE', 'realse'); // 软件发行类型


build\_dev\_rpm

	[shell]
	SWANSOFT_VERSION="0.3.1"

- **更新 build\_rpm.log**


###打包的处理过程(自动)

- **脚本打包前的预处理**


删除一些历史打包垃圾文件目录等。

2. 进入dev_swan 仓库生成 Makefile 文件， 做响应的替换处理

需要执行 ./configure -m build_rpm

将所有代码 make 到 /tmp/dev_swan/tmp_dev_swan_git 

将 /tmp/dev_swan/tmp_dev_swan\_git 代码用 build\_tar 工具替换

替换后的代码存放在 /tmp/dev_swan-版本

3. 将 opt 目录拷贝到和 web 目录拷贝到 打包临时目录

4. 创建 tar 包

5. 构建打包 RPM 环境

具体的环境见。

6. 开始执行打包

###打包后的处理

打包后将 rpm 上传到：

- 百度云盘

- sourceforge

#RPM打包参考资料
