# luisadha.github.io â€” Termux APT Repository

Repositori APT pribadi untuk Termux, dihosting melalui GitHub Pages.

> Periksa metadata: [Packages](https://luisadha.github.io/dists/stable/main/binary-aarch64/Packages)

---

## Cara Menggunakan Repositori Ini

Tambahkan repositori ke daftar sumber APT Termux Anda:

```bash
mkdir -p $PREFIX/etc/apt/sources.list.d
echo "deb [trusted=yes] https://luisadha.github.io/ stable main" \
  > $PREFIX/etc/apt/sources.list.d/luisadha.list
```

Perbarui daftar paket:

```bash
apt update
```

Install paket:

```bash
pkg install <nama-paket>
```

---

## Cara Membuat dan Menerbitkan Paket

### 1. Buat file `DEBIAN/control`

Di repositori paket Anda, buat file `DEBIAN/control` dengan isi berikut:

```
Package: <nama-paket>
Version: <versi>
Architecture: aarch64
Maintainer: <Nama Anda> <email@domain.com>
Description: <Deskripsi singkat paket>
Priority: optional
Section: <kategori>
```

### 2. Susun Struktur Folder

Repositori paket harus memiliki struktur berikut:

```
paket-anda/
â”œâ”€â”€ DEBIAN/
â”‚   â””â”€â”€ control
â””â”€â”€ data/
    â””â”€â”€ data/
        â””â”€â”€ com.termux/
            â””â”€â”€ files/
                â””â”€â”€ usr/
```

Lihat contoh lengkap: [github.com/luisadha/nene](https://github.com/luisadha/nene)

### 3. Build Paket `.deb`

Clone dan siapkan repositori paket:

```bash
git clone https://github.com/luisadha/nene.git
chmod 0755 nene/DEBIAN
```

Siapkan folder build:

```bash
mkdir -p nene_aarch64
rsync -av \
  --include='DEBIAN/***' \
  --include='data/***' \
  --exclude='*' \
  nene/ nene_aarch64/
```

Build folder menjadi file `.deb`:

```bash
dpkg-deb --build nene_aarch64
```

Menghasilkan: `nene_aarch64.deb`

### 4. Generate Metadata Repositori

Clone repositori yang dipersiapkan untuk mirror apt (cth: GitHub Pages), pindahkan `.deb` ke dalamnya, lalu generate metadata menggunakan command termux-apt-repo :

```bash
git clone https://github.com/luisadha/luisadha.github.io.git

mv nene_aarch64.deb luisadha.github.io/

termux-apt-repo luisadha.github.io luisadha.github.io stable main
```

### 5. Push ke GitHub

```bash
cd luisadha.github.io
git add dists
git add nene_aarch64.deb
git commit -m "Build debian package"
git push -u origin main
```

---
## Referensi 
https://github.com/rendiix/rendiix.github.io
## Lisensi

Didistribusikan untuk keperluan pribadi. Gunakan dengan bijak.
