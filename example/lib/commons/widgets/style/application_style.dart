import 'package:flutter/material.dart';

import 'application_colors.dart';

class ApplicationStyle {
  static final ThemeData applicationThemeData = ThemeData(
    primaryColor: ApplicationColors.paygoYellow,
    primaryColorLight: ApplicationColors.paygoYellow,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: ApplicationColors.paygoYellow,
      primaryColorDark: ApplicationColors.paygoDark,
      accentColor: ApplicationColors.paygoDark,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        //   (Set<MaterialState> states) {
        //     if (states.contains(MaterialState.pressed)) {
        //       return paygoYellow[900];
        //     }
        //     return paygoYellow[900];
        //   },
        // ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return ApplicationColors.paygoDark[900];
            }
            return ApplicationColors.paygoDark[900];
          },
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) {
            return const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            );
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return ApplicationColors.paygoYellow[800];
            }
            return null;
          },
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ApplicationColors.paygoDark[900],
      iconTheme: IconThemeData(
        color: ApplicationColors.paygoDark[900],
      ),
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
    ),
  );
}
