set -e
. ./env.conf
env
root_dir=$(pwd)

curl -L -O https://ftp.gnu.org/gnu/binutils/binutils-2.32.tar.xz
tar xvf binutils-2.32.tar.xz
cd binutils-2.32
mkdir obj-avr; cd obj-avr
../configure --prefix=$PREFIX --target=avr --disable-nls
make -j 8
make install

cd $root_dir
curl -L -O ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-9.1.0/gcc-9.1.0.tar.xz
tar xvf gcc-9.1.0.tar.xz
cd gcc-9.1.0
./contrib/download_prerequisites
mkdir obj-avr; cd obj-avr
../configure --prefix=$PREFIX --target=avr --enable-languages=c,c++ --disable-nls --disable-libssp --with-dwarf2
make -j 8
make install

cd $root_dir
curl -L -O http://download.savannah.gnu.org/releases/avr-libc/avr-libc-2.0.0.tar.bz2
tar xvf avr-libc-2.0.0.tar.bz2
cd avr-libc-2.0.0
mkdir obj-avr; cd obj-avr
../configure --prefix=$PREFIX --build=`../config.guess` --host=avr
make -j 8
make install
cd $root_dir
