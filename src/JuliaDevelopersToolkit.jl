module JuliaDevelopersToolkit

using Books

greet() = "Hello World!"

project_path(dir) = joinpath(pkgdir(JuliaDevelopersToolkit), dir)

function copy_homepage_files(build_path)
    from_dir = joinpath(pkgdir(JuliaDevelopersToolkit), "homepage")
    from_file(file) = joinpath(from_dir, file)
    to_file(file) = joinpath(build_path, file)
    copy(file) = cp(from_file(file), to_file(file); force=true)

    files = ["index.html", "manifest.json", "custom.css"]
    copy.(files)
end

function move_build_to_tmp(build_path, tmp_path)
    mv(build_path, tmp_path; force=true)
    mkpath(build_path)
end

function move_tmp_to_build(tmp_path, build_path, locale::AbstractString)
    locale_path = joinpath(build_path, locale)
    mv(tmp_path, locale_path; force=true)
end

function build()
    println("Running gen(; M=JuliaDevelopersToolkit, project=\"default\")")
    M = JuliaDevelopersToolkit
    build_path = project_path("build")

    # Both EN and ZH projects are assumed to contain the same `.include` statements.
    # It is possible to run `gen` for both projects without problems, but it would increase
    # CI running time.
    gen(; M, project="default", fail_on_error=true)

    # Below, we place the EN and ZH files in subdirs of the build dir and put the default
    # homepage in the right place.
    Books.build_all(; project="default")
    tmp_en_path = project_path("tmp_en")
    move_build_to_tmp(build_path, tmp_en_path)

    Books.build_all(; project="zh")
    tmp_zh_path = project_path("tmp_zh")
    move_build_to_tmp(build_path, tmp_zh_path)

    move_tmp_to_build(tmp_en_path, build_path, "en")
    move_tmp_to_build(tmp_zh_path, build_path, "zh")

    copy_homepage_files(build_path)
    nothing
end

end # module
