import 'package:flutter/material.dart';

import 'package:flutter_demo/widget/tabbar/components/input.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => new _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String active = 'test';
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("通信"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: controller,
              onChanged: _onChanged,
            ),
            new Input(
              active: active,
            )
          ],
        ),
      ),
    );
  }

  void _onChanged(String value) {
    setState(() {
      active = value;
    });
  }
}
