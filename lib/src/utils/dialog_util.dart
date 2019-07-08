import 'package:flutter/material.dart';

void displayDialog(BuildContext context, {
  @required String title, 
  String content,
  bool dismissible = true,
  String cancelButton = 'Cancel',
  String okButton: 'Accept',
  String imagePath,
  String imageUrl,
  String imagePlaceHolder = 'assets/images/placeholder.gif',
  Function onCancel,
  Function onOK,
}) {
  showDialog(
    context: context,
    barrierDismissible: dismissible,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(title),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(content),
          SizedBox(height: 16.0,),
          Center(
            child: _showImage(imagePath, imageUrl, imagePlaceHolder),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(cancelButton),
          onPressed: () {
            if(onCancel != null) {
              Navigator.of(context).pop();
              onCancel();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        FlatButton(
          child: Text(okButton),
          onPressed: () {
            if(onOK != null) {
              Navigator.of(context).pop();
              onOK();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    ),
  );
}

Widget _showImage(String path, String url, String placeholder) {
  Widget _image;

  if(path != null) {

    _image = Image.asset(path);

  } else if(url != null) {

    _image = FadeInImage(
      placeholder: AssetImage(placeholder),
      image: NetworkImage(url),
    );
    
  }

  return _image != null ? Container(
    height: 150.0,
    child: _image,
  ) : null;
}