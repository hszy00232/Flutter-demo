import 'package:flutter/material.dart';

class PlaceHolderWidget extends StatelessWidget {
  final String text;
  PlaceHolderWidget(this.text);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(text),
      );
}
