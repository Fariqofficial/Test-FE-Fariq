import 'package:flutter/material.dart';
import 'package:test_flutter_fariq/main_test/soal_test/presentation/screens/test_01_02/test_01_sample_json.dart';

part 'widgets/circle_button.dart';
part 'widgets/employee_items.dart';

class ShowJSONDataScreen extends StatefulWidget {
  const ShowJSONDataScreen({super.key});

  @override
  State<ShowJSONDataScreen> createState() => _ShowJSONDataScreenState();
}

class _ShowJSONDataScreenState extends State<ShowJSONDataScreen> {
  int _currentIndex = 0;

  void _onNext() =>
      setState(() => _currentIndex = (_currentIndex + 1) % employees.length);
  void _onPrev() => setState(
    () => _currentIndex =
        (_currentIndex - 1 + employees.length) % employees.length,
  );

  @override
  Widget build(BuildContext context) {
    final employee = employees[_currentIndex];
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Employee Data",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff262626),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Row(
          children: [
            _CircleButton(icon: Icons.chevron_left, onTap: _onPrev),
            SizedBox(width: 20),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  final offset = Tween<Offset>(
                    begin: Offset(
                      _currentIndex > previousIndex ? 1.0 : -1.0,
                      0,
                    ),
                    end: Offset.zero,
                  ).animate(animation);
                  return SlideTransition(
                    position: offset,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 6),
                    _EmployeeItems(
                      key: ValueKey(_currentIndex),
                      employee: employee,
                      index: _currentIndex,
                      total: employee.length,
                    ),
                    SizedBox(height: 12),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        "${_currentIndex + 1} of ${employees.length} data",
                        key: ValueKey(_currentIndex),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF262626),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            _CircleButton(icon: Icons.chevron_right, onTap: _onNext),
          ],
        ),
      ),
    );
  }

  int get previousIndex =>
      (_currentIndex - 1 + employees.length) % employees.length;
}
