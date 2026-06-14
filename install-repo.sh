#!/data/data/com.termux/files/usr/bin/bash
# File       : install-repo.sh
# Author     : luisadha
# Create date:  15-Jun-2026 
# Get some needed tools. coreutils for mkdir command, gnugp for the signing key, and apt-transport-https to actually connect to the repo
pkg i wget -y
#gnupg
[ ! -d $PREFIX/etc/apt/sources.list.d ] && mkdir $PREFIX/etc/apt/sources.list.d
# Write the needed source file
if [ ! -f "$PREFIX/etc/apt/sources.list.d/rendiix.list" ]; then
	echo "deb [trusted=yes] https://repo.luisadha.dev/ stable main" > $PREFIX/etc/apt/sources.list.d/luisadha.list
   # wget -qP $PREFIX/etc/apt/trusted.gpg.d https://repo.luisadha.dev/luisadha.gpg
	apt update
else 
	echo "repo already installed"
fi 
