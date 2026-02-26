# 🎵 Music Player — minpro_1

Aplikasi pemutar musik lokal berbasis Flutter yang memungkinkan pengguna mengelola dan memutar file audio langsung dari perangkat mereka.

---

## Deskripsi Aplikasi

Music Player adalah aplikasi mobile/desktop yang dibangun menggunakan Flutter. Aplikasi ini memungkinkan pengguna untuk menambahkan lagu dari penyimpanan lokal, mengelola library musik pribadi, serta memutar audio dengan kontrol yang lengkap — termasuk play, pause, stop, dan seek progress bar.

---

## Fitur Utama

- **Tambah Lagu** — Pilih file audio (mp3, wav, flac, dll.) dari penyimpanan perangkat menggunakan file picker
- **Library Musik** — Tampilan daftar lagu dengan info judul, artis, dan album
- **Edit & Hapus Lagu** — Ubah metadata lagu atau hapus dari library kapan saja
- **Pemutar Audio** — Player bar interaktif dengan tombol play/pause, stop, dan seekbar
- **Progress Bar** — Slider seekable dengan tampilan waktu posisi dan durasi lagu
- **Persistent Storage** — Data lagu tersimpan secara lokal menggunakan SharedPreferences sehingga tidak hilang setelah aplikasi ditutup
- **Empty State** — Tampilan informatif ketika library masih kosong
- **Notifikasi Validasi** — SnackBar untuk feedback saat pengguna lupa memilih file audio

---

## Struktur Proyek

```
lib/
├── main.dart               # Entry point, model Song, dan konfigurasi tema
├── home_screen.dart        # Halaman utama: library lagu, song tile, dan player bar
├── add_song_screen.dart    # Halaman tambah lagu baru
└── edit_song_screen.dart   # Halaman edit metadata & hapus lagu
```

---

## Dependencies

| Package | Versi | Kegunaan |
|---|---|---|
| `just_audio` | ^0.10.5 | Engine pemutaran audio |
| `file_picker` | 10.3.10 | Pemilihan file audio dari penyimpanan lokal |
| `shared_preferences` | ^2.5.4 | Penyimpanan data library musik secara persisten |

---

## Widget yang Digunakan

### Struktural & Layout
| Widget | Kegunaan |
|---|---|
| `Scaffold` | Kerangka utama tiap halaman |
| `AppBar` | Header halaman dengan judul dan tombol aksi |
| `Column` / `Row` | Menyusun elemen secara vertikal dan horizontal |
| `Expanded` | Mengisi sisa ruang yang tersedia |
| `SingleChildScrollView` | Membuat konten form bisa di-scroll |
| `Container` | Wrapper dengan styling (warna, border radius, shadow) |

### Tampilan & List
| Widget | Kegunaan |
|---|---|
| `ListView.builder` | Menampilkan daftar lagu secara efisien |
| `StreamBuilder` | Memperbarui progress bar secara real-time dari audio stream |
| `Icon` / `Text` | Ikon dan teks informasi lagu |

### Interaktif
| Widget | Kegunaan |
|---|---|
| `TextFormField` | Input judul, artis, dan album lagu |
| `GestureDetector` | Mendeteksi tap pada tile lagu dan tombol pilih file |
| `IconButton` | Tombol play/pause, stop, tambah lagu |
| `TextButton` | Tombol simpan, batal, dan hapus lagu |
| `Slider` | Seekbar untuk navigasi posisi audio |
| `SliderTheme` | Kustomisasi tampilan slider |
| `Form` + `GlobalKey<FormState>` | Validasi input form tambah/edit lagu |

### Dialog & Overlay
| Widget | Kegunaan |
|---|---|
| `AlertDialog` | Dialog konfirmasi hapus lagu |
| `SnackBar` | Notifikasi ketika file audio belum dipilih |

### State Management
| Widget | Kegunaan |
|---|---|
| `StatefulWidget` + `setState` | Manajemen state lokal (status play, list lagu, lagu aktif) |

---

## Cara Menjalankan

1. Pastikan Flutter SDK sudah terpasang
2. Clone repository ini
3. Jalankan perintah berikut:

```bash
flutter pub get
flutter run
```

> Untuk platform Android, izin `READ_EXTERNAL_STORAGE` dan `READ_MEDIA_AUDIO` sudah dikonfigurasi di `AndroidManifest.xml`.
> Untuk platform iOS, izin `NSAppleMusicUsageDescription` sudah ditambahkan di `Info.plist`.

---

## Platform yang Didukung

Android · iOS · macOS · Windows · Linux · Web
