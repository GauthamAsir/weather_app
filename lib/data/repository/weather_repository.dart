import 'dart:ui';

import 'package:weather_app/core/utils/base_http_client.dart';
import 'package:weather_app/model/cities_model.dart';
import 'package:weather_app/model/weather_data_model.dart';
import 'package:weather_app/src/utilities/constants.dart';

class WeatherRepository {
  final BaseHttpClient _baseHttpClient = BaseHttpClient();

  Future<CitiesModel?> getCities() async {
    try {
      var res = await _baseHttpClient.fetchData('', uri: Paths.citiesUri);

      if (res == null) {
        return CitiesModel(cities: []);
      }

      return CitiesModel.fromJson(res);
    } catch (e, s) {
      return Future.error(e, s);
    }
  }

  Future<WeatherDataModel?> getWeather({required String city}) async {
    try {
      Map<String, dynamic> params = {
        "q": city,
        "APPID": Constants.WEATHER_API_KEY
      };

      var res = await _baseHttpClient.fetchData(
        Paths.weather,
        queryParameter: params,
      );

      if (res == null) {
        return null;
      }

      return WeatherDataModel.fromJson(res);
    } catch (e, s) {
      return Future.error(e, s);
    }
  }

  Future<String> getIcon(String iconCode) async {
    try {
      String url =
          '${Paths.imageBaseUrl}${Paths.weatherImagePrePath}$iconCode${Paths.imageFormat}';
      var res = await _baseHttpClient.fetchData(
        '',
        uri: Uri.parse(url),
        decode: false,
      );

      if (res == null) {
        return '';
      }

      return res;
    } catch (e, s) {
      return Future.error(e, s);
    }
  }
}
