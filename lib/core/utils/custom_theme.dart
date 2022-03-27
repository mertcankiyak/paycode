import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  final Color? blue;
  final Color? lightGreen;
  final Color? green;
  final Color? lightRed;
  final Color? red;
  final Color? grey;
  final Color? background;
  final Color? black;
  final Color? black1;
  final Color? black2;
  final Color? white;
  final Color? white1;

  TextStyle? text;
  TextStyle? loginText;
  TextStyle? dialogText;
  TextStyle? smallText;
  TextStyle? bigText;
  TextStyle? profileText;
  TextStyle? appbarText;
  TextStyle? profileHeaderText;
  TextStyle? tagText;

  BoxShadow? shadow;
  BoxShadow? purpleButtonShadow;
  BoxShadow? greenButtonShadow;

  ThemeData? themeData;

  CustomTheme({
    @required this.green,
    @required this.lightGreen,
    @required this.lightRed,
    @required this.red,
    @required this.grey,
    @required this.background,
    @required this.blue,
    @required this.white,
    @required this.black,
    @required this.black1,
    @required this.black2,
    @required this.white1,
    @required this.themeData,
  }) {
    loginText = TextStyle(
      color: blue,
      fontWeight: FontWeight.w800,
      fontSize: 15,
      fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
    );
    text = TextStyle(
      color: white,
      fontWeight: FontWeight.w600,
      fontSize: 15,
      fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
    );

    dialogText = TextStyle(
      color: black1,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
    );

    smallText = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 11,
      color: white,
      fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
    );

    bigText = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 35,
      color: white,
      fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
    );

    appbarText = TextStyle(
      color: white,
      fontWeight: FontWeight.w600,
      fontSize: 19,
      fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
    );

    profileText = TextStyle(
      color: Color(0xFF4d515c),
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
    );

    profileHeaderText = TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w600,
      fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
    );

    tagText = TextStyle(
      color: blue,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
    );
  }
}
