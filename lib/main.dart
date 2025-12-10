import 'package:flutter/material.dart';
import 'package:test_flutter_fariq/injection.dart';
import 'package:test_flutter_fariq/main_test/main_test_app.dart';
import 'package:test_flutter_fariq/main_test/soal_test/presentation/screens/test_07/test_07_hash_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(MyApp());
  hashingStrig();
}
