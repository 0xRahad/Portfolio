import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/consts/m_color.dart';

class AppTheme {
  AppTheme._();

  static final themeData = ThemeData.dark().copyWith(
      drawerTheme: DrawerThemeData(
        backgroundColor: MColor.primaryColor,
      ),
      listTileTheme: ListTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
          color: MColor.primaryColor,
          surfaceTintColor: Colors.transparent,
          elevation: 0),
      scaffoldBackgroundColor: MColor.primaryColor,
      textTheme: GoogleFonts.urbanistTextTheme().apply(
        displayColor: Colors.white,
        bodyColor: Colors.white,
      ));
}
