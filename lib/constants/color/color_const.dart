import 'package:flutter/material.dart';

class AppMaterialColor {
  ///blue
  static const int bluePrimaryColor = 0xFF1A1528;

  static const MaterialColor blue = MaterialColor(
    bluePrimaryColor,
    <int, Color>{
      50: Color(0xFFF0EEF6),
      100: Color(0xFFE2DEED),
      200: Color(0xFFC5BCDC),
      300: Color(0xFFA79BCA),
      400: Color(0xFF8A79B9),
      500: Color(bluePrimaryColor),
      600: Color(0xFF574686),
      700: Color(0xFF413564),
      800: Color(0xFF2C2343),
      900: Color(0xFF161221),
    },
  );

  ///orange
  static const int orangePrimaryColor = 0xFFFF8811;

  static const MaterialColor orange = MaterialColor(
    orangePrimaryColor,
    <int, Color>{
      50: Color(0xFFFFF2E5),
      100: Color(0xFFFFE6CC),
      200: Color(0xFFFFCC99),
      300: Color(0xFFFFB366),
      400: Color(0xFFFF9933),
      500: Color(orangePrimaryColor),
      600: Color(0xFFCC6600),
      700: Color(0xFF994C00),
      800: Color(0xFF663300),
      900: Color(0xFF331A00),
    },
  );

  ///yellow
  static const int yellowPrimaryColor = 0xFFFFCE48;

  static const MaterialColor yellow = MaterialColor(
    yellowPrimaryColor,
    <int, Color>{
      50: Color(0xFFFFF8E5),
      100: Color(0xFFFFF1CC),
      200: Color(0xFFFFE499),
      300: Color(0xFFFFD666),
      400: Color(0xFFFFC933),
      500: Color(yellowPrimaryColor),
      600: Color(0xFFCC9600),
      700: Color(0xFF997000),
      800: Color(0xFF664B00),
      900: Color(0xFF332500),
    },
  );

  ///beige
  static const int beigePrimaryColor = 0xFFFFF8F0;

  static const MaterialColor beige = MaterialColor(
    beigePrimaryColor,
    <int, Color>{
      50: Color(0xFFFFF3E5),
      100: Color(0xFFFFE7CC),
      200: Color(0xFFFFCF99),
      300: Color(0xFFFFB866),
      400: Color(0xFFFFA033),
      500: Color(beigePrimaryColor),
      600: Color(0xFFCC6D00),
      700: Color(0xFF995200),
      800: Color(0xFF663600),
      900: Color(0xFF331B00),
    },
  );

  ///grey
  static const int greyPrimaryColor = 0xFFE3E3E3;

  static const MaterialColor grey = MaterialColor(
    greyPrimaryColor,
    <int, Color>{
      50: Color(0xFFF2F2F2),
      100: Color(0xFFE6E6E6),
      200: Color(0xFFCCCCCC),
      300: Color(0xFFB3B3B3),
      400: Color(0xFF999999),
      500: Color(greyPrimaryColor),
      600: Color(0xFF666666),
      700: Color(0xFF4D4D4D),
      800: Color(0xFF333333),
      900: Color(0xFF1A1A1A),
    },
  );

  ///darkBlue
  static const int darkBluePrimaryColor = 0xFF0A1A31;

  static const MaterialColor darkBlue = MaterialColor(
    darkBluePrimaryColor,
    <int, Color>{
      50: Color(0xFFEAF1FB),
      100: Color(0xFFD5E3F6),
      200: Color(0xFFAAC6EE),
      300: Color(0xFF80AAE5),
      400: Color(0xFF568EDC),
      500: Color(darkBluePrimaryColor),
      600: Color(0xFF235BA9),
      700: Color(0xFF1A447F),
      800: Color(0xFF112D55),
      900: Color(0xFF09172A),
    },
  );
}

abstract class AppColors {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);

  static const Color yellow = Color.fromRGBO(255, 222, 0, 1);
  static const Color amber = Color.fromRGBO(255, 114, 0, 1);
  static const Color blue = Colors.blue;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color transparent = Colors.transparent;
  static const Color blueTextColor = Color(0XFF4190FC);
  static const Color red = Color.fromRGBO(204, 10, 0, 1);
  static const Color green = Color.fromRGBO(0, 102, 34, 1);
  static const Color pink = Color.fromRGBO(239, 93, 168, 1);
  static const Color primaryColor = Color(0XFF4D4D4D);
  static const Color textFieldColor = Color(0XFFF5F5F5);
  static const Color cEEEEEEEE = Color(0Xffeeeeeeee);

  
}
