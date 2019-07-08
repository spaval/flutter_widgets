import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _Menu {
  List<dynamic> _options = [];

  Future<List<dynamic>> loadData() async {
    final data = await rootBundle.loadString('assets/data/menu.json');

    Map dataMap = json.decode(data);
    _options = dataMap['routes'];

    return _options;
  }
}

final menu = _Menu();