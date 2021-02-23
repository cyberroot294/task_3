import 'package:flutter/material.dart';
import 'package:task_3/screens/converter.dart';
import 'package:task_3/screens/login_screen.dart';
import 'package:task_3/screens/physics.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyan[900], Colors.indigo],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Login Screen"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            RaisedButton(
              child: Text("Hitung Fisika"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Physics()),
                );
              },
            ),
            RaisedButton(
              child: Text("Konversi Nilai"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Converter()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
