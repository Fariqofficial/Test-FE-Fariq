import 'dart:io';
import 'package:test_flutter_fariq/pseucode/main_pseucode.dart';

void main() {
  print("\n" + "=" * 60);
  print("Flutter Test - Fariq Naufal Diaz");
  print("=" * 60);
  print("Pilih mode test:");
  print("1. Main Test → Flutter App (JSON Sample Data, UI, etc.)");
  print("2. Pseudocode Test (Terminal Accessbility Only)");
  print("-" * 60);
  stdout.write("Silahkan ketik 1 atau 2: ");

  final input = stdin.readLineSync()?.trim();

  switch (input) {
    case "1":
      print("\nStarting Flutter application..\n");
      Process.runSync("flutter", ["run"]);
      break;
    case "2":
      print("\nStarting Pseucode Test..\n");
      pseudocodeMain();
      break;
    case "0":
      print("Program Selesai. Terima kasih telah menggunakan program saya!");
      exit(0);
    default:
      print("Pilihan salah! Silahkan ketik 1 atau 2.");
      main();
  }
}
