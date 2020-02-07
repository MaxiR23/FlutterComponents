import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  
  List<int> _numberList = [1,2,3,4,5];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('ListView Page'),
         backgroundColor: Colors.indigo,
       ),
       body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
      itemCount: _numberList.length,
      itemBuilder: (BuildContext context, int index){

        final imageIndex = _numberList[index];

        return FadeInImage(
          image: NetworkImage('https://picsum.photos/400/300?image=$imageIndex'),
          placeholder: AssetImage('assets/loading.gif'),
          fit: BoxFit.contain,
        );
      }
    );
  }
}