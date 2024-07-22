class WeatherDataModel {
  CoordModel? coord;
  List<WeatherModel>? weather;
  String? base;
  WeatherMainModel? main;
  int? visibility;
  WindModel? wind;
  CloudsModel? clouds;
  int? dt;
  SysModel? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherDataModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  WeatherDataModel.fromJson(Map<String, dynamic> json) {
    coord =
        json['coord'] != null ? new CoordModel.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <WeatherModel>[];
      json['weather'].forEach((v) {
        weather!.add(new WeatherModel.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null
        ? new WeatherMainModel.fromJson(json['main'])
        : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? new WindModel.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null
        ? new CloudsModel.fromJson(json['clouds'])
        : null;
    dt = json['dt'];
    sys = json['sys'] != null ? new SysModel.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}

class CoordModel {
  double? lon;
  double? lat;

  CoordModel({this.lon, this.lat});

  CoordModel.fromJson(Map<String, dynamic> json) {
    lon = double.tryParse(
      (json['lon'] ?? '').toString(),
    );
    lat = double.tryParse(
      (json['lat'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

class WeatherModel {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class WeatherMainModel {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  double? pressure;
  double? humidity;
  double? seaLevel;
  double? grndLevel;

  WeatherMainModel(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel});

  WeatherMainModel.fromJson(Map<String, dynamic> json) {
    temp = double.tryParse(json['temp'].toString());
    feelsLike = double.tryParse(json['feels_like'].toString());
    tempMin = double.tryParse(json['temp_min'].toString());
    tempMax = double.tryParse(json['temp_max'].toString());
    pressure = double.tryParse(json['pressure'].toString());
    humidity = double.tryParse(json['humidity'].toString());
    seaLevel = double.tryParse(json['sea_level'].toString());
    grndLevel = double.tryParse(json['grnd_level'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    return data;
  }
}

class WindModel {
  double? speed;
  double? deg;
  double? gust;

  WindModel({this.speed, this.deg, this.gust});

  WindModel.fromJson(Map<String, dynamic> json) {
    speed = double.tryParse(json['speed'].toString());
    deg = double.tryParse(json['deg'].toString());
    gust = double.tryParse(json['gust'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}

class CloudsModel {
  int? all;

  CloudsModel({this.all});

  CloudsModel.fromJson(Map<String, dynamic> json) {
    all = int.tryParse(json['all'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class SysModel {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  SysModel({this.type, this.id, this.country, this.sunrise, this.sunset});

  SysModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
