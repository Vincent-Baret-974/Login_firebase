import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/CustomTextField.dart';
import '../widgets/PrimaryButton.dart';
import 'SignUpPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  child: Image.network(
                      'https://s3-eu-west-1.amazonaws.com/tpd/logos/5be01d787b5e5b0001ebb6bb/0x0.png')),
              const SizedBox(height: 30),
              CustomTextField(
                  leadingIcon: Icons.mail_outline_rounded,
                  placeholderText: 'Enter your email',
                  displayVisibilityIcon: false,
                  controller: _emailController),
              const SizedBox(height: 20),
              CustomTextField(
                  leadingIcon: Icons.lock_open_rounded,
                  placeholderText: 'Enter your password',
                  displayVisibilityIcon: true,
                  controller: _passwordController),
              const SizedBox(height: 20),
              PrimaryButton(
                text: 'LOGIN',
                onPressed: () {
                  logUser(_emailController.text, _passwordController.text, context);
                },
              ),
              const SizedBox(height: 30),
              Text(
                'OR',
                style: GoogleFonts.roboto(
                    color: Colors.grey.shade400, fontWeight: FontWeight.w600),
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
                          fit: BoxFit.cover),
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
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.roboto(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
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

  void logUser(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        if (!context.mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewPage()),
        );
      }
      print('User ID: ${userCredential.user!.uid}');
    } catch (e) {
      print('Error: $e');
    }
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'New page',
            style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
          ),
        ),
        body: const Center(
          child: Text('Welcome to the app'),
        ));
  }
}
