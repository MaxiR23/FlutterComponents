import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  
  List<int> _numberList = new List();

  int _lastItem = 0;

  bool _isLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    add10Images();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('ListView Page'),
         backgroundColor: Colors.indigo,
       ),
       body: Stack(
         children: <Widget>[
           _createList(),
           _createLoading(),
         ],
       ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _fetchPage,
          child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index){

          final imageIndex = _numberList[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/400/300?image=$imageIndex'),
            placeholder: AssetImage('assets/loading.gif'),
            fit: BoxFit.contain,
          );
        }
      ),
    );
  }

  void add10Images(){
    for(var i = 1; i < 10; i++){
      _lastItem++;
      _numberList.add(_lastItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);

    new Timer(duration, _response);
  }

  void _response(){
    _isLoading = false;
    add10Images();

    _scrollController.animateTo(
      _scrollController.position.pixels + 100, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastOutSlowIn
    );
  }

  Widget _createLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(width: 15.0,)
        ],
      );
    }
    else {
      return Container();
    }
  }

  Future<Null> _fetchPage() {
    final duration = new Duration(seconds: 2);

    new Timer(duration, (){
      
      _numberList.clear();
      _lastItem++;
      add10Images();
    });

    return Future.delayed(duration);
  }
}