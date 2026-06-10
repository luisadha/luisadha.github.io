# luisadha.github.io


# Cara buat
```sh
Buat file control di repository target
DEBIAN/control
dengan isi

Package: <nama paket>
Version: <versi paket>
Architecture: aarch64
Maintainer: <nama anda> <email anda>     
Description: <Jelaskan deskripsi paket anda>
Priority: optionwl
Section: <Kategori paket anda>

dan structur folder seperti ini pada repositori anda
/data/data/com.termux/files/usr/bin
/data/data/com.termux/files/usr/man

contohnya https://github.com/luisadha/nene.git

git clone https://github.com/luisadha/nene.git

chmod 0755 nene/DEBIAN

dpkg-deb --build nene

menghasilkan:

nene.deb

git clone  https://https://github.com/luisadha/luisadha.github.io.git

mv nene.deb luisadha.github.io

termux-apt-repo luisadha.github.io luisadha.github.io stable main


cd luisadha.github.io
git add dists
git add nene.deb

git commit -m "Build debian package"

git push -u origin main

lalu

echo "deb [trusted=yes] https://luisadha.github.io/ stable main" > $PREFIX/etc/apt/sources.list.d/luisadha.list

apt update

pkg install nene
```

