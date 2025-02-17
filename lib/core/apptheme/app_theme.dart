import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color_constant.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColor.theme,
      scaffoldBackgroundColor: AppColor.bg,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.backgroundColor,
        titleTextStyle: GoogleFonts.acme(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: GoogleFonts.acme(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: _lightTextTheme,
      inputDecorationTheme: _lightInputDecorationTheme,
      cardTheme: _lightCardTheme,
      dividerTheme: _lightDividerTheme,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.buttonColor,
        elevation: 4,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: GoogleFonts.acme(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[800],
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: GoogleFonts.acme(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: _darkTextTheme,
      inputDecorationTheme: _darkInputDecorationTheme,
      cardTheme: _darkCardTheme,
      dividerTheme: _darkDividerTheme,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.grey[800],
        elevation: 4,
      ),
    );
  }

  static final TextTheme _lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.acme(fontSize: 16, color: Colors.black),
    bodyMedium: GoogleFonts.acme(fontSize: 14, color: Colors.black),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.acme(fontSize: 16, color: Colors.white),
    bodyMedium: GoogleFonts.acme(fontSize: 14, color: Colors.white),
  );

  static final InputDecorationTheme _lightInputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColor.buttonColor),
    ),
  );

  static final InputDecorationTheme _darkInputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white),
    ),
  );

  static final CardTheme _lightCardTheme = CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: const EdgeInsets.all(8),
  );

  static final CardTheme _darkCardTheme = CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    color: Colors.grey[900],
    margin: const EdgeInsets.all(8),
  );

  static final DividerThemeData _lightDividerTheme = DividerThemeData(
    color: Colors.grey[400],
    thickness: 1,
    space: 20,
  );

  static final DividerThemeData _darkDividerTheme = DividerThemeData(
    color: Colors.grey[700],
    thickness: 1,
    space: 20,
  );
}
