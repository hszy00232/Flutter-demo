import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/tabbar/firstPage.dart';
import 'package:flutter_demo/widget/tabbar/secondPage.dart';
import 'package:flutter_demo/widget/tabbar/thirdPage.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["列表", "通知", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new FirstPage(),
            new SecondPage(),
            new ThirdPage()
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.blue,
          child: new TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ));
  }
}
