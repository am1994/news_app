import 'package:flutter/material.dart';
import 'package:newsapp/screens/News.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.red,
          elevation: 20,   

        ),
        primarySwatch: Colors.blue,
      ),
      home: News(),
    );
  }
}

