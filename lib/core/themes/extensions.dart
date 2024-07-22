import 'package:flutter/material.dart';

import 'fonts_custom.dart';

extension UiThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get style => theme.textTheme;

  //Display
  TextStyle get dl => style.displayLarge!;
  TextStyle get dm => style.displayMedium!;
  TextStyle get ds => style.displaySmall!;

  //Headline
  TextStyle get hl => style.headlineLarge!;
  TextStyle get hm => style.headlineMedium!;
  TextStyle get hs => style.headlineSmall!;

  //Title
  TextStyle get tl => style.titleLarge!;
  TextStyle get tm => style.titleMedium!;
  TextStyle get tm2 => style.titleMedium!.copyWith(
        fontSize: FontSizes.s18,
      );
  TextStyle get ts => style.titleSmall!;

  //Body
  TextStyle get bl => style.bodyLarge!;
  TextStyle get bm => style.bodyMedium!;
  TextStyle get bs => style.bodySmall!;

  //Label
  TextStyle get ll => style.labelLarge!;
  TextStyle get lm => style.labelMedium!;
  TextStyle get ls => style.labelSmall!;
}
