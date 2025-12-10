import 'package:flutter/material.dart';
import 'package:test_flutter_fariq/main_test/soal_test/presentation/screens/test_01_02/test_02_show_json_data.dart';
import 'package:test_flutter_fariq/main_test/soal_test/presentation/screens/test_03_04_05_06/test_03_request_url.dart';
import 'package:test_flutter_fariq/main_test/soal_test/presentation/screens/test_09/login_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;

  final _screens = [
    const ShowJSONDataScreen(),
    const JSONPlaceholderScreen(),
    const LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Manrope'),
      home: Scaffold(
        body: _screens[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          selectedItemColor: Colors.teal[200],
          unselectedItemColor: Colors.grey[350],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "Employees",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_download),
              label: "Posts API",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "Login Form",
            ),
          ],
        ),
      ),
    );
  }
}
