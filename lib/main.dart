import 'package:api_task/views/TenQuotes.dart';
import 'package:flutter/material.dart';

import 'views/QuoteBy_title.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
