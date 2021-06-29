import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/doubanmovie/hot/hotWidget.dart';
import 'package:flutter_demo/widget/doubanmovie/mine/mineWidget.dart';
import 'package:flutter_demo/widget/doubanmovie/movies/moviesWidget.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  final _widgetItems = [
    HotWidget(),
    MovieWidget(),
    MineWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.school), label: "热映"),
        BottomNavigationBarItem(
            icon: Icon(Icons.panorama_fish_eye), label: "找片"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "我的"),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
    );
    return Scaffold(
      body: _widgetItems[_selectedIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 刷新界面
    });
  }
}
