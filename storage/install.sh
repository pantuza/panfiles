#
# Script to install dropbox on KDE environment
# 

PKG_URL="http://www.getdropbox.com/download?plat=lnx.x86_64"

cd $HOME
wget -o Downloads/dropbox.gz $PKG_URL
tar -xzvf Downloads/dropbox.gz
ln -sv .dropbox-dist/dropboxd .kde/Autostart/dropboxd
.dropbox-dist/dropboxd &
