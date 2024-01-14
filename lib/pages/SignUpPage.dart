import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_firebase/widgets/CustomTextField.dart';
import 'package:login_firebase/widgets/PrimaryButton.dart';

import 'NewPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create your account',
                style: GoogleFonts.roboto(fontSize: 24),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                leadingIcon: Icons.mail_outline_rounded,
                placeholderText: 'Enter your email',
                displayVisibilityIcon: false,
                controller: _emailController,
                onChanged: (email) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                  leadingIcon: Icons.lock_open_rounded,
                  placeholderText: 'Choose your password',
                  displayVisibilityIcon: true,
                  controller: _passwordController,
                  onChanged: (password) {
                    setState(() {});
                  }),
              const SizedBox(height: 10),
              Text('Password must be at least 6 characters',
                  style: GoogleFonts.roboto(color: Colors.grey)),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: _calculatePasswordStrength(),
                  minHeight: 10.0,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _passwordController.text.length >= 6
                        ? Colors.green.shade400
                        : Colors.red.shade400,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                text: 'SIGN UP',
                onPressed: _passwordController.text.length >= 6 &&
                        _emailController.text.isNotEmpty
                    ? _signUpUser
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUpUser() async {
    FocusScope.of(context).unfocus();
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        if (!context.mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewPage()),
        );
      }
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case 'invalid-email':
          showToastMessage('Invalid email');
        case 'email-already-in-use':
          showToastMessage('Email already in use');
        default:
          showToastMessage('Sign up failed.');
      }
    } catch (e) {
      showToastMessage('An error occurred.');
    }
  }

  double _calculatePasswordStrength() {
    int passwordLength = _passwordController.text.length;
    double strength = passwordLength / 6.0;
    return strength;
  }

  void showToastMessage(String message) {
    fToast.showToast(
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Text(
              message,
              style: GoogleFonts.roboto(
                  color: Colors.white
              ),
            )
        )
    );
  }
}
