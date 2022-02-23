import 'package:flutter/material.dart';

class About extends StatelessWidget {
  // Declare a field that holds the Person data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[30],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[30],
        foregroundColor: Colors.blueGrey[30],
        title: Text("About"),
        brightness: Brightness.dark,
      ),
      body: Container(
        // Add box decoration
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.blueGrey[300]!,
              Colors.blueGrey[200]!,
              Colors.blueGrey[100]!,
              Colors.blueGrey[50]!,
            ],
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Display passed data from first screen
              Icon(Icons.account_circle_rounded,
                  size: 150, color: Colors.blueGrey[50]),
              const Text(
                "This App was made by:",
                textAlign: TextAlign.start,
              ),
              const Text("Solomon Tigabu : 1010981"),
              const Text("Meron Getye : 1010599"),
              const Text("Tsion Assefa : 1010597"),
              const Text("Lefiker Mulugeta : 1010577"),

              Container(
                margin: EdgeInsets.all(10),
                height: 70.0,
                child: SizedBox.fromSize(
                  size: Size(70, 70), // button width and height
                  child: ClipOval(
                    child: Material(
                      color: Colors.blueGrey, // button color
                      child: InkWell(
                        splashColor: Colors.blueAccent,
                        // splash color
                        onTap: () => Navigator.pop(context),
                        // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.home_filled,
                              color: Colors.white,
                            ), // icon
                            Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
