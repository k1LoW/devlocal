#!/bin/bash
DEVLOCAL=$HOME/.devlocal

export PATH="$DEVLOCAL/bin:$PATH"

# autoconf
cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/autoconf.tar.gz "http://ftp.jaist.ac.jp/pub/GNU/autoconf/autoconf-2.69.tar.gz"
tar xzvf autoconf.tar.gz
cd autoconf-2.69
./configure --prefix=$DEVLOCAL
make
make install

# automake
cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/automake.tar.gz "http://ftp.jaist.ac.jp/pub/GNU/automake/automake-1.15.tar.gz"
tar xzvf automake.tar.gz
cd automake-1.15
./configure --prefix=$DEVLOCAL
make
make install

# emacs
cd $DEVLOCAL/source
git clone --depth 1 git://git.savannah.gnu.org/emacs.git -b emacs-24
cd emacs
./autogen.sh
LIBS=-ltinfo ./configure --prefix=$DEVLOCAL --without-pop --without-kerberos --without-mmdf --without-sound --without-wide-int --without-xpm --without-jpeg --without-tiff --without-gif --without-png --without-rsvg --without-xml2 --without-imagemagick --without-xft --without-libotf --without-m17n-flt --without-xaw3d --without-xim --without-ns --without-gpm --without-dbus --without-gconf --without-gsettings --without-selinux --without-gnutls --without-makeinfo --without-x
make
make install
