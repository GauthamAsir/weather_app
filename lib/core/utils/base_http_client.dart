import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/core/utils/dev_log.dart';

class BaseHttpClient {
  final Client? client;

  static final Client _client = Client();

  String baseURL = "api.openweathermap.org";

  String prePathWeather = '/data/2.5/';

  BaseHttpClient({this.client});

  Future<dynamic> fetchData(
    String path, {
    var queryParameter,
    Uri? uri,
    bool decode = true,
  }) async {
    Uri url = uri ?? Uri.https(baseURL, prePathWeather + path, queryParameter);
    devLog('Fetch URl ${url.toString()}');
    final response = await _client.get(url);
    try {
      if(decode) {
        var res = json.decode(response.body);
        return res;
      }
      return response.body;
    } catch (e, s) {
      devLog('BaseHttpClient Fetch ${e.toString()} ${s.toString()}');
      devLog(response.statusCode.toString());
      rethrow;
    }
  }
}
