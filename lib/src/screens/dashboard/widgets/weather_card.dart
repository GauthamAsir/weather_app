import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/extensions.dart';
import 'package:weather_app/core/themes/paddings.dart';
import 'package:weather_app/core/themes/sizes.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/model/weather_data_model.dart';
import 'package:weather_app/src/utilities/constants.dart';

import 'weather_list_tile.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({super.key, required this.data});

  final WeatherDataModel data;

  static const celsiusSymbol = '\u2103';

  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.p12,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${data.name}, ${data.sys?.country ?? ''}',
            style: context.tm,
            textAlign: TextAlign.center,
          ),
          Sizes.h4,
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '${((data.main?.temp ?? 0) - 273.15).toStringAsFixed(2)}$celsiusSymbol',
                  style: context.tl.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: Image.network(
                    '${Paths.imageBaseUrl}${Paths.weatherImagePrePath}${data.weather?.firstOrNull?.icon ?? ''}${Paths.imageFormat}',
                  ),
                ),
              )
            ],
          ),
          Sizes.h4,
          Text(
            data.weather?.firstOrNull?.description ?? '',
            style: context.ts,
            textAlign: TextAlign.center,
          ),
          Sizes.h4,
          WeatherListTile(
            title: 'Humidity',
            subTitle: '${data.main?.humidity} %',
          ),
          Sizes.h4,
          WeatherListTile(
            title: 'Low',
            subTitle:
                '${((data.main?.tempMin ?? 0) - 273.15).toStringAsFixed(2)}$celsiusSymbol',
          ),
          Sizes.h4,
          WeatherListTile(
            title: 'High',
            subTitle:
                '${((data.main?.tempMax ?? 0) - 273.15).toStringAsFixed(2)}$celsiusSymbol',
          ),
        ],
      ),
    );
  }
}
