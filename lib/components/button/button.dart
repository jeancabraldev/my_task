import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary:
            Get.isDarkMode ? const Color(0xff5773fd) : const Color(0xffF50057),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        textStyle: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
      ),
    );
  }
}
