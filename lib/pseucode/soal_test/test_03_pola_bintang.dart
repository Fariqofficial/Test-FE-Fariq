void starPattern({required int x}) {
  if (x < 1) {
    print("Variabel atau nilai x minimal harus 1!");
    return;
  }

  print("=== POLA BINTANG UNTUK VARIABLE x = $x ===");

  for (int row = 1; row <= x; row++) {
    String star = '';
    for (int i = 1; i <= row; i++) {
      star += '* ';
    }
    print(star.trim());
  }

  print("================================\n");
}
