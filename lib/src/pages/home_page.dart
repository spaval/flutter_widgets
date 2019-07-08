import 'package:flutter/material.dart';
import 'package:moments/src/utils/icon_util.dart';
import 'package:moments/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moments'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: menu.loadData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snap) {
          return ListView(
            children: _itemList(snap.data, context)
          );
        },
      ),
    );
  }

  List<Widget> _itemList(List<dynamic> data, BuildContext context) {
    final List<Widget> items = [];

    data.forEach((item) {
      final tile = ListTile(
        title: Text(item['name']),
        leading: getIcon(item['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => Navigator.pushNamed(context, item['path']),
      );

      items..add(tile)
           ..add(Divider());
    });

    return items;
  }
}