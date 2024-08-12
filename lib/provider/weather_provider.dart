import 'package:flutter/foundation.dart';
import 'package:newtok_test/model/weather_model.dart';

class WeatherProvider extends ChangeNotifier{

  static final WeatherProvider _weatherProvider = WeatherProvider._internal();
  
  factory WeatherProvider() {
    return _weatherProvider;
  }
  
  WeatherProvider._internal();

  WeatherModel? weatherModel;

   void updateData(Map<String, dynamic> json){

    weatherModel = WeatherModel.fromJson(json);
    
    notifyListeners();
  }
}