DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
if [ ! -f libtermbox.a ] || [ "$1" == "-f" ]; then
    git clone https://github.com/nsf/termbox.git termbox_c_src
    cd termbox_c_src
    ./waf configure
    ./waf install --targets=termbox_static
    mv build/src/libtermbox.a ..
    cd ..
    rm -rf termbox_c_src
fi
