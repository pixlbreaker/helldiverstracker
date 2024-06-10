import 'package:helldiverstracker/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:helldiverstracker/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomePage(),
      //theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
