import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
        required this.leadingIcon,
        required this.placeholderText,
        required this.displayVisibilityIcon, required this.controller, this.onChanged});

  final IconData leadingIcon;
  final String placeholderText;
  final bool displayVisibilityIcon;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

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
        controller: widget.controller,
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
        onChanged: widget.onChanged
      );
  }
}