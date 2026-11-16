# MyPortfolio Mobile

Aplikasi mobile multiplatform berbasis **Flutter** sebagai klien antarmuka portofolio pribadi milik **Rasya Al Hawari** (`2506534176` — Kelas `PBP D`), yang dirancang untuk terintegrasi dengan layanan REST API Django (`myportofolio`) pada mata kuliah **Pemrograman Berbasis Platform (CSGE602022)**, Fakultas Ilmu Komputer, Universitas Indonesia, Semester Gasal 2026/2027.

## Cara Menjalankan Proyek Secara Lokal

1. Pastikan **Flutter SDK** dan **Dart SDK** telah terpasang serta terdaftar pada variabel lingkungan `PATH`.
2. Kloning repositori ini dan masuk ke direktori proyek:
   ```bash
   git clone [https://github.com/rasyaalh/myportofolio_mobile.git](https://github.com/rasyaalh/myportofolio_mobile.git)
   cd myportofolio_mobile

### Tugas 7

## Pertanyaan Reflektif
1. **Widget tree** adalah struktur hierarki berbentuk pohon yang menyusun seluruh komponen antarmuka (UI) pada aplikasi Flutter. Di dalam Flutter, hampir semua elemen—mulai dari tata letak, teks, ikon, hingga jarak antar-elemen—merupakan *widget* yang tersusun secara bertingkat dari akar (*root*) hingga ke bagian terdalam. Hubungan induk-anak (*parent-child*) bekerja dengan cara widget induk (*parent*) meneruskan batasan ukuran (*constraints*, seperti batas lebar dan tinggi) serta konfigurasi tema ke widget anak (*child* atau `children`). Setelah itu, widget anak menentukan ukurannya sendiri sesuai batasan tersebut dan mengembalikannya ke induk untuk diposisikan di layar.
2. Berikut adalah daftar *widget* yang digunakan dalam proyek aplikasi *mobile* ini beserta fungsinya masing-masing:
   * `MaterialApp`: Menjadi *widget* akar yang membungkus keseluruhan aplikasi, mengatur tema global (`ThemeData`), warna latar *scaffold*, judul aplikasi, dan menentukan halaman utama (`home`).
   * `Scaffold`: Menyediakan kerangka dasar struktur halaman bergaya Material Design, mencakup area `AppBar`, `body`, serta dukungan untuk menampilkan `SnackBar`.
   * `AppBar`: Menampilkan bilah judul di bagian atas halaman beserta ikon identitas aplikasi dengan sudut bawah yang dibuat melengkung.
   * `SingleChildScrollView`: Membungkus konten halaman agar bisa digulir (*scroll*) secara vertikal sehingga tampilan tetap aman dan tidak terpotong (*overflow*) pada layar berukuran kecil.
   * `Center`: Memposisikan *widget* di dalamnya agar berada tepat di tengah ruang yang tersedia.
   * `ConstrainedBox`: Membatasi lebar maksimum area konten (`maxWidth: 700`) agar susunan kartu menu tetap proporsional dan tidak melebar berlebihan saat dibuka melalui layar desktop atau peramban web.
   * `Column`: Menyusun beberapa *widget* anak secara vertikal dari atas ke bawah.
   * `Row`: Menyusun beberapa *widget* anak secara horizontal dari kiri ke kanan.
   * `Expanded`: Membagi ruang kosong di dalam `Row` secara merata dan proporsional untuk setiap kartu informasi (`InfoCard`) agar tidak melebihi batas lebar layar.
   * `Container`: Membungkus *widget* untuk mengatur jarak dalam (`padding`), dekorasi latar gradasi (`BoxDecoration`), sudut melengkung (`BorderRadius`), garis tepi (`Border`), serta efek bayangan (`BoxShadow`).
   * `CircleAvatar`: Menampilkan lingkaran profil berisi inisial pemilik portofolio (`RA`) pada bagian *banner* sambutan.
   * `SizedBox`: Memberikan jarak spasi kosong berukuran tetap antar-komponen baik secara vertikal maupun horizontal.
   * `Text`: Menampilkan teks di layar lengkap dengan pengaturan gaya huruf (`TextStyle`), perataan (`TextAlign`), serta batas jumlah baris (`maxLines`).
   * `Icon`: Menampilkan ikon vektor bawaan dari pustaka Material Icons.
   * `GridView.count`: Menyusun kartu-kartu tombol menu ke dalam tata letak kisi (*grid*) berjumlah 3 kolom dengan rasio ukuran yang terkontrol (`childAspectRatio: 1.1`).
   * `Material`: Menyediakan permukaan dasar berbasis Material Design untuk menerapkan warna latar kartu, elevasi bayangan, dan sudut membulat.
   * `InkWell`: Menangani aksi ketukan pengguna (`onTap`) sekaligus memberikan efek riak sentuhan (*ripple effect*) pada kartu yang bisa ditekan.
   * `SnackBar`: Memunculkan bilah notifikasi sementara (*floating*) di bagian bawah layar ketika pengguna menekan tombol menu atau menyalin NPM.
   * *Custom Stateless Widgets* (`MyApp`, `MyHomePage`, `InfoCard`, `ItemCard`): Komponen modular buatan sendiri yang memisahkan tampilan halaman utama, kartu profil, dan kartu tombol aksi agar kode lebih rapi serta mudah digunakan ulang (*reusable*).
3. `MaterialApp` berfungsi sebagai pembungkus tingkat atas yang menyiapkan standar desain Material Design untuk seluruh bagian aplikasi. *Widget* ini menyediakan berbagai layanan penting yang dibutuhkan hampir setiap halaman, seperti pengelolaan rute navigasi (`Navigator`), pengaturan tema warna dan tipografi (`ThemeData`), arah pembacaan teks (`Directionality`), hingga `ScaffoldMessenger` untuk memunculkan `SnackBar`. Karena layanan-layanan tersebut diakses oleh *widget* di bawahnya melalui pohon konteks, `MaterialApp` umumnya dipasang sebagai *root widget* agar seluruh komponen turunan dapat mewarisi konfigurasi global tersebut secara konsisten.
4. Perbedaan utama keduanya terletak pada kemampuan menyimpan dan mengubah data internal (*state*) selama aplikasi berjalan:
   * `StatelessWidget` bersifat statis dan tidak dapat berubah (*immutable*) setelah dirender. *Widget* ini tidak memiliki objek `State` dan hanya akan dibangun ulang jika data parameter yang dikirim dari induknya berubah. Kita sebaiknya memilih `StatelessWidget` untuk tampilan yang sifatnya tetap dan tidak memutasi data lokal, seperti halaman menu utama (`MyHomePage`), kartu informasi (`InfoCard`), dan tombol menu (`ItemCard`).
   * `StatefulWidget` memiliki objek `State` terpisah yang bersifat dinamis (*mutable*). Saat terjadi perubahan data melalui pemanggilan fungsi `setState()`, Flutter akan membangun ulang bagian antarmuka tersebut agar sesuai dengan kondisi terbaru. Kita perlu menggunakan `StatefulWidget` ketika antarmuka memerlukan interaksi yang mengubah tampilan secara langsung, seperti formulir input teks, tombol penghitung (*counter*), atau daftar data yang dimuat secara asinkron dari API.
5. `BuildContext` adalah objek referensi yang menunjukkan posisi spesifik sebuah *widget* di dalam struktur *widget tree*. Keberadaannya sangat penting karena menjadi penghubung bagi suatu *widget* untuk berkomunikasi dan mengambil data dari *widget* leluhur (*ancestor*) di atasnya. Di dalam metode `build(BuildContext context)`, parameter `context` digunakan untuk mengakses layanan atau konfigurasi bersama di pohon atasnya—misalnya memanggil `Theme.of(context)` untuk mengambil skema warna tema aplikasi atau `ScaffoldMessenger.of(context)` untuk menampilkan `SnackBar` pada `Scaffold` terdekat.
6. *Hot reload* bekerja dengan cara menyuntikkan perubahan kode Dart yang baru disimpan ke dalam Dart Virtual Machine (VM) yang sedang berjalan, lalu membangun ulang *widget tree* dalam hitungan detik **tanpa menghapus nilai `State` aplikasi saat ini**. Sebaliknya, *hot restart* mengompilasi ulang kode Dart dan menjalankan ulang aplikasi dari fungsi `main()`, sehingga **seluruh `State` aplikasi direset kembali ke kondisi awal**. Kita tidak bisa hanya mengandalkan *hot reload* dan harus melakukan **hot restart** saat mengubah nilai variabel global/statis, inisialisasi awal di `initState()`, atau struktur konstruktor utama. Sementara itu, **full restart** (menghentikan proses lalu menjalankan ulang `flutter run`) wajib dilakukan apabila kita menambah pustaka baru di `pubspec.yaml`, menambahkan aset gambar/font, atau mengubah konfigurasi *native* pada folder platform (`android/`, `ios/`, atau `web/`).

## Progress Mingguan
Pada iterasi minggu ketujuh ini, saya memulai pengembangan aplikasi *mobile* portofolio pribadi berbasis Flutter (`myportofolio_mobile`) sebagai kelanjutan dari ekosistem proyek portofolio Django, dengan rincian sebagai berikut:
1. (Tugas 7) Menginisialisasi proyek Flutter baru di repositori GitHub terpisah dan memisahkan kode halaman antarmuka ke dalam berkas `lib/menu.dart` dari berkas utama `lib/main.dart`.
2. (Tugas 7) Mengubah sifat *widget* halaman utama (`MyHomePage`) menjadi `StatelessWidget` dan menampilkan tiga komponen `InfoCard` berisi identitas pribadi secara akurat (NPM `2506534176`, Nama `Rasya Al Hawari`, dan Kelas `PBP D`).
3. (Tugas 7) Memperluas atribut model `ItemHomepage` dengan menambahkan properti `Color color` agar pewarnaan setiap kartu tombol menu dapat dikelola secara modular tanpa percabangan `if-else`.
4. (Tugas 7) Membuat 7 kartu tombol aksi (`ItemCard`) yang disesuaikan dengan seluruh model data pada portofolio Django saya (*Lihat Experience*, *Lihat Achievement*, *Lihat Education*, *Lihat Certification*, *Lihat Contact*, *Tambah Item*, dan *Logout*) dengan warna latar kontras yang berbeda pada setiap tombol.
5. (Tugas 7) Mengintegrasikan aksi ketukan (`InkWell`) yang memunculkan `SnackBar` dengan pesan interaktif `"Kamu telah menekan tombol [Nama Tombol]!"` serta memastikan kebersihan kode menggunakan `flutter analyze` hingga bebas dari peringatan.
6. (Kreativitas) Meningkatkan tampilan UI/UX dengan menerapkan tema latar biru muda (`#EEF5FF`), menambahkan *Hero Banner* profil bergradasi biru dengan avatar inisial, membatasi lebar tampilan desktop menggunakan `ConstrainedBox` agar grid tombol tetap proporsional, mengubah gaya `SnackBar` menjadi model *floating*, serta menambahkan fitur interaktif *Tap-to-Copy* pada kartu NPM.

