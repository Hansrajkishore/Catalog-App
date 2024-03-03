import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(

        cardColor: creamColor,
        hoverColor: DarkPurple,
        shadowColor: Colors.black,
        canvasColor: Colors.white,

        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(

          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),

        ),
        textTheme: Theme.of(context).textTheme, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(background: Colors.grey.shade200),

      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(

    fontFamily: GoogleFonts.poppins().fontFamily,

     hoverColor: lightPurple,
    cardColor: Canva,
    shadowColor: Colors.white,
    canvasColor: Colors.black12,

    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),

    ),
    textTheme: Theme.of(context).textTheme, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(background: Colors.black),

  );
  static  Color creamColor = Color(0xfff5f5f5);
  static  Color DarkPurple = Color(0xff403b58);
  static  Color lightPurple = Color(0xff49a4ad);
  static  Color tealColor = Colors.teal.shade100;
  static  Color Canva = Vx.gray900;
}


