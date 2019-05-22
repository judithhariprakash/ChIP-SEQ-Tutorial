cd software
rm -rf meme-5.0.5 memebin
wget http://meme-suite.org/meme-software/5.0.5/meme-5.0.5.tar.gz
tar -zxvf meme-5.0.5.tar.gz
rm meme-5.0.5.tar.gz
mkdir memebin
cd meme-5.0.5
curdir=`pwd`
parentdir="$(dirname "$curdir")"
./configure --prefix=$parentdir/memebin --with-url=http://meme-suite.org/ --enable-build-libxml2 --enable-build-libxslt --with-python=$parentdir/python2/bin/python
make
make install

