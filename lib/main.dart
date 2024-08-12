import 'package:flutter/material.dart';
import 'package:newtok_test/screen/homescreen.dart';
import 'package:newtok_test/provider/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
      ],
      child: const MainApp(),
    ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home: Center(
        child: HomeScreen(),
      ),
    );
  }
}
