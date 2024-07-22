import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/extensions.dart';

class WeatherListTile extends StatelessWidget {
  const WeatherListTile({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
              title,
              style: context.lm,
            )),
        Text(
          subTitle,
          style: context.lm,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}