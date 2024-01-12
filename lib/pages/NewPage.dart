import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/PrimaryButton.dart';
import 'LoginPage.dart';

class NewPage extends StatelessWidget {
  NewPage({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked : (didPop) {
        if (didPop) {
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title:
            Text(
              'New page',
              style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
            )
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the app',
                  style: GoogleFonts.roboto(
                      fontSize: 24
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: 'LOG OUT',
                  onPressed: () {
                    _signOut(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      if (!context.mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}