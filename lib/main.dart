import 'package:beavers_prototype/screens/main_screen.dart';
import 'package:beavers_prototype/screens/startup_screen.dart';
import 'package:beavers_prototype/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beavers Prototype',
      theme: ThemeData(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const MainScreen(),
      home: const MainScreen(),
    );
  }
}
