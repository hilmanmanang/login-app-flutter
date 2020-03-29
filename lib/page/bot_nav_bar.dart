import 'package:flutter/material.dart';
import 'package:test_project/page/career_objective_page.dart';
import 'package:test_project/page/home_page.dart';
import 'package:test_project/page/info_page.dart';

class BotNavBar extends StatefulWidget {
  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {

  int _pageCount = 0;
  final _pageOptions = [
    HomePage(),
    CareerObjectivePage(),
    InfoPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hilman's Flutter Apps"
        )
      ),
      body: _pageOptions[_pageCount],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageCount,
        onTap: (int index) {
          setState(() {
            _pageCount = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            title: Text("Objective")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text("Info")
          )
        ],
        

      ),
      
    );
  }
}