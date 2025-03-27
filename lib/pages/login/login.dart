import 'package:app2/pages/signup/signup.dart';
import 'package:app2/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Colors for green theme
  final Color primaryColor = const Color(0xFF2E7D32); // Dark Green
  final Color accentColor =
      const Color.fromARGB(255, 178, 228, 181); // Light Green
  final Color bgColor =
      const Color.fromARGB(255, 255, 255, 255); // Light Grey Background
  final Color fieldBgColor = Colors.white; // White for text fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _signup(context),
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   elevation: 4,
      //   title: Text(
      //     'Login',
      //     style: GoogleFonts.raleway(
      //       textStyle: const TextStyle(
      //         color: Colors.white,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                elevation: 0,
                color: Colors.transparent, // Set the card color to transparent
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'Welcome Back',
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _emailAddress(),
              const SizedBox(height: 20),
              _password(),
              const SizedBox(height: 16),
              _forgotPassword(context),
              const SizedBox(height: 40),
              _signin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailAddress() {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                hintText: 'sample@gmail.com',
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                fillColor: fieldBgColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.email, color: primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _password() {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: fieldBgColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.lock, color: primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Implement forgot password functionality
        },
        child: Text(
          'Forgot Password?',
          style: GoogleFonts.raleway(
            textStyle: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _signin(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(double.infinity, 56),
            elevation: 0,
          ),
          onPressed: () async {
            await AuthService().signin(
              email: _emailController.text,
              password: _passwordController.text,
              context: context,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                "Sign In",
                style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      color: accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "New User? ",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: "Create Account",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
