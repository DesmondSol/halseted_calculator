import 'package:flutter/material.dart';
import 'package:halseted_calculator/halstead_calculator.dart';

class Results extends StatelessWidget {
  // Declare a field that holds the Person data
  final double n1;
  final double n2;
  final double N1;
  final double N2;

  final HalsteadCalculator calculator = new HalsteadCalculator();
  // In the constructor, require a Person
  Results(
      {required this.n1, required this.n2, required this.N1, required this.N2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[30],
      appBar: AppBar(
         backgroundColor: Colors.blueGrey[30],
        foregroundColor: Colors.blueGrey[30],
        title: Text("Results"), brightness: Brightness.dark,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Display passed data from first screen
          Text(
              "Vocabulary : ${calculator.halstead_vocabulary(n1.toInt(), n2.toInt())}"),
          Text(
              "Length : ${calculator.halstead_length(N1.toInt(), N2.toInt())}"),
          Text(
              "Volume : ${calculator.halstead_volume(n1.toInt(), n2.toInt(), N1.toInt(), N2.toInt())}"),
          Text(
              "Difficulty : ${calculator.halstead_difficulty(n1.toInt(), n2.toInt(), N2.toInt())}"),
          Text(
              "level : ${calculator.halstead_level(n1.toInt(), n2.toInt(), N2.toInt())}"),
          Text(
              "Intelegence : ${calculator.halstead_intelegence(n1.toInt(), n2.toInt(), N1.toInt(), N2.toInt())}"),
          Text(
              "Effort : ${calculator.halstead_effort(n1.toInt(), n2.toInt(), N1.toInt(), N2.toInt())}"),
          Text(
              "Time : ${calculator.halstead_time(n1.toInt(), n2.toInt(), N1.toInt(), N2.toInt())}"),
          Text(
              "Remaining Bugs : ${calculator.halstead_remaining_bugs(n1.toInt(), n2.toInt(), N1.toInt(), N2.toInt())}"),
          Text(
              "Program Estimated Length : ${calculator.halstead_program_estimated_length(n1.toInt(), n2.toInt())}"),
          RaisedButton(
              child: new Text("Go Back!"),
              onPressed: () {
                // Navigate back to first screen when tapped!
                Navigator.pop(context);
              }),
        ],
      )),
    );
  }
}
