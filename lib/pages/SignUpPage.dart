import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_firebase/widgets/PrimaryButton.dart';

import '../widgets/RegularTextField.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              const RegularTextField(placeholderText: 'Enter your email'),
              const SizedBox(height: 20),
              const RegularTextField(placeholderText: 'Enter your name'),
              const SizedBox(height: 20),
              const RegularTextField(placeholderText: 'Choose a password'),
              const SizedBox(height: 20),
              const RegularTextField(placeholderText: 'Confirm password'),
              const SizedBox(height: 40),
              const PrimaryButton(text: 'SIGN UP')
            ],
          ),
        ),
      ),
    );
  }
}