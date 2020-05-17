import 'package:flutter/material.dart';
import 'package:traveltheworld/services/redirection.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RedirectionService().builder,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0,0,145,1),
        accentColor: Color.fromRGBO(255,0,15,1),
      ),
    );
  }
}