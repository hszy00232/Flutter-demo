import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/route-nesting/article.dart';

class ArticleContPage extends StatelessWidget {
  final Article article;

  ArticleContPage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${article.title}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text('${article.content}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Like');
                  },
                  child: Text("Like"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'UnLike');
                  },
                  child: Text("UnLike"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
