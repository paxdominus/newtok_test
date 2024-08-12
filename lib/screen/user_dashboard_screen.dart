import 'package:flutter/material.dart';
import 'package:newtok_test/screen/user_location_list_screen.dart';
import 'package:newtok_test/screen/user_weather_report_screen.dart';

import '../api/api.dart';
import '../style/styles.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "welcome to dashboard",
              style: Styles().getTextStyle(18),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserLocationListScreen(),
                      ));
                },
                child: Text(
                  "List Locations",
                  style: Styles().getTextStyle(15),
                )),
            ElevatedButton(
                onPressed: () async {
                  if (await Api().pickFile()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UserWeatherReportScreen()));
                  }
                },
                child: Text(
                  "Upload",
                  style: Styles().getTextStyle(15),
                )),
          ],
        ),
      ),
    );
  }
}
