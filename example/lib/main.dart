import 'package:example/ui/screens/api_data_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// * [MyApp] is the root widget of the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApiDataScreen(),
    );
  }
}