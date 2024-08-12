import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtok_test/provider/weather_provider.dart';

class Api extends ChangeNotifier{
  addCountry(Map<String, dynamic> json) async {

    try{

    final response = await Dio().post(
        "https://newtok-app-default-rtdb.firebaseio.com/country.json",
        data: json);

    Fluttertoast.showToast(msg: response.data.toString());
    }
    catch(e){

    }
  }

  Future<DataSnapshot> getData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('country').get();
    if (snapshot.exists) {
      log(snapshot.value.toString());
    } else {
      log('No data available.');
    }
    return snapshot;
  }

 Future<bool> pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      PlatformFile file = result.files.first;

      try{
      final input = File(file.path!).openRead();
      final fields = await input
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();

      await dotenv.load(fileName: ".env");
      final apiKey = dotenv.get("API_KEY");
      log(apiKey);
      log(fields.first.last.toString());

      final response = await Dio().post(
          "http://api.weatherapi.com/v1/current.json",
          queryParameters: {"key": apiKey, "q": fields.first.last.toString()});
          WeatherProvider().updateData(response.data);
          // WeatherModel.fromJson(response.data);
          notifyListeners();
      }
      catch(e){
        return false;
      }

    }
    return true;
  }
}
