import 'package:aplikasi_cek_resi/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthServices _authServices = AuthServices();

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Form(
              key: _registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        hintText: "fullname",
                        labelText: "fullname",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.badge_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "fullname harus di isi";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        hintText: "username",
                        labelText: "username",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "username harus di isi";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "password",
                        labelText: "password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password harus di isi";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "confirm password",
                        labelText: "confirm password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value != _passwordController.text) {
                          return "Password and Confirm Password does not match";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onRegisterButtonTapped,
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("sudah punya akun?"),
                      TextButton(
                        child: const Text("login"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onRegisterButtonTapped() async {
    if (_registerFormKey.currentState!.validate()) {
      final result = await _authServices.registerUser(
        fullName: _fullNameController.text,
        username: _usernameController.text,
        password: _passwordController.text,
      );

      if (!mounted) return;
      await showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 3), () {
            if (mounted && Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          });
          return AlertDialog(
            title: Text(result.status),
            content: Text(result.message),
          );
        },
      );

      if (result.status == "success") {
        if (mounted) return;
        Navigator.pop(context);
      }
    }
  }
}
