import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show alert'),
          color: Colors.indigo,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _openDialog(context),
        ),
      ),
    );
  }

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          title: Text('Alert Page'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('This is a Alert Dialog'),
              FlutterLogo(size: 100,),
            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: Navigator.of(context).pop, child: Text('Cancel')),
            FlatButton(onPressed: Navigator.of(context).pop, child: Text('Ok'))
          ],
        );
      }
    );
  }
}