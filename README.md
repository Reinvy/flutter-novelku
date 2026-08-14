# NovelKu — Flutter App

Aplikasi baca & tulis novel, dirombak total dengan arsitektur modern.

## Tech Stack

- **Flutter 3.41.6** (Dart 3.11) via FVM
- **Riverpod 3** (Notifier/AsyncNotifier + code generation) — state management
- **go_router** — navigasi dengan auth guard
- **Dio 5** — networking dengan interceptor auto-refresh JWT
- **Freezed + json_serializable** — model & serialisasi
- **Backend**: Express 5 + Prisma 7 + PostgreSQL (lihat `../express-novelku`)

## Setup

```bash
# Pastikan backend berjalan: cd ../express-novelku && npm run dev

fvm use 3.41.6
fvm flutter pub get
fvm flutter pub run build_runner build   # generate freezed/riverpod
fvm flutter run                          # jalankan di emulator
```

**Base URL API**: default `http://10.0.2.2:3000` (emulator Android).
Override saat build:

```bash
fvm flutter run --dart-define=API_BASE_URL=http://localhost:3000   # desktop/web
```

## Fitur

- **Jelajah** — grid novel, pencarian, urutkan (terbaru/rating/judul), paginasi
- **Detail novel** — sinopsis, status, rating bintang, bab, komentar
- **Reader** — font serif, ukuran huruf 14–28, mode terang/sepia/gelap,
  simpan riwayat otomatis, bookmark bab
- **Perpustakaan** — simpan novel favorit
- **Riwayat baca** — lanjutkan dari bab terakhir
- **Bookmark** — daftar bab yang ditandai
- **Publisher** — buat novel + bab, upload cover
- **Profil** — edit nama/bio/avatar, keluar
- **Tema** — light & dark (Material 3), locale Indonesia

## Struktur

```
lib/
├── core/          # config, network (dio+refresh), storage, theme, router, widgets
├── shared/        # models freezed, providers global
└── features/      # auth, explore, novel_detail, reader, library, history,
                   # bookmarks, publisher, profile, settings (data/presentation)
```

## Tests

```bash
fvm flutter test
```

## Akun Contoh

Gunakan akun dari seed backend (`penulis1@test.com` / `rahasia123`) atau daftar baru.
