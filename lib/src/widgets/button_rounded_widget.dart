import 'package:flutter/material.dart';

class ButtonRounded extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final Function onTap;

  ButtonRounded({
    @required this.title, 
    @required this.onTap,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(title),
      color: color,
      textColor: textColor,
      shape: StadiumBorder(),
      onPressed: onTap,
    );
  }
}