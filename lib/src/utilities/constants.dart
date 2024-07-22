class Constants {
  Constants._();

  /// Removed
  static const String WEATHER_API_KEY = '';
}

class Paths {
  Paths._();

  static const weather = 'weather';
  static Uri citiesUri = Uri.parse(
      'https://a944ede2-133d-45fa-82e1-0fb951492eda.mock.pstmn.io/cities');
  static const imageBaseUrl = 'http://openweathermap.org';
  static const weatherImagePrePath = '/img/w/';
  static const imageFormat = '.png';
}
