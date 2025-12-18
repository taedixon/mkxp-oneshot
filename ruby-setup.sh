# Build OpenSSL 1.x (required to compile/install Ruby 2.5)

if [ ! -d "openssl-1.1.1w" ]; then
	wget https://www.openssl.org/source/openssl-1.1.1w.tar.gz
	tar zxvf openssl-1.1.1w.tar.gz
fi

export OPENSSL=$HOME/.openssl/openssl-1.1.1w

if [ ! -d $OPENSSL ]; then
	cd openssl-1.1.1w
	./config --prefix=$OPENSSL --openssldir=$OPENSSL

	make
	make test

	make install

	cd ..
fi

RUBY_CONFIGURE_OPTS=--with-openssl-dir=$OPENSSL rbenv install 2.5.7