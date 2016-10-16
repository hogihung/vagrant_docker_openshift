# Install Git 2.8.x
sudo yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel
sudo yum install -y gcc perl-ExtUtils-MakeMaker
cd /usr/src
sudo wget https://www.kernel.org/pub/software/scm/git/git-2.8.1.tar.gz
sudo tar xzf git-2.8.1.tar.gz
cd git-2.8.1
sudo make prefix=/usr/local/git all
sudo make prefix=/usr/local/git install
sudo echo "export PATH=\$PATH:/usr/local/git/bin" >> /etc/bashrc
sudo mv /usr/bin/git /usr/bin/git.orig
sudo ln -s /usr/local/git/bin/git /usr/bin/git
