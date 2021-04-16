module JuliaDevelopersToolkit

using Books

greet() = "Hello World!"

function copy_homepage_files(build_dir)
    from_dir = joinpath(pkgdir(JuliaDevelopersToolkit), "homepage")
    from_file(file) = joinpath(from_dir, file)
    to_file(file) = joinpath(build_dir, file)
    copy(file) = cp(from_file(file), to_file(file))

    files = ["index.html", "manifest.json", "custom.css", "images"]
    copy.(files)
end

function build()
    println("Running gen(; M=JuliaDevelopersToolkit, project=\"default\")")
    M = JuliaDevelopersToolkit
    # Both EN and ZH projects are assumed to contain the same `.include` statements.
    # It is possible to run `gen` for both projects without problems, but it would increase
    # CI running time.
    gen(; M, project="default", fail_on_error=true)

    # Build ZH project and put it in temporary directory.
    Books.build_all(; project="zh")
    tmp_zh_dir = joinpath(pkgdir(M), "tmp_zh")
    build_dir = joinpath(pkgdir(M), "build")
    mv(build_dir, tmp_zh_dir; force=true)

    # Build EN project and put ZH project in a subdir of build.
    Books.build_all(; project="default")
    zh_dir = joinpath(build_dir, "zh")
    mv(tmp_zh_dir, zh_dir; force=true)

    copy_homepage_files(build_dir)
    nothing
end

end # module
