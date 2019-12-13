import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/doubanmovie/indexPage.dart';
import 'package:flutter_demo/widget/route-arguments/onePage.dart';
// import 'package:flutter_demo/widget/route-nesting/articleListPage.dart';
import 'package:flutter_demo/widget/route-nesting/firstScreen.dart';
import 'package:flutter_demo/widget/tabbar/homePage.dart';
import 'package:flutter_demo/widget/route-simple/firstPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routers,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var routerLists = routers.keys.toList();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new ListView.builder(
            itemCount: routers.length,
            itemBuilder: (context, index) {
              return new InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(routerLists[index]);
                },
                child: new Card(
                  child: new Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    child: new Text(routerName[index]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

// 路由名称
const routerName = ["TabBar实现页面切换", "路由实现页面跳转", "路由带参数跳转", "路由嵌套", "豆瓣影评"];
// 路由
Map<String, WidgetBuilder> routers = {
  "widget/tabbar": (context) {
    return new HomePage();
  },
  "widget/route-simple": (context) {
    return new FirstPage();
  },
  "widget/route-arguments": (context) {
    return new OnePage();
  },
  "widget/route-nesting": (context) {
    // return new ArticleListPage();
    return new FirstScreen();
  },
  "widget/doubanmovie": (context) {
    return new IndexPage();
  }
};
