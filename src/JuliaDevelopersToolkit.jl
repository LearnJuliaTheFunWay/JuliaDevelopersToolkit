module JuliaDevelopersToolkit

using Dates

greet() = "Hello World!"

last_update() = """
    Last Update: $(now())
    """

current_julia_version_zh() = """
    本书所使用的 Julia 版本为 $VERSION ，建议读者阅读本书时使用该版本或者是更新的版本。
    """

end # module
