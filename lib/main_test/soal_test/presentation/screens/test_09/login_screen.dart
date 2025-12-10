import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_fariq/injection.dart';
import 'package:test_flutter_fariq/main_test/soal_test/presentation/screens/test_09/cubit/login_screen_cubit.dart';

part 'widgets/textfield/username_textfield.dart';
part 'widgets/textfield/password_textfield.dart';
part 'widgets/button.dart';
part 'widgets/content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _usernameError;
  String? _passwordError;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<LoginScreenCubit>()..checkLoginStatus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "LOGIN FORM",
            style: TextStyle(
              fontSize: 16,
              color: Color(0XFF262626),
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 1,
          centerTitle: true,
        ),
        body: BlocConsumer<LoginScreenCubit, LoginScreenState>(
          listener: (context, state) {
            if (state is LoginScreenError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginScreenInitial) {
              _usernameController.clear();
              _passwordController.clear();
              _usernameError = null;
              _passwordError = null;
            }

            final isLoading = state is LoginScreenLoading;

            void validate() {
              setState(() {
                _usernameError = _usernameController.text.trim().isEmpty
                    ? "Username wajib diisi"
                    : null;
                _passwordError = _passwordController.text.isEmpty
                    ? "Password wajib diisi"
                    : null;
              });

              if (_usernameError == null && _passwordError == null) {
                context.read<LoginScreenCubit>().login(
                  username: _usernameController.text.trim(),
                  password: _passwordController.text.trim(),
                );
              }
            }

            if (state is LoginScreenSuccess) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: _Content(
                    username: state.username,
                    onLogout: () => context.read<LoginScreenCubit>().logout(),
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _UsernameTextField(
                      controller: _usernameController,
                      errorText: _usernameError,
                    ),
                    const SizedBox(height: 16),
                    _PasswordTextField(
                      controller: _passwordController,
                      errorText: _passwordError,
                    ),
                    const SizedBox(height: 40),
                    _Button(onPressed: validate, isLoading: isLoading),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
