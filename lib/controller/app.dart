import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/controller/home/home.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Home(),
        ),
      ),
    );
  }
}
