import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.prensalibre.com/wp-content/uploads/2019/10/000_1LG9HZ.jpg?quality=82&w=760&h=430&crop=1'),
              radius: 25.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('MR'),
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://lh5.googleusercontent.com/proxy/kcpt7JBeFVUvZ7eW1oyPiCbviDM900aUuNTaTX7Z8KlKobSSgMjaFvtcfjdQzlhgRDyFiNMkOfGd3S4pPaT-EKERhtcwZX-ustqSyxtH3vg_L-EIsZk8WEBfKplFJGHM'),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}