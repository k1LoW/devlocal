#!/bin/bash
sudo yum -y install gcc make openssl-devel zlib-devel ncurses-devel perl-devel gettext-devel curl-devel expat-devel

DEVLOCAL=$HOME/.devlocal
mkdir -p $DEVLOCAL/source

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/git.tar.gz "https://git-core.googlecode.com/files/git-1.9.0.tar.gz"
tar xzvf git.tar.gz
cd git-1.9.0
./configure --prefix=$DEVLOCAL
make
make install

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/zsh.tar.gz "http://downloads.sourceforge.net/project/zsh/zsh/5.0.5/zsh-5.0.5.tar.gz?r=&ts=1394454707&use_mirror=jaist"
tar xzvf zsh.tar.gz
cd zsh-5.0.5
./configure --prefix=$DEVLOCAL --enable-multibyte --enable-locale
make
make install

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/emacs.tar.gz "http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-24.3.tar.gz"
tar xzvf emacs.tar.gz
cd emacs-24.3
LIBS=-ltinfo ./configure --prefix=$DEVLOCAL --without-pop --without-kerberos --without-mmdf --without-sound --without-wide-int --without-xpm --without-jpeg --without-tiff --without-gif --without-png --without-rsvg --without-xml2 --without-imagemagick --without-xft --without-libotf --without-m17n-flt --without-xaw3d --without-xim --without-ns --without-gpm --without-dbus --without-gconf --without-gsettings --without-selinux --without-gnutls --without-x
make
make install

export PATH="$DEVLOCAL/bin:$PATH"

git clone https://github.com/riywo/anyenv ~/.anyenv

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

anyenv install rbenv
eval "$(anyenv init -)"
rbenv install 2.1.0 --verbose
rbenv global 2.1.0
rbenv rehash
gem install homesick
rbenv rehash
homesick clone k1LoW/dotfiles
homesick symlink dotfiles --force

echo '$HOME/.devlocal/bin/zsh' >> ~/.bashrc
source ~/.bashrc
