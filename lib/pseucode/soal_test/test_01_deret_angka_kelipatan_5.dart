void deretAngkaKelipatan5() {
  print("=== DERET ANGKA KELIPATAN 5 DARI 50 SAMPAI 100 ===");
  print("Angka    | Keterangan");
  print("---------|--------------------");

  for (int i = 50; i <= 100; i += 5) {
    String description;

    if (i <= 60) {
      description = "KURANG";
    } else if (i <= 70) {
      description = "CUKUP";
    } else if (i <= 80) {
      description = "BAIK";
    } else {
      description = "LUAR BIASA";
    }
    print("${i.toString().padRight(8)} | $description");
  }
  print("==========================================\n");
}
