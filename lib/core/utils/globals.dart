import 'package:flutter/material.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/utils/custom_theme.dart';
import 'package:google_fonts/google_fonts.dart';

CustomTheme lightTheme = CustomTheme(
  background: Color(0xff1e2027),
  lightGreen: Color.fromARGB(255, 115, 255, 213),
  green: Color.fromARGB(255, 0, 122, 86),
  lightRed: Color.fromARGB(255, 255, 201, 201),
  red: Color(0xFFF30000),
  blue: Color(0xFF6f83e9),
  grey: Color(0xFF4d515c), //Color(0xFF2c2f39),
  black: Colors.black,
  black1: Color(0xFF5b5c55),
  black2: Color(0xFF2a2b2f), //Color(0xFF545770),
  white: Colors.white,
  white1: Colors.white.withOpacity(0.75),
  themeData: ThemeData(
    textTheme: TextTheme(
      headline1: TextStyle(
          color: ConstantColors.softBlackColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
      headline2: TextStyle(
          color: ConstantColors.softGrey,
          fontSize: 16,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
      headline3: TextStyle(
          color: ConstantColors.bodyColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
      headline4: TextStyle(
          color: ConstantColors.softBlackColor,
          fontSize: 15,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
      headline5: TextStyle(
          color: ConstantColors.softGrey,
          fontSize: 15,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
      headline6: TextStyle(
          color: ConstantColors.softBlackColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
      bodyText1: TextStyle(
          color: ConstantColors.productNameColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
      bodyText2: TextStyle(
          color: ConstantColors.bottomBarGreenIconColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
      subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
      subtitle2: TextStyle(
          color: ConstantColors.softBlackColor,
          fontSize: 17,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
    ),
    appBarTheme: AppBarTheme(backgroundColor: Color(0xff1e2027)),
    //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
    unselectedWidgetColor: Colors.white, // Color(0xFFF30000),
    primaryColor: Colors.white, //Color(0xFFF30000),
    accentColor: Colors.white, //Color(0xFFF30000),
    dividerTheme: DividerThemeData(thickness: 1, color: Colors.white60),
    fontFamily: GoogleFonts.montserrat().fontFamily,
    backgroundColor: Color(0xff1e2027),
    scaffoldBackgroundColor: Color(0xff1e2027),
    cursorColor: Color(0xFFF30000),
    indicatorColor: Color(0xFFF30000),
    textSelectionHandleColor: Color(0xFFF30000),
    textSelectionColor: Colors.black.withOpacity(0.15),
    dialogTheme: DialogTheme(),
    iconTheme: IconThemeData(color: Colors.white, size: 40),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2c2f39))),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2c2f39))),
      border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2c2f39))),
      disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2c2f39))),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFF30000),
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFF30000),
        ),
      ),
      fillColor: Color(0xff27282d),
      filled: true,
      hintStyle: TextStyle(
        color: Color(0xFFB0B2C9),
        fontWeight: FontWeight.w700,
        fontSize: 14,
        fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
      ),
      contentPadding: EdgeInsets.symmetric(),
      //horizontal: ConstDoubles.spacing, vertical: ConstDoubles.spacing),
    ),
  ),
);
