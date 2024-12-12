import 'package:flutter/material.dart';
import 'package:medical/screens/home_screen.dart';
import 'package:medical/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: Constants.lighTheme(context),
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}
