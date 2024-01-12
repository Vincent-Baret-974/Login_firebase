import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_firebase/widgets/PrimaryButton.dart';

import '../widgets/RegularTextField.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Create your account',
                  style: GoogleFonts.roboto(
                    fontSize: 24
                  ),
              ),
              const SizedBox(height: 40),
              RegularTextField(placeholderText: 'Enter your email', controller: _emailController),
              const SizedBox(height: 20),
              RegularTextField(placeholderText: 'Enter your name', controller: _nameController),
              const SizedBox(height: 20),
              RegularTextField(placeholderText: 'Choose a password', controller: _passwordController),
              const SizedBox(height: 20),
              RegularTextField(placeholderText: 'Confirm password', controller: _confirmPasswordController),
              const SizedBox(height: 40),
              PrimaryButton(
                text: 'SIGN UP',
                onPressed: () async {
                  try {
                    print('pressed');
                    UserCredential userCredential =
                        await _auth.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    print('User ID: ${userCredential.user!.uid}');
                  } catch (e) {
                    print('Error: $e');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}