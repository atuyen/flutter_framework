import 'package:flutter/material.dart';
import 'package:my_framework/study/service_locator.dart';
import 'study_screen.dart';



void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: StudyScreen()
    );
  }
}







