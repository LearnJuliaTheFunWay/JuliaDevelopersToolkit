using Books
using JuliaDevelopersToolkit

function install_fonts()
    fonts_dir = joinpath(homedir(), ".fonts")
    run(`wget -q -O tmp.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKsc-hinted.zip`)
    run(`unzip tmp.zip $fonts_dir`)
    run(`rm tmp.zip`)
    run(`wget -q -O tmp.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKsc-hinted.zip`)
    run(`unzip tmp.zip $fonts_dir`)
    run(`rm tmp.zip`)
    run(`fc-cache --verbose $fonts_dir`)
end

if Books.is_ci()
    Books.install_dependencies()
    install_fonts()
end

Books.gen(;M=JuliaDevelopersToolkit, fail_on_error=true)
Books.build_all()