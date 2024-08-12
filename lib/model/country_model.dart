class CountryModel {
  Country? country;

  CountryModel({this.country});

  CountryModel.fromJson(Map<String, dynamic> json) {
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Country {
  String? state;
  String? district;
  String? city;
  String? country;


  Country({this.country, this.state, this.district, this.city});

  Country.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    district = json['district'];
    city = json['city'];
    country = json['country'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['district'] = district;
    data['city'] = city;
    data['country'] = country;

    return data;
  }
}
