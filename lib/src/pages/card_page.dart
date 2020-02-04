import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Page'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _createCard(),
          SizedBox(height: 30.0,),
          _createCard2()
        ],
      )
    );
  }

  Widget _createCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Card Page'),
            subtitle: Text('Hi, i´m a card'),
            leading: Icon(Icons.folder_open, color: Colors.indigo,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: (){}, child: Text('Cancel')),
              FlatButton(onPressed: (){}, child: Text('Ok'))
            ],
          )
        ],
      ),
    );
  }

  Widget _createCard2() {
      final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://handluggageonly.co.uk/wp-content/uploads/2018/12/Hand-Luggage-Only-10-5.jpg'),
            placeholder: AssetImage('assets/loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Places'),
          )
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}