## AI Disclosure & Refleksi Pemecahan Masalah
Dalam penyelesaian Tugas Individu 7 ini, saya merancang struktur antarmuka, menyesuaikan komponen tombol dengan model data portofolio saya, serta mengimplementasikan kode Flutter secara mandiri berdasarkan panduan Tutorial 08. Selama proses pengerjaan, saya memanfaatkan AI (Gemini) sebagai teman diskusi untuk bertukar pikiran mengenai pengembangan kreativitas UI/UX dan membantu mencari solusi ketika menemui kendala teknis, dengan rincian sebagai berikut:

1. **Diskusi Pengembangan Kreativitas UI/UX:** Saya ingin tampilan portofolio *mobile* terlihat lebih modern namun tetap selaras dengan nuansa biru muda pada aplikasi. Saya berdiskusi dengan AI untuk menentukan kombinasi palet warna kontras yang estetik untuk ketujuh tombol `ItemCard`, serta merancang ide peningkatan UX tambahan seperti penambahan *Hero Banner* profil di bagian atas, desain *AppBar* melengkung, *floating* `SnackBar`, dan fitur salin NPM otomatis saat kartu NPM ditekan.
2. **Penyesuaian Proporsi `GridView.count` di Layar Lebar (Chrome):** Saat menguji aplikasi di peramban Google Chrome, saya sempat bingung karena kartu tombol di dalam `GridView.count` terlihat terlalu besar berbentuk persegi sehingga empat tombol di baris bawah terdorong ke bawah dan tidak langsung terlihat di layar. Setelah berdiskusi dengan AI mengenai cara kerja batasan ukuran (*box constraints*) di Flutter, saya membungkus isi halaman dengan `ConstrainedBox(maxWidth: 700)` dan mengatur `childAspectRatio: 1.1` pada `GridView.count` sehingga seluruh ketujuh kartu dapat tampil proporsional dan rapi di layar.