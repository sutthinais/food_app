import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData buildThemeData() {
  return ThemeData(
    primaryColor: kAccentColor,
    accentColor: kAccentColor,
    scaffoldBackgroundColor: kBgColor,
    // fontFamily: "SF Pro Text",
    textTheme: GoogleFonts.sarabunTextTheme(
      const TextTheme().copyWith(
    headline1: TextStyle(
      fontSize: 32,
      color: kMainColor,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 32,
      color: kMainColor,
    ),
    headline3: TextStyle(
      fontSize: 24,
      color: kMainColor,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      fontSize: 24,
      color: kMainColor,
    ),
    headline5: TextStyle(
      fontSize: 20,
      color: kMainColor,
    ),
    headline6: TextStyle(
      fontSize: 16,
      color: kMainColor,
    ),
    bodyText1: TextStyle(
      fontSize: 12,
      color: kMainColor,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: kMainColor,
    ),
    button: TextStyle(
      fontSize: 14,
      color: kMainColor,
    ),
      ),

  ).apply(displayColor: kMainColor,),
    appBarTheme: AppBarTheme(color: kBgColor, elevation: 0, centerTitle: true),
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: buttonThemeData,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}ThemeData buildThemeDataSecond() {
  return ThemeData(
    primaryColor: kMainColor,
    accentColor: kMainColor,
    scaffoldBackgroundColor: kBgColor,
    // fontFamily: "SF Pro Text",
    textTheme: GoogleFonts.sarabunTextTheme(
      const TextTheme().copyWith(
    headline1: TextStyle(
      fontSize: 32,
      color: kInputColor,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 32,
      color: kInputColor,
    ),
    headline3: TextStyle(
      fontSize: 24,
      color: kInputColor,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      fontSize: 24,
      color: kInputColor,
    ),
    headline5: TextStyle(
      fontSize: 20,
      color: kInputColor,
    ),
    headline6: TextStyle(
      fontSize: 16,
      color: kInputColor,
    ),
    bodyText1: TextStyle(
      fontSize: 12,
      color: kInputColor,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: kInputColor,
    ),
    button: TextStyle(
      fontSize: 14,
      color: kInputColor,
    ),
      ),

  ).apply(displayColor: kMainColor,),
    appBarTheme: AppBarTheme(color: kBgColor, elevation: 0, centerTitle: true),
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: buttonThemeData,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

// TextTheme textTheme() {
//   return TextTheme(
//     headline3: kHeadlineTextStyle,
//     headline4: kH1TextStyle,
//     headline5: kH2TextStyle,
//     headline6: kH3TextStyle,
//     subtitle1: kSubHeadTextStyle,
//     bodyText2: kBodyTextStyle,
//     button: kButtonTextStyle,
//   );
// }

final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  fillColor: kInputColor,
  filled: true,
  // hintStyle: kBodyTextStyle,
  contentPadding: const EdgeInsets.all(kDefaultPadding),
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder.copyWith(
      borderSide: BorderSide(
    color: kActiveColor.withOpacity(0.5),
  )),
  errorBorder: kDefaultOutlineInputBorder.copyWith(
    borderSide: kErrorBorderSide,
  ),
  focusedErrorBorder: kDefaultOutlineInputBorder.copyWith(
    borderSide: kErrorBorderSide,
  ),
);

const ButtonThemeData buttonThemeData = ButtonThemeData(
  shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8))),
);
