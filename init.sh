#!/bin/bash
if [ -z $script_url ];then
    export script_url="https://raw.github.com/k1LoW/devlocal/master/"
fi

tmp=`cat /etc/issue | head -n 1`
DIST=`echo $tmp | awk '{print $1}'`

if [[ $DIST =~ "CentOS" ]]; then
    curl $script_url/centos.sh|bash
elif [[ $DIST =~ "Ubuntu" ]]; then
    curl $script_url/ubuntu.sh|bash
fi

DEVLOCAL=$HOME/.devlocal
mkdir -p $DEVLOCAL/source

export PATH="$DEVLOCAL/bin:$PATH"

# git
cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/git.tar.gz "https://git-core.googlecode.com/files/git-1.9.0.tar.gz"
tar xzvf git.tar.gz
cd git-1.9.0
./configure --prefix=$DEVLOCAL
make
make install

# ctags
cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/ctags.tar.gz "http://hp.vector.co.jp/authors/VA025040/ctags/downloads/ctags-5.8j2.tar.gz"
tar xzvf ctags.tar.gz
cd ctags-5.8j2.tar.gz
./configure --prefix=$DEVLOCAL
make
make install

# zsh
cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/zsh.tar.gz "http://downloads.sourceforge.net/project/zsh/zsh/5.0.5/zsh-5.0.5.tar.gz?r=&ts=1394454707&use_mirror=jaist"
tar xzvf zsh.tar.gz
cd zsh-5.0.5
./configure --prefix=$DEVLOCAL --enable-multibyte --enable-locale
make
make install

# autoconf
Bcd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/autoconf.tar.gz "http://ftp.jaist.ac.jp/pub/GNU/autoconf/autoconf-2.69.tar.gz"
tar xzvf autoconf.tar.gz
cd autoconf-2.69
./configure --prefix=$DEVLOCAL
make
make install

# emacs
cd $DEVLOCAL/source
git clone --depth 1 git://git.savannah.gnu.org/emacs.git
cd emacs
./autogen.sh
LIBS=-ltinfo ./configure --prefix=$DEVLOCAL --without-pop --without-kerberos --without-mmdf --without-sound --without-wide-int --without-xpm --without-jpeg --without-tiff --without-gif --without-png --without-rsvg --without-xml2 --without-imagemagick --without-xft --without-libotf --without-m17n-flt --without-xaw3d --without-xim --without-ns --without-gpm --without-dbus --without-gconf --without-gsettings --without-selinux --without-gnutls --without-makeinfo --without-x
make
make install

# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# homesick
anyenv install rbenv
eval "$(anyenv init -)"
rbenv install 2.1.1 --verbose
rbenv global 2.1.1
rbenv rehash
gem install homesick
rbenv rehash
homesick clone k1LoW/dotfiles
homesick symlink dotfiles --force

# editorconfig
anyenv install ndenv
eval "$(anyenv init -)"
ndenv install v0.11.12 --verbose
ndenv global v0.11.12
ndenv rehash
npm install -g editorconfig
ndenv rehash

echo '$HOME/.devlocal/bin/zsh' >> ~/.bashrc
source ~/.bashrc
