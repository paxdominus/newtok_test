import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newtok_test/screen/admin_dashboard_screen.dart';
import 'package:newtok_test/screen/user_dashboard_screen.dart';
import 'package:newtok_test/style/styles.dart';
import '../firebase_options.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "choose role",
              style: Styles().getTextStyle(22),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminDashboardScreen()));
                  },
                  child: Text(
                    "Admin",
                    style: Styles().getTextStyle(20),
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserDashboardScreen()));
                  },
                  child: Text(
                    "User",
                    style: Styles().getTextStyle(20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
