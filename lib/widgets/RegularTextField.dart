import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegularTextField extends StatelessWidget {
  final String placeholderText;
  final TextEditingController controller;

  const RegularTextField({super.key, required this.placeholderText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: placeholderText,
        hintStyle: GoogleFonts.roboto(color: Colors.grey.shade400),
        border: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding:
        const EdgeInsets.all(20),
      ),
    );
  }
}
