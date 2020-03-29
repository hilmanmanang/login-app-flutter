import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0)),
            Image(
              image: AssetImage("assets/images/hilman_passport.jpg"),
              width: 200.0,
              height: 200.0
            ),
            Padding(
              padding: EdgeInsets.all(8.0)
            ),
            Text(
              'Name:', 
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            ),
            Text(
              'Muhammad Hilman Bin Ahmad', 
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0)
            ),
            Text(
              'Age:', 
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            ),
            Text(
              '27 years old', 
              style: TextStyle(
                fontSize: 20.0
              )
            )
          ]
        )
      )
    );
  }
}