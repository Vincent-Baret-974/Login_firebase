import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key, required this.text, this.onPressed, this.backgroundColor,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(onPressed != null ? Colors.blueAccent : Colors.grey.shade400),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
          ),
          shadowColor: MaterialStateProperty.all<Color>(Colors.blueAccent.withOpacity(onPressed != null ? 0.8 : 0.0)),
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