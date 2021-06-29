import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("demo1"),
            onPressed: () {
              Navigator.pushNamed(context, 'demo1');
            },
          ),
        ),
      );
}
