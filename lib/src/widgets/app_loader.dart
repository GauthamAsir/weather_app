import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
        strokeWidth: 5,
      ),
    );
  }
}
