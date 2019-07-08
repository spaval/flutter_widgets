import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  
  final String image;
  final String placeholder;
  final String content;

  CardImage({ 
    Key key,
    this.image,
    this.placeholder = 'assets/images/placeholder.gif',
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage(placeholder),
            image: NetworkImage(image),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(content != null ? 10.0 : 0.0),
            child: content != null ? Text(content) : null,
          ),
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 5.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: card,
      ),
    );
  }
}