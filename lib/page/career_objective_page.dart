import 'package:flutter/material.dart';

class CareerObjectivePage extends StatefulWidget {
  @override
  _CareerObjectivePageState createState() => _CareerObjectivePageState();
}

class _CareerObjectivePageState extends State<CareerObjectivePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(8.0)
            ),
          Text(
            'Career Objective:', 
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            )
          ),
          Text(
            'Seeking for entry level position as Web and App Developer that allow me to gain skills and knowledges that offers professional growth in IT industry.', 
            style: TextStyle(
              fontSize: 20.0
            )
          ),
          Padding(
              padding: EdgeInsets.all(8.0)
          )
        ]
      )
    );
  }
}