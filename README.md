#   :star: UBEXT :star: 

#### 项目介绍
该项目用于帮助开发者将一台新安装的UBUNTU桌面系统快速改进为开发所用的UBUNTU系统。

#### 安装教程

- 1. 在命令交互行使用以下语句完成下载:
```
git clone https://gitee.com/CCMYLOVE/UBEXT.git
```
#### 使用说明

- 1.控制台优化，设置控制台颜色和交互方式：
执行以下脚本完成控制台优化：
```
$ ./001.setup_shell.sh
```
- 2.国内PPT源替换，使用国内PPT源：
```
$ ./002.setup_apt.sh
```
> 注意：目前只支持Ubuntu 14.04，后续会做相应升级调整！
- 3.安装64位开发必须工具，64位Ubuntu系统需要执行：
```
$ ./003.install_tools_64bits.sh
```
- 4.安装32位开发必须工具，32位Ubuntu系统需要执行：
```
$ ./004.install_tools_32bits.sh
```
- 5.设置VIM工具，增加颜色、cscope、ctags集成:
```
$ ./005.setup_vim.sh
```
- 6.设置默认GCC/G++工具链，针对Linux/Android的SDK编译时编译器版本问题:
```
$ ./006.setup_gcc.sh
```
- 7.版本管理工具git的设置:

```
$ ./007.setup_git.sh

```
> 该工具假设/home/git目录为git服务器所在目录，提供以下3个命令：
> dugi.001.create_git_bare.sh，在/home/git/src目录创建git源码空库；
> dugi.002.clone_git_source.sh，在当前目录克隆源码库；
> dugi.003.keep_git_emptydir.sh，解决git无法跟踪空目录问题，对rootfs递交影响大。
- 8.配置samba服务器：
```
$ ./008.setup_samba.sh
```
- 9.重启samba服务器：
```
$./009.restart_samba.sh
```

#### 码云特技

1. 使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2. 码云官方博客 [blog.gitee.com](https://blog.gitee.com)
3. 你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解码云上的优秀开源项目
4. [GVP](https://gitee.com/gvp) 全称是码云最有价值开源项目，是码云综合评定出的优秀开源项目
5. 码云官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6. 码云封面人物是一档用来展示码云会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)