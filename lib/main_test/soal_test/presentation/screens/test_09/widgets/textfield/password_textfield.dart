part of '../../login_screen.dart';

class _PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;
  const _PasswordTextField({required this.controller, this.errorText});

  @override
  State<_PasswordTextField> createState() => __PasswordTextFieldState();
}

class __PasswordTextFieldState extends State<_PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: "Input your password",
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey[350],
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: Icon(Icons.lock, size: 25, color: Colors.teal[200]),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            size: 25,
            color: Colors.teal[200],
          ),
          onPressed: () => setState(() => _obscureText = !_obscureText),
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
        errorText: widget.errorText,
        errorStyle: TextStyle(color: Colors.red, fontSize: 14),
      ),
    );
  }
}
