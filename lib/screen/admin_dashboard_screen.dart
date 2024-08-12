import 'package:flutter/material.dart';
import 'package:newtok_test/screen/admin_add_location_screen.dart';

import '../style/styles.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
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
                          builder: (context) => AdminAddLocationScreen()));
                },
                child: Text(
                  "Add Location",
                  style: Styles().getTextStyle(20),
                )),
          ],
        ),
      ),
    );
  }
}
