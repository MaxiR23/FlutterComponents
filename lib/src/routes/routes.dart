import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/container_animated.dart';
import 'package:flutter_components/src/pages/input_page.dart';
import 'package:flutter_components/src/pages/listview_page.dart';
import 'package:flutter_components/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationContext(){
  return <String, WidgetBuilder> {
    "/"                  : (BuildContext context) => HomePage(),
    "alert"              : (BuildContext context) => AlertPage(),
    "avatars"            : (BuildContext context) => AvatarPage(),
    "cards"              : (BuildContext context) => CardPage(),
    "animated_container" : (BuildContext context) => AnimatedContainerPage(),
    "inputs"             : (BuildContext context) => InputPage(),
    "sliders"            : (BuildContext context) => SliderPage(),
    "lists"               : (BuildContext context) => ListViewPage()
  };
}