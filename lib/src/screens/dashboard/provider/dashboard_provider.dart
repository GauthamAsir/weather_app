import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/model/cities_model.dart';
import 'package:weather_app/model/weather_data_model.dart';

final dashboardProvider = ChangeNotifierProvider(
  (ref) => DashboardViewModel(ref),
);

class DashboardViewModel extends ChangeNotifier {
  final Ref ref;

  DashboardViewModel(this.ref);

  final WeatherRepository _repository = WeatherRepository();

  CitiesModel? _citiesModel;

  CitiesModel? get citiesModel => _citiesModel;

  set citiesModel(CitiesModel? value) {
    _citiesModel = value;
    notifyListeners();
  }

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<WeatherDataModel> _weatherList = [];
  List<WeatherDataModel> get weatherList => _weatherList;
  set weatherList(List<WeatherDataModel> value) {
    _weatherList = value;
    notifyListeners();
  }

  void addAllWeatherList(List<WeatherDataModel> value) {
    _weatherList.addAll(value);
    notifyListeners();
  }

  void clearWeatherList() {
    _weatherList.clear();
    notifyListeners();
  }

  Future<void> getCities() async {
    loading = true;

    var res = await _repository.getCities();
    citiesModel = res;
    if (res != null && _weatherList.isEmpty) {
      getWeatherData();
    }
    loading = false;
  }

  Future<void> getWeatherData() async {
    if ((citiesModel?.cities ?? []).isEmpty) {
      BotToast.showText(text: 'No cities Found');
      return;
    }

    loading = true;
    List<WeatherDataModel> list = [];

    for(String city in citiesModel?.cities ?? []) {
      var res = await _repository.getWeather(city: city);
      if(res != null) {
        list.add(res);
      }
    }

    addAllWeatherList(list);

    loading = false;
  }
}
