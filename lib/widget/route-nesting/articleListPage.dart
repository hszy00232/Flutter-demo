import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/route-nesting/article.dart';
import 'package:flutter_demo/widget/route-nesting/articleContPage.dart';

class ArticleListPage extends StatelessWidget {
  final List<Article> articles = List.generate(10, (i) {
    return new Article(
        content: 'Article $i: The Quick brown fox jumps over the lazy dog',
        title: 'Article $i');
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article List"),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(articles[index].title),
            onTap: () async {
              // String result = await Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ArticleContPage(
              //               articles[index],
              //             )));

              String result = await Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, _, __) =>
                        ArticleContPage(articles[index]),
                    transitionsBuilder: (context, Animation<double> animation,
                        Animation<double> secondaryAnimation, Widget child) {
                      return new FadeTransition(
                        opacity: animation,
                        child: RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 600),
                  ));

              if (result != null) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("$result"),
                  duration: const Duration(seconds: 1),
                ));
              }
            },
          );
        },
      ),
    );
  }
}
