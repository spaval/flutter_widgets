import 'package:flutter/material.dart';
import 'dart:async';

import 'package:moments/src/widgets/spinner_widget.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _controller = ScrollController();
  List<int> _numbers = [];
  int _last = 0;
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    _addMore();

    _controller.addListener(() {
      if(_controller.position.pixels == _controller.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lists')),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createSpinner(),
        ]
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: ListView.builder(
        controller: _controller,
        itemCount: _numbers.length,
        itemBuilder: (context, i) {
          final image = _numbers[i];
          
          return FadeInImage(
            placeholder: AssetImage('assets/images/placeholder.gif'),
            image: NetworkImage('https://picsum.photos/500/300?image=$image'),
          );
        }
      ),
    );
  }

  void _addMore() {
    for(int i=1; i<10; i++) {
      _last++;
      _numbers.add(_last);
    }

    setState(() => _loading = false);
  }

  Future _fetchData() async {
    setState(() => _loading = true);
    Timer(Duration(seconds: 2), () {
      _controller.animateTo(
        _controller.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 250),
      );
      
      _addMore();
    });
  }

  Future<void> _refreshData() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _numbers.clear();
      _addMore();
    });

    return Future.delayed(duration);
  }

  Widget _createSpinner() {
    if(_loading) {
      return Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spinner(),
              ],
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}