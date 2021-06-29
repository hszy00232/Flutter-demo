import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/route-arguments/passArguments.dart';

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PassArguments passArguments =
        ModalRoute.of(context).settings.arguments;
    print(passArguments.content);

    return Scaffold(
      appBar: AppBar(
        title: Text("Route--TwoPage"),
      ),
      body: ElevatedButton(
        child: Text("Go Back1"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
