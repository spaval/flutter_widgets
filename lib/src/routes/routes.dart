import 'package:flutter/material.dart';

import 'package:moments/src/pages/alert_page.dart';
import 'package:moments/src/pages/animated_container_page.dart';
import 'package:moments/src/pages/list_page.dart';
import 'package:moments/src/pages/slider_page.dart';
import 'package:moments/src/pages/card_page.dart';
import 'package:moments/src/pages/home_page.dart';
import 'package:moments/src/pages/inputs_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder> {
    '/'          : (BuildContext context) => HomePage(),
    'alert'      : (BuildContext context) => AlertPage(),
    'avatar'     : (BuildContext context) => SliderPage(),
    'card'       : (BuildContext context) => CardPage(),
    'animated'   : (BuildContext context) => AnimatedContainerPage(),
    'inputs'     : (BuildContext context) => InputsPage(),
    'list'       : (BuildContext context) => ListPage(),
  };
}