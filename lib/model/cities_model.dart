class CitiesModel {
  List<String>? cities;

  CitiesModel({this.cities});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    cities = json['cities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cities'] = cities;
    return data;
  }
}
