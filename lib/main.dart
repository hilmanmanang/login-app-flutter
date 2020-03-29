import 'package:flutter/material.dart';
import 'package:test_project/login.dart';
import 'package:test_project/page/bot_nav_bar.dart';
import 'package:test_project/page/home_page.dart';
import 'package:test_project/page/career_objective_page.dart';
import 'package:test_project/page/info_page.dart';

void main() => runApp(MaterialApp(
  title: 'Login Page Project',
  routes: {
    '/': (context) => LoginPage(),
    '/bot_nav_bar': (context) => BotNavBar(),
    '/home_page': (context) => HomePage(),
    '/career_objective_page': (context) => CareerObjectivePage(),
    '/info_page': (context) => InfoPage()
  },
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}