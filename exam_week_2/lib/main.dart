import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/halaman-1': (context) => Halaman1(),
        '/halaman-2': (context) => Halaman2(),
      },
      home: Scaffold(
          appBar: AppBar(
            title: Text("Row"),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text("Halo 1 !!!"),
                color: Colors.lime,
                padding: EdgeInsets.all(16.0),
              ),
              Container(
                child: Text("Halo 2 !!!"),
                color: Colors.purple,
                padding: EdgeInsets.all(16.0),
              ),
              Container(
                child: Text("Halo 3 !!!"),
                color: Colors.lightBlue,
                padding: EdgeInsets.all(16.0),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/halaman-1');
                  Navigator.pushNamed(context, '/halaman-2');
                },
              )
            ],
          )),
    );
  }
}
