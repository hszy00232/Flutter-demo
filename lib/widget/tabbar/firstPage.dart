import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/tabbar/components/list.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("列表"),
      ),
      body: new Container(
        child: new NewList(),
      ),
    );
  }
}
