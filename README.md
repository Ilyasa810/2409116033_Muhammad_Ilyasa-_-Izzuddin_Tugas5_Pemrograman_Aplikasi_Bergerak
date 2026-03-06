# 📱 Form Validation & Registration App

### Tugas 5 – Pemrograman Aplikasi Bergerak

![Flutter](https://img.shields.io/badge/Flutter-Framework-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-Language-blue?logo=dart)
![Platform](https://img.shields.io/badge/Platform-Android-green)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

Repository ini berisi project **aplikasi mobile menggunakan Flutter** yang dibuat untuk memenuhi tugas **Pertemuan 5 – Form Validasi dan List Data** pada mata kuliah **Pemrograman Aplikasi Bergerak**.

Aplikasi ini memungkinkan pengguna untuk:

* Mengisi **form pendaftaran**
* Melakukan **validasi input**
* Menyimpan data pendaftar
* Menampilkan **daftar pendaftar**

---

| Nama            | NIM        |Kelas        |
| --------------- | ---------- | ---------- |
| Muhammad Ilyasa' 'Izzuddin        | 2409116033          | A' 2024 Sistem Informasi          |

---

# 🎯 Tujuan Project

Project ini bertujuan untuk mempelajari konsep dasar dalam pengembangan aplikasi mobile menggunakan **Flutter**, khususnya:

* Membuat **Form Input**
* Menggunakan **Form Validation**
* Mengelola **State sederhana**
* Menampilkan **List Data**
* Navigasi antar halaman

---

# 🧰 Teknologi yang Digunakan

| Teknologi       | Keterangan                                |
| --------------- | ----------------------------------------- |
| Flutter         | Framework untuk membangun aplikasi mobile |
| Dart            | Bahasa pemrograman utama Flutter          |
| Material Design | Komponen UI bawaan Flutter                |

---

# ✨ Fitur Aplikasi

Aplikasi ini memiliki beberapa fitur utama:

✅ Form pendaftaran pengguna
✅ Validasi input form
✅ Pesan error jika data tidak valid
✅ Penyimpanan data sementara
✅ Menampilkan list pendaftar

---

# 📂 Struktur Project

Berikut adalah struktur folder utama pada project:
```
lib
│
├── models
│   └── event_registrant.dart
│
├── pages
│   ├── home_page.dart
│   ├── registration_form_page.dart
│   └── registrant_list_page.dart
│
├── providers
│   └── registration_provider.dart
│
├── app.dart
└── main.dart
```

### 📖 Penjelasan Struktur
**main.dart**
Merupakan entry point aplikasi Flutter yang menjalankan aplikasi.

**app.dart**
Berfungsi untuk mengatur konfigurasi utama aplikasi seperti MaterialApp dan routing halaman.

**models/event_registrant.dart**
Berisi model data pendaftar event yang digunakan untuk menyimpan informasi pengguna.

**providers/registration_provider.dart**
Digunakan untuk state management menggunakan Provider yang mengatur data pendaftar.

**pages/home_page.dart**
Halaman utama aplikasi yang berisi navigasi ke halaman pendaftaran dan daftar peserta.

**pages/registration_form_page.dart**
Halaman form yang digunakan pengguna untuk mengisi data pendaftaran event.

**pages/registrant_list_page.dart**
Menampilkan daftar peserta yang telah mendaftar ke event.
---

# 📸 Screenshot Aplikasi

## 1️⃣ Form Kosong

Tampilan awal form sebelum pengguna mengisi data.

<img width="960" height="504" alt="{94E43391-96D8-4722-8C24-05E50319506E}" src="https://github.com/user-attachments/assets/5b0632ed-e05a-4936-917f-3eacc6daadc8" />

---

## 2️⃣ Form Terisi

Tampilan ketika pengguna telah mengisi seluruh data pada form.

<img width="960" height="501" alt="{9864434F-9E59-4049-95FC-6A227D34B2F9}" src="https://github.com/user-attachments/assets/8c03e3c7-4ceb-49ee-85c0-2b3fb74f9a3c" />

---

## 3️⃣ Validation Error

Pesan error muncul jika terdapat field yang tidak valid atau belum diisi.

<img width="960" height="503" alt="{27BE21AC-AB0F-41FA-BA42-9C75366427F9}" src="https://github.com/user-attachments/assets/840d2a03-bdbd-4b66-822a-8f7d6ef96c4f" />

---

## 4️⃣ List Pendaftar

Menampilkan data pengguna yang berhasil didaftarkan.

<img width="958" height="499" alt="{181FA7E2-8062-4C68-BDCB-292C660802ED}" src="https://github.com/user-attachments/assets/0cd432bc-07ef-4b13-a318-2d84803ffff1" />

---

# ▶️ Cara Menjalankan Project

### 1️⃣ Clone Repository

```
git clone https://github.com/Ilyasa810/2409116033_Muhammad_Ilyasa-_-Izzuddin_Tugas5_Pemrograman_Aplikasi_Bergerak.git
```

---

### 2️⃣ Masuk ke Folder Project

```
cd 2409116033_Muhammad_Ilyasa-_-Izzuddin_Tugas5_Pemrograman_Aplikasi_Bergerak
```

---

### 3️⃣ Install Dependency

```
flutter pub get
```

---

### 4️⃣ Jalankan Aplikasi di Chrome

Pastikan Flutter Web sudah aktif, lalu jalankan:

```
flutter run -d chrome
```

Aplikasi akan otomatis terbuka di **browser Google Chrome**.

---
# 📝 Kesimpulan

Melalui project ini, mahasiswa dapat memahami bagaimana cara membuat **form input dengan validasi pada Flutter** serta bagaimana **menampilkan data dalam bentuk list**.

Konsep ini merupakan dasar penting dalam pengembangan aplikasi mobile karena hampir semua aplikasi membutuhkan fitur **form input dan validasi data pengguna**.

---
