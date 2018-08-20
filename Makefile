install-webrtc2sip:
	sudo apt-get install openssl libssl-dev libsrtp0-dev libspeexdsp-dev libvpx-dev liggsm1-dev
	configure-duobango
	configure-webrtc2sip

configure-duobango:
	git clone https://github.com/DuobangoTelecom/duobango.git
	cd duobango
	./autogen.sh && ./configure --with-ssl --with-srtp --with-speexdsp && make && sudo make install
	cd ..

configure-webrtc:
	sudo apt-get install libxml2-dev
	git clone https://github.com/DoubangoTelecom/webrtc2sip
	cd webrtc2sip
	export PREFIX=/usr/local/opt/webrtc2sip cd webrtc2sip && ./autogen.sh && ./configure --prefix=$PREFIX && make clean && make && sudo make install cp -f ./config.xml $PREFIX/sbin/config.xml
	