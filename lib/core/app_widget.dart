import 'package:flutter/material.dart';
import 'package:nlw_05/splash/splash.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: SplashPage(),
    );
  }
}
