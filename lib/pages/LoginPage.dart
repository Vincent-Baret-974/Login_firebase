import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/CustomTextField.dart';
import '../widgets/PrimaryButton.dart';
import 'SignUpPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  child: Image.network('https://s3-eu-west-1.amazonaws.com/tpd/logos/5be01d787b5e5b0001ebb6bb/0x0.png')
              ),
              const SizedBox(height: 30),
              CustomTextField(
                  leadingIcon: Icons.mail_outline_rounded,
                  placeholderText: 'Enter your email',
                  displayVisibilityIcon: false),
              const SizedBox(height: 20),
              CustomTextField(
                  leadingIcon: Icons.lock_open_rounded,
                  placeholderText: 'Enter your password',
                  displayVisibilityIcon: true),
              const SizedBox(height: 20),
              const PrimaryButton(text: 'LOGIN'),
              const SizedBox(height: 30),
              Text(
                'OR',
                style: GoogleFonts.roboto(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 30),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.facebook_rounded,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 30),
                    SizedBox(
                      height: 45,
                      child: Image.network(
                          'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                          fit:BoxFit.cover
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: GoogleFonts.roboto(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.roboto(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}