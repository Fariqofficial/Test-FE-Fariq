## Deskripsi Projek
Projek ini terdiri atas 2 Test yaitu Pseucode Test (Sebanyak 4 Soal) dan Test Utama (Sebanyak 11 Soal). Pada Test Utama terdapat 3 screen yang dibangun menggunakan Flutter dan bisa diakses dengan emulator / physical device, sementara pada Pseucode Test terdiri atas 4 mode yang bisa dicoba melalui terminal IDE.

## Features
1. Pseucode Test
2. Flutter Application (Test Utama)

## Cara Donwload
1. Clone repository ini.
2. Kemudian lakukan `flutter pub get`.

## Cara run project
1. Siapkan emulator atau physical device Anda terlebih dahulu.
2. Jalankan perintah command berikut, apabila anda ingin memilih mode test melalui GUI seperti pada screenshot dibawah   
```bash
dart lib/launcher.dart
```
   
<img width="1113" height="272" alt="GUI" src="https://github.com/user-attachments/assets/d8ff4bea-248a-472a-a170-a1d6f4a869e4" />


3. Ketik "1" atau "2" untuk menjalankan mode test:
   - Pilihan 1 → Pseudocode Test (berjalan di terminal only, terdiri dari 4 soal)     
   - Pilihan 2 → Test Utama (Flutter App + perbaikan HTML + contoh API Node.js)
4. Apabila anda hanya ingin melihat Test Utama saja, anda dapat langsung menjalankan command `flutter run` atau bisa langsung debugging melalui IDE anda.

## Special Notes
- Untuk soal nomor 7, hashing akan langsung berjalan di terminal ketika Anda memilih menu 2 (Test Utama). Jika hanya ingin melihat aplikasi Flutter-nya, cukup jalankan `flutter run` atau debugging melalui IDE anda.

  
<img width="1113" height="25" alt="hashString" src="https://github.com/user-attachments/assets/0c0308e9-17a3-4194-9a57-50ca6cdc4c5f" />

- Untuk soal nomor 8, buka file HTML yang sudah diperbaiki, lalu drag/open dengan browser. Tekan Ctrl + F12 (Windows) atau Option + Command + J (Mac) untuk melihat hasil di console log
- Untuk soal nomor 10 & 11 (Node.js API), pastikan sudah menginstall Node.js. Masuk ke folder `soal_10_11_api`, lalu jalankan:
```bash
npm install
npm run dev
```
- Setelah server berjalan, test API menggunakan Postman/Thunder Client pada http://localhost:3000 dengan header:
```bash
user-id: ifabula
Scope: user
```

## Screenshot Aplikasi
<img width="1113" height="355" alt="pilihan 1" src="https://github.com/user-attachments/assets/799def92-138c-4742-a547-b5bd7788a957" />

<img width="326" height="717" alt="ss1" src="https://github.com/user-attachments/assets/3b6b9fd3-f1cc-4d82-b8b9-83016519709d" />

<img width="326" height="717" alt="ss2" src="https://github.com/user-attachments/assets/b976bca0-837b-4305-ab5b-d6101ec658ec" />

<img width="326" height="717" alt="ss2" src="https://github.com/user-attachments/assets/a94e9952-c445-4866-9c3c-14467e0d58df" />

<img width="326" height="717" alt="ss3" src="https://github.com/user-attachments/assets/582c2718-f4b3-4513-89b1-bbc95488adce" />

<img width="326" height="717" alt="ss3 sukses" src="https://github.com/user-attachments/assets/9b5a6151-b23a-4edc-a7d1-9c43b8cd21f4" />







