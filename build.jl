using Books
using JuliaDevelopersToolkit

function install_fonts()
    @info "installing font[NotoSerifCJKsc]..."
    fonts_dir = joinpath(homedir(), ".fonts")
    run(`wget -q -O tmp.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKsc-hinted.zip`)
    run(`unzip tmp.zip -d $(joinpath(fonts_dir, "NotoSerifCJKsc"))`)
    run(`rm tmp.zip`)
    run(`fc-cache --verbose $fonts_dir`)
end

function build()
    Books.is_ci() && install_fonts()

    @info "building default Chinese version..."
    mkpath("build")
    gen(; M=JuliaDevelopersToolkit, project="default", fail_on_error=true)
    Books.build_all(; project="default")
    mv("build", "homepage/zh"; force=true)

    @info "building English version..."
    mkpath("build")
    gen(; M=JuliaDevelopersToolkit, project="en", fail_on_error=true)
    Books.build_all(; project="en")
    mv("build", "homepage/en"; force=true)
end

build()