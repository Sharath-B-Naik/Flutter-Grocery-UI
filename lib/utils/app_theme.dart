import 'package:flutter_project/exports.dart';

String gilroyFontFamily = "Gilroy";

ThemeData themeData = ThemeData(
  fontFamily: gilroyFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.primaryColor,
  primarySwatch: primarySwatch,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primaryColor,
  ),
);

MaterialColor primarySwatch = const MaterialColor(
  0xFF53B175,
  <int, Color>{
    50: Color.fromRGBO(83, 177, 117, 0.1),
    100: Color.fromRGBO(83, 177, 117, 0.2),
    200: Color.fromRGBO(83, 177, 117, 0.3),
    300: Color.fromRGBO(83, 177, 117, 0.4),
    400: Color.fromRGBO(83, 177, 117, 0.5),
    500: Color.fromRGBO(83, 177, 117, 0.6),
    600: Color.fromRGBO(83, 177, 117, 0.7),
    700: Color.fromRGBO(83, 177, 117, 0.8),
    800: Color.fromRGBO(83, 177, 117, 0.9),
    900: Color.fromRGBO(83, 177, 117, 1.0),
  },
);
