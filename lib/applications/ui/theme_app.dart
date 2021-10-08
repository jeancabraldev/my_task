import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//Dark

const Color primaryDark = Color(0xFF2F3C4B);
const Color secondaryDark = Color(0xff1a1c29);
//const Color secondaryDark = Color(0xff16202a);

class ThemeApp {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    primarySwatch: Colors.red,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffF50057),
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
      bodyText2: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
    ),
  );
  static final dark = ThemeData(
    backgroundColor: secondaryDark,
    primarySwatch: Colors.green,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    canvasColor: secondaryDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryDark,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
      bodyText2: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 18,
    ),
  );
}

//Definindo os títulos da AppBar
TextStyle get titleAppBar {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get subTitleInputFields {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontSize: 16,
      color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[400],
    ),
  );
}
