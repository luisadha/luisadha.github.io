Author     : luisadha
# Create date:  15-Jun-2026 
# Get some needed tools. coreutils for mkdir command, gnugp for the signing key, and apt-transport-https to actually connect to the repo
pkg i wget -y gnupg
[ ! -d $PREFIX/etc/apt/sources.list.d ] && mkdir $PREFIX/etc/apt/sources.list.d
# Write the needed source file
if [ ! -f "$PREFIX/etc/apt/sources.list.d/luisadha.list" ]; then
	echo "deb https://repo.luisadha.dev/ stable main" > $PREFIX/etc/apt/sources.list.d/luisadha.list
    wget -qP $PREFIX/etc/apt/trusted.gpg.d https://repo.luisadha.dev/luisadha-dev.gpg
	apt update
else 
	echo "repo already installed"
fi 

