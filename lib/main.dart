import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    Text(
                      'Sign up',
                      style: GoogleFonts.roboto(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
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

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
            ),
          shadowColor: MaterialStateProperty.all<Color>(Colors.blueAccent.withOpacity(0.8)),
          elevation: MaterialStateProperty.all<double>(10.0),
        ),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          child: Text(
            text,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white),
          ),
        ));
  }
}

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.leadingIcon,
      required this.placeholderText,
      required this.displayVisibilityIcon});

  final IconData leadingIcon;
  final String placeholderText;
  final bool displayVisibilityIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late IconData suffixIcon;
  late bool obscurePassword;

  @override
  void initState() {
    super.initState();
    suffixIcon = Icons.visibility_off_outlined;
    obscurePassword = widget.displayVisibilityIcon ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: widget.placeholderText,
          hintStyle: GoogleFonts.roboto(color: Colors.grey.shade400),
          prefixIcon: Icon(widget.leadingIcon, color: Colors.grey.shade400),
          suffixIcon: widget.displayVisibilityIcon
              ? IconButton(
                  icon: Icon(suffixIcon),
                  color: Colors.grey.shade400,
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                      suffixIcon = obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined;
                    });
                  },
                )
              : null,
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
        ),
        obscureText: obscurePassword,
        onChanged: (value) {
          print('Typed $value');
        });
  }
}
