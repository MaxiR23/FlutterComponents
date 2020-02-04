import 'package:flutter/material.dart';

import 'package:flutter_components/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationContext(){
  return <String, WidgetBuilder> {
    "/" : (BuildContext context) => HomePage(),
  };
}