void tampilanTerbilang(int x) {
  if (x < 2001 || x > 9999) {
    print("Error: Masukkan angka 4 digit yang lebih besar dari 2000!");
    return;
  }

  print("=== TAMPILAN TERBILANG DARI $x ===");

  final List<String> satuan = [
    "",
    "Satu",
    "Dua",
    "Tiga",
    "Empat",
    "Lima",
    "Enam",
    "Tujuh",
    "Delapan",
    "Sembilan",
    "Sepuluh",
    "Sebelas",
    "Dua Belas",
    "Tiga Belas",
    "Empat Belas",
    "Lima Belas",
    "Enam Belas",
    "Tujuh Belas",
    "Delapan Belas",
    "Sembilan Belas",
  ];

  final List<String> puluhan = [
    "",
    "",
    "Dua Puluh",
    "Tiga Puluh",
    "Empat Puluh",
    "Lima Puluh",
    "Enam Puluh",
    "Tujuh Puluh",
    "Delapan Puluh",
    "Sembilan Puluh",
  ];

  int ribuan = x ~/ 1000;
  int ratusan = (x % 1000) ~/ 100;
  int puluhan2 = (x % 100) ~/ 10;
  int satuan2 = x % 10;
  int belasan = x % 100;

  List<String> hasil = [];

  if (ribuan == 1) {
    hasil.add("Satu Ribu");
  } else if (ribuan > 1) {
    hasil.add("${satuan[ribuan]} Ribu");
  }

  if (ratusan > 0) {
    if (ratusan == 1) {
      hasil.add("Seratus");
    } else {
      hasil.add("${satuan[ratusan]} Ratus");
    }
  }

  if (belasan >= 20) {
    if (puluhan2 > 0) hasil.add(puluhan[puluhan2]);
    if (satuan2 > 0) hasil.add(satuan[satuan2]);
  } else if (belasan >= 10) {
    hasil.add(satuan[belasan]);
  } else if (belasan > 0) {
    hasil.add(satuan[belasan]);
  }

  String terbilang = hasil.join(" ").trim();

  print(terbilang.isEmpty ? "Nol" : terbilang);
  print("================================\n");
}
