import 'package:flutter/material.dart';
import 'package:newtok_test/style/styles.dart';
import 'package:newtok_test/provider/weather_provider.dart';
import 'package:provider/provider.dart';

class UserWeatherReportScreen extends StatefulWidget {
  const UserWeatherReportScreen({super.key});

  @override
  State<UserWeatherReportScreen> createState() =>
      _UserWeatherReportScreenState();
}

class _UserWeatherReportScreenState extends State<UserWeatherReportScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<WeatherProvider>(
          builder: (context, value, child) => Column(
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 100),
                  child: Column(
                    children: [
                      Text("country:", style: Styles().getTextStyle(15),),

                      Text(value.weatherModel?.location?.country.toString() ??
                          "",  style: Styles().getTextStyle(15),),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 100),
                  child: Column(
                    children: [
                      Text("local time:",  style: Styles().getTextStyle(15),),

                      Text(value.weatherModel?.location?.localtime.toString() ??
                          "",  style: Styles().getTextStyle(15),),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 100),
                  child: Column(
                    children: [
                      Text("region:",  style: Styles().getTextStyle(15),),

                      Text(value.weatherModel?.location?.region.toString() ??
                          "",  style: Styles().getTextStyle(15),),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 100),
                  child: Column(
                    children: [
                      Text("temperature:",  style: Styles().getTextStyle(15),),

                      Text(value.weatherModel?.current?.feelslikeC.toString() ??
                          "",  style: Styles().getTextStyle(15),),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 100),
                  child: Column(
                    children: [
                      Text("humidity:",  style: Styles().getTextStyle(15),),

                      Text(value.weatherModel?.current?.humidity.toString() ??
                          "",  style: Styles().getTextStyle(15),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
