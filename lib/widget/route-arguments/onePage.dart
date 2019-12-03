import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/route-arguments/passArguments.dart';
import 'package:flutter_demo/widget/route-arguments/twoPage.dart';

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route--OnePage"),
      ),
      body: RaisedButton(
        child: Text("Jump TwoRoute"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TwoPage(),
                settings: RouteSettings(
                    arguments: PassArguments("Data from OnePage Build")),
              ));
        },
      ),
    );
  }
}
