module JuliaDevelopersToolkit

using Books

greet() = "Hello World!"

function build()
    println("Running gen(; M=JuliaDevelopersToolkit, project=\"default\")")
    M = JuliaDevelopersToolkit
    # Both EN and ZH projects are assumed to contain the same `.include` statements.
    # It is possible to run `gen` for both projects without problems, but it would increase
    # CI running time.
    gen(; M, project="default", fail_on_error=true)

    Books.build_all(; project="default")
    build_dir = joinpath(pkgdir(M), "build")
    en_dir = joinpath(build_dir, "en")
    tmp_en_dir = joinpath(pkgdir(M), "tmp_en")
    mv(build_dir, tmp_en_dir; force=true)

    Books.build_all(; project="zh")
    tmp_zh_dir = joinpath(pkgdir(M), "tmp_zh")
    mv(build_dir, tmp_zh_dir; force=true)
    mkpath(build_dir)
    zh_dir = joinpath(build_dir, "zh")
    mv(tmp_zh_dir, zh_dir; force=true)
    mv(tmp_en_dir, en_dir; force=true)

    # This index file should be the multilingual file, so we can copy it from either the EN
    # or ZH project.
    index_from = joinpath(en_dir, "index.html")
    index_to = joinpath(build_dir, "index.html")
    mv(index_from, index_to; force=true)
end

end # module
