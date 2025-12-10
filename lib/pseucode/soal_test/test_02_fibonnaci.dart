void fibonacci() {
  print("=== DERET BILANGAN FIBONACCI SEBANYAK 20 ===");

  int a = 0, b = 1;
  List<int> result = [a, b];

  for (int i = 2; i < 20; i++) {
    int c = a + b;
    result.add(c);
    a = b;
    b = c;
  }

  print(result.join("  "));
  print("=====================================\n");
}
