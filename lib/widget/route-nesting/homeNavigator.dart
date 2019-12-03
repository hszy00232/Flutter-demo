import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/route-nesting/articleListPage.dart';
import 'package:flutter_demo/widget/route-nesting/homePage.dart';

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Navigator(
        initialRoute: 'home',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case "home":
              builder = (BuildContext context) => HomePage();
              break;
            case "demo1":
              builder = (BuildContext context) => ArticleListPage();
              break;
            default:
              throw new Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      );
}
