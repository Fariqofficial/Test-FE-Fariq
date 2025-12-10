part of '../../login_screen.dart';

class _UsernameTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  const _UsernameTextField({required this.controller, this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Example: User123",
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey[350],
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: Icon(
          Icons.person_outline,
          size: 25,
          color: Colors.teal[200],
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.teal[200]!, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        errorText: errorText,
        errorStyle: TextStyle(color: Colors.red, fontSize: 14),
      ),
    );
  }
}
