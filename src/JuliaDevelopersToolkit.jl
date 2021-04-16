module JuliaDevelopersToolkit

using Books

greet() = "Hello World!"

function copy_homepage_files(build_dir)
    from_dir = joinpath(pkgdir(JuliaDevelopersToolkit), "homepage")
    from_file(file) = joinpath(from_dir, file)
    to_file(file) = joinpath(build_dir, file)
    copy(file) = cp(from_file(file), to_file(file))

    files = ["index.html", "manifest.json", "custom.css"]
    copy.(files)
end

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

    copy_homepage_files(build_dir)
    nothing
end

end # module
