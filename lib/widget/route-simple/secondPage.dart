import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Route---SecondPage"),
        ),
        body: ElevatedButton(
          child: Text("Go Back1"),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
