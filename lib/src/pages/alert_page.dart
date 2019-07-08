import 'package:flutter/material.dart';
import 'package:moments/src/utils/dialog_util.dart';
import 'package:moments/src/widgets/button_rounded_widget.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert')),
      body: Center(
        child: ButtonRounded(
          title: 'Show Alert', 
          onTap: () => displayDialog(
            context,
            title: 'Moments', 
            content: 'This is a content to demostrate how powerful flutter is.',
            imageUrl: 'https://wonderfulengineering.com/wp-content/uploads/2014/07/Landscape-wallpapers-5.jpg'
          ),
        ),
      ),
    );
  }
}