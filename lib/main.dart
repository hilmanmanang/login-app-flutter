import 'package:flutter/material.dart';
import 'package:test_project/page/login.dart';
import 'package:test_project/page/info.dart';

void main() => runApp(MaterialApp(
  title: 'Login Page Project',
  initialRoute: '/',
  routes: {
    '/': (context) => LoginPage(),
    '/info': (context) => Info()
  },
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}