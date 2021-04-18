# 准备 Julia 运行环境

```{.include}
_gen/current_julia_version_zh.md
```

这一章主要介绍如何配置基本的 Julia 开发环境，以及一些常见的开发工具。

## 本地安装

官方推荐的安装方式是，前往[下载](https://julialang.org/downloads/#current_stable_release)页面，根据你当前的操作系统，下载对应的预编译好的文件，解压后将其中的 `bin` 子目录添加到**环境变量**中，然后重启命令行，执行 `julia` 即可进入 [`REPL`](@sec:REPL) 。

不过国内其实已经有不少高校提供了镜像资源，在网络环境不太好的时候，大家可以直接从镜像站下载。以下是一些常见 Julia 二进制文件的镜像链接：

- [bfsu](https://mirrors.bfsu.edu.cn/julia-releases/bin/)
- [tuna](https://mirrors.tuna.tsinghua.edu.cn/julia-releases/bin/)
- [sjtug](https://mirrors.sjtug.sjtu.edu.cn/julia-releases/bin/)
- [ustc](https://mirrors.ustc.edu.cn/julia-releases/bin/)
- [opentuna](https://opentuna.cn/julia-releases/bin/)

当然，有一些脚本可以帮我们地完成上面的步骤，这在某些自动化的流程中非常有用。

- [jill.sh](https://github.com/abelsiqueira/jill)
- [jill.py](https://github.com/johnnychen94/jill.py)
- [jvc](https://github.com/songxianxu/jvc)

## Jupyter Notebook

## Pluto Notebook

## VSCode

## 其它在线服务
