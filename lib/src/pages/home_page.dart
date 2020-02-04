import 'package:flutter/material.dart';

import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          children: _createItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createItems(List<dynamic> data, BuildContext context) {
    List<Widget> listt = [];

    data.forEach((items) {
      final widgetT = ListTile(
        title: Text(items['text']),
        leading: getIcons(items['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => Navigator.pushNamed(context, items['route']),
      );
      listt..add(widgetT)..add(Divider());
    });

    return listt;
  }
}
