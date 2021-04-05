using Books
using JuliaDevelopersToolkit

Books.install_dependencies()
Books.gen(;M=JuliaDevelopersToolkit, fail_on_error=true)
Books.build_all()