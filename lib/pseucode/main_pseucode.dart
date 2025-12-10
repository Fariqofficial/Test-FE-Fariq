import 'dart:io';
import 'package:test_flutter_fariq/pseucode/soal_test/test_01_deret_angka_kelipatan_5.dart';
import 'package:test_flutter_fariq/pseucode/soal_test/test_02_fibonnaci.dart';
import 'package:test_flutter_fariq/pseucode/soal_test/test_03_pola_bintang.dart';
import 'package:test_flutter_fariq/pseucode/soal_test/test_04_tampilan_terbilang.dart';

void pseudocodeMain() {
  while (true) {
    print("\n" + "=" * 50);
    print("           PILIH SOAL");
    print("=" * 50);
    print("1. Deret Angka Kelipatan 5");
    print("2. Deret Bilangan Fibonacci");
    print("3. Pola Bintang");
    print("4. Tampilan Terbilang");
    print("0. Keluar dari program");
    print("-" * 50);

    stdout.write("Masukkan nomor soal (0-4): ");
    String? input = stdin.readLineSync()?.trim();

    if (input == null || input.isEmpty) {
      print("Input atau pilihan soal tidak boleh kosong!\n");
      continue;
    }

    print("\n" + "=" * 50);

    switch (input) {
      case '1':
        deretAngkaKelipatan5();
        break;
      case '2':
        fibonacci();
        break;
      case '3':
        stdout.write("Masukkan nilai atau variabel x untuk pola bintang: ");
        String? xInput = stdin.readLineSync();
        int? x = int.tryParse(xInput ?? "");
        if (x != null && x >= 1) {
          starPattern(x: x);
        } else {
          print("Input atau pilihan tidak valid! Harus angka ≥ 1\n");
        }
        break;
      case '4':
        stdout.write("Masukkan angka 4 digit (>2000): ");
        String? angkaInput = stdin.readLineSync();
        int? angka = int.tryParse(angkaInput ?? "");
        if (angka != null && angka > 2000 && angka <= 9999) {
          tampilanTerbilang(angka);
        } else {
          print(
            "Input harus merupakan 4 digit angka dan lebih besar dari angka 2000!\n",
          );
        }
        break;
      case '0':
        print("Keluar dari menu! Program selesai.");
        return;
      default:
        print("Pilihan tidak ada! Silakan pilih nomor soal 0–4\n");
    }

    print("Tekan Enter untuk kembali ke menu..");
    stdin.readLineSync();
  }
}

void main() => pseudocodeMain();
