import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../app/routes/app_routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * 0.65,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF1c83cf),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(450),
                ),
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// LOGO
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 80,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// LOGIN CARD
                  Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _inputField(
                          hint: 'Email',
                          icon: Icons.person_outline,
                        ),
                        const SizedBox(height: 12),
                        _inputField(
                          hint: 'Password',
                          icon: Icons.lock_outline,
                          isPassword: true,
                        ),

                        const SizedBox(height: 10),

                        /// Remember Me
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (v) {},
                            ),
                            const Text('Remember Me'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  /// SIGN IN BUTTON
                  SizedBox(
                    width: size.width * 0.6,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF004eab),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.HOME);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// FORGOT PASSWORD
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// CREATE ACCOUNT
                  SizedBox(
                    width: size.width * 0.6,
                    height: 45,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 COMMON INPUT FIELD
  Widget _inputField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
