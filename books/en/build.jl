using Books
using JuliaDevelopersToolkit

if Books.is_ci()
    Books.install_dependencies()
end

Books.gen(;M=JuliaDevelopersToolkit, fail_on_error=true)
Books.build_all()