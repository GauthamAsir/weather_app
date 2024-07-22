import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_colors.dart';
import 'fonts_custom.dart';

final themeMode = StateProvider((ref) => ThemeMode.light);

final lightTheme = Provider((ref) => Themes.light);
final darkTheme = Provider((ref) => Themes.dark);

extension CustomTheme on ThemeData {
  ThemeData get custom =>
      brightness == Brightness.dark ? Themes.dark : Themes.light;
}

class Themes {
  static ThemeData get base => ThemeData.light();

  static ThemeData get light => ThemeData(
        primarySwatch:
            MaterialColor(AppColors.primaryColor.value, AppColors.color),
        brightness: Brightness.light,
      );

  static ThemeData get dark => ThemeData(
        primarySwatch:
            MaterialColor(AppColors.primaryColor.value, AppColors.color),
        brightness: Brightness.dark,
      );
}
