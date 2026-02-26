# 🛒 Shopping Cart App — Flutter

Aplikasi mobile shopping cart sederhana yang dibangun menggunakan Flutter. Project ini dibuat sebagai tugas Flutter Part 5 dengan fokus pada penerapan state management menggunakan Provider.

---

## 📱 Deskripsi Aplikasi

Shopping Cart App adalah aplikasi belanja sederhana yang menampilkan daftar produk elektronik. Pengguna bisa memilih produk, menentukan jumlah yang ingin dibeli lewat bottom sheet, lalu mengelola item di keranjang belanja — mulai dari menambah, mengurangi, hingga checkout.

Aplikasi ini menggunakan arsitektur yang cukup bersih: model data dipisah dari UI, dan state cart dikelola secara terpusat menggunakan `ChangeNotifier` dari package Provider. Format harga ditampilkan dalam Rupiah (IDR) dengan pemisah ribuan yang rapi.

---

## ✨ Fitur Aplikasi

- **Daftar Produk** — Menampilkan 6 produk elektronik dalam tampilan grid 2 kolom, lengkap dengan emoji, nama, dan harga.
- **Tambah ke Cart via Bottom Sheet** — Sebelum masuk cart, pengguna bisa pilih jumlah produk lewat modal bottom sheet yang muncul dari bawah layar. Ada preview subtotal yang update otomatis sesuai quantity.
- **Cart Badge** — Ikon cart di AppBar menampilkan badge merah berisi total jumlah item yang ada di keranjang, update real-time.
- **Manajemen Keranjang** — Di halaman cart, pengguna bisa menambah/mengurangi quantity tiap item, hapus satu item, atau clear semua sekaligus.
- **Total Harga Dinamis** — Total harga di bagian bawah cart otomatis ter-update setiap kali ada perubahan quantity atau item dihapus.
- **Checkout** — Proses checkout dengan konfirmasi dialog, menampilkan ringkasan total harga dan jumlah item sebelum konfirmasi.
- **Format Rupiah** — Semua harga ditampilkan dalam format `Rp 15.000.000` menggunakan package `intl`.
- **Snackbar Notifikasi** — Muncul notifikasi kecil di bawah layar setiap kali item ditambahkan ke cart atau dihapus.

---

## 🧩 Widget yang Digunakan

### Widget Struktural & Layout
| Widget | Kegunaan |
|--------|----------|
| `Scaffold` | Struktur dasar halaman (AppBar + body) |
| `AppBar` | Header halaman dengan judul dan action button |
| `Column` | Menyusun widget secara vertikal |
| `Row` | Menyusun widget secara horizontal |
| `Expanded` | Mengisi sisa ruang yang tersedia dalam Column/Row |
| `Stack` | Menumpuk widget (dipakai untuk badge di atas ikon cart) |
| `Positioned` | Menempatkan badge secara absolut di atas ikon cart |
| `SafeArea` | Mencegah konten terpotong notch/navigation bar |
| `Container` | Box serbaguna untuk dekorasi, padding, dan ukuran |
| `SizedBox` | Spacer antar widget |
| `Padding` | Menambahkan padding pada widget tertentu |
| `Center` | Menempatkan widget ke tengah |

### Widget Tampilan & List
| Widget | Kegunaan |
|--------|----------|
| `GridView.builder` | Menampilkan daftar produk dalam grid 2 kolom |
| `ListView.builder` | Menampilkan daftar item di keranjang belanja |
| `Card` | Container dengan shadow dan rounded corner |
| `Text` | Menampilkan teks |
| `Icon` | Ikon Material Design |
| `Divider` | Garis pemisah horizontal |

### Widget Interaktif
| Widget | Kegunaan |
|--------|----------|
| `ElevatedButton` | Tombol utama (Add to Cart, Checkout, dll) |
| `ElevatedButton.icon` | Tombol dengan ikon di dalamnya |
| `IconButton` | Tombol ikon (hapus item, increase/decrease quantity) |
| `GestureDetector` | Mendeteksi tap pada custom widget (tombol bulat +/-) |
| `TextButton` | Tombol teks (Cancel di dialog) |

### Widget Dialog & Overlay
| Widget | Kegunaan |
|--------|----------|
| `AlertDialog` | Dialog konfirmasi clear cart dan checkout |
| `showModalBottomSheet` | Menampilkan bottom sheet pilih quantity |
| `SnackBar` | Notifikasi singkat di bawah layar |
| `ScaffoldMessenger` | Mengelola tampilan SnackBar |

### State Management
| Widget | Kegunaan |
|--------|----------|
| `ChangeNotifierProvider` | Menyediakan CartModel ke seluruh widget tree |
| `Consumer<CartModel>` | Rebuild otomatis saat state cart berubah |
| `context.read<CartModel>()` | Akses cart tanpa listen (untuk action/event) |
| `StatefulWidget` | Dipakai di `_AddToCartSheet` untuk state quantity lokal |

---

## 📦 Dependencies

```yaml
dependencies:
  provider: ^6.1.5+1   # State management
  intl: ^0.20.2         # Format mata uang Rupiah
```

---

## 🗂️ Struktur Project

```
lib/
├── main.dart                    # Entry point, setup Provider
├── models/
│   ├── product.dart             # Model data produk
│   ├── cart_item.dart           # Model item dalam keranjang
│   └── cart_model.dart          # State management (ChangeNotifier)
├── pages/
│   ├── product_list_page.dart   # Halaman daftar produk + bottom sheet
│   └── cart_page.dart           # Halaman keranjang belanja
└── utils/
    └── currency_formatter.dart  # Helper format Rupiah
```

---
