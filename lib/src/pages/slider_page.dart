import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider')),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      value: _value,
      min: 100.0,
      max: 500.0,
      activeColor: Colors.orange,
      label: 'Bongga',
      onChanged: (value) => setState(() => _value = value),
    );
  }

  Widget _createImage() {
    return FadeInImage(
      placeholder: AssetImage('assets/images/placeholder.gif'),
      image: NetworkImage('https://4.bp.blogspot.com/-M6mPib3qUN8/V0vrxyWw5KI/AAAAAAAAFMA/xBCLMUVvPcgTbqvIxp5VO7qwElQDNeU8gCLcB/s1600/Black%2BPanther%2Bback%2Bfront%2Bveiw.jpg'),
      width: _value,
      fit: BoxFit.contain,
    );
  }
}