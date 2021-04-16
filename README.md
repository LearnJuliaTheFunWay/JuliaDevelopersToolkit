# Welcome

This repo contains the source code for the little book: [Julia Developer's
Toolkit](https://learnjuliathefunway.com/JuliaDevelopersToolkit/).

这里是 [Julia开发者的工具
箱](https://learnjuliathefunway.com/JuliaDevelopersToolkit/) 一书的源码。

## Developer notes

The website is available in English and Zhongwen.
To run the English site locally, ensure that Revise.jl is available in your startup.jl and use
```
julia --project -ie 'using Books; using JuliaDevelopersToolkit; M = JuliaDevelopersToolkit'

julia> serve()
```

Similarily for the Zhongwen site, but then start the server with

```
julia> serve(project="zh")
```

You can also run both servers at the same time since different ports are specified in `Config.toml`.

To generate content, use
```
julia> gen(; M)
```
By default, this will generate the contents for all the `_gen/<function>.md` in the files for the English language.
To generate the contents for ZH, use
```
julia> gen(; M, project="zh")
```
