import 'package:flutter/material.dart';
import 'package:latihan_kuis/Pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoggedIn = false;

  void _login() {
    final username = usernameController.text;
    final password = passwordController.text;

    // Contoh validasi login
    if (username == '124230124' && password == 'Sistem Informasi') {
      setState(() {
        isLoggedIn = true;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage())
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login berhasil!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),

      body: SafeArea(
        child: Stack(
          children: [
            // Login card
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: 380,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 8,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 35),

                      // Username
                      TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Password
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 35),

                      // Login button
                      SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFF6FF),
                            foregroundColor: Colors.deepPurple,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: const BorderSide(
                                color: Color(0xFFE8DFE8),
                              ),
                            ),
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}