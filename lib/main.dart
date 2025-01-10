import 'package:flutter/material.dart';
import 'package:country_insight/screens/home_screen.dart';

void main() {
  runApp(CountryInsightApp());
}

class CountryInsightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Insight',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
