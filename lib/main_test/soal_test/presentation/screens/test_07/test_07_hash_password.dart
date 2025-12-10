import 'dart:convert';

import 'package:crypto/crypto.dart';

void hashingStrig() {
  const String nickname = "fariq";

  final DateTime now = DateTime.now();

  final String todayDate =
      "${now.day.toString().padLeft(2, '0')}"
      "${now.month.toString().padLeft(2, '0')}"
      "${now.year}";

  final String plainText =
      "$todayDate$nickname"
      "priaifabula";

  final String hashResult = sha256.convert(utf8.encode(plainText)).toString();

  print("Result: $hashResult");
}
