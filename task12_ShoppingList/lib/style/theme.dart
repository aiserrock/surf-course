import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/style/colors.dart';

final mainThemeData = ThemeData(
  fontFamily: 'Sora',
  useMaterial3: true,
  textTheme: textTheme,
  colorScheme: colorScheme,
);

const textTheme = TextTheme(
  displaySmall: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  ),
  displayMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  headlineMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  titleMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  ),
  labelLarge: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  ),
);
