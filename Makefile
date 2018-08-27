configure-ssl:
	# wget -U mozilla http://www.openssl.org/source/openssl-10..1c.tar.gz
	# tar -xvzf openssl-1.0.1c.tar.gz && cd openssl-1.0.1c && ./config shared --prefix=/usr/local --openssldir=/usr/local/openssl && make && sudo make install_sw
	# cd ..
	cd ~/
	git clone https://github.com/openssl/openssl ~/openssl
	cd ~/openssl && ./config shared --prefix=/usr/local --openssldir=/usr/local/shared/doc/openssl && make && sudo make install
	cd ..

configure-libsrtp:
	cd ~/
	git clone http://github.com/cisco/libsrtp ~/libsrtp
	cd ~/libsrtp && git checkout v1.5.0 && CFLAGS="-fPIC" && ./configure --enable-pic && make && sudo make install
	cd ..

configure-duobango:
	cd ~/
	git clone https://github.com/DuobangoTelecom/duobango ~/duobango
	cd ~/duobango  && ./autogen.sh && ./configure --with-ssl --with-srtp --with-speexdsp && make && sudo make install
	cd ..

configure-webrtc:
	cd ~/
	sudo apt-get install libxml2-dev
	git clone https://github.com/DoubangoTelecom/webrtc2sip ~/webrtc2sip
	cd ~/webrtc2sip && export PREFIX=/usr/local/opt/webrtc2sip && ./autogen.sh && ./configure  --with-doubango=/usr/localopt CFLAGS='-lpthread' LDFLAGS='-ldl' LIBS='-ldl' --prefix=$PREFIX && make clean && make && sudo make install cp -f ../config.xml $PREFIX/sbin/config.xml
	cd ..

install:
	sudo apt-get install git pkg-config make openssl libssl1.0-dev libsrtp0-dev libspeexdsp-dev libvpx-dev build-essential autoconf libtool subversion cvs wget
	make configure-ssl
	make configure-libsrtp
	make configure-duobango
	make configure-webrtc2sip