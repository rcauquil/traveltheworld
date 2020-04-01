import 'package:flutter/material.dart';
import 'package:traveltheworld/models/user.dart';
import 'package:traveltheworld/screens/wrapper.dart';
import 'package:traveltheworld/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => Wrapper(),
        },
        theme: ThemeData(
          // Color
          primaryColor: Color.fromRGBO(0,0,145,1),
          accentColor: Color.fromRGBO(255,0,15,1),
        ),
      ),
    );
  }
}