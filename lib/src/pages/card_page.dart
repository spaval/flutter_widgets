import 'package:flutter/material.dart';
import 'package:moments/src/widgets/card_image_widget.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card')),
      body: ListView(
        children: <Widget>[
          CardImage(
            image : 'https://wonderfulengineering.com/wp-content/uploads/2014/07/Landscape-wallpapers-5.jpg',
            content: 'This is a content to demostrate how powerful flutter is.',
          ),
        ],
      ),
    );
  }
}