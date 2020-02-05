import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _name = '';
  
  String _email = '';

  String _password = '';

  TextEditingController _textEditingController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('Input Page'),
         backgroundColor: Colors.indigo,
       ),
       body: ListView(
         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
         children: <Widget>[
           _createTfName(),
           Divider(),
           _createTfEmail(),
           Divider(),
           _createTfPassword(),
           Divider(),
           _createTfDate(context)
         ],
       ),
    );
  }

  Widget _createTfName() {
    return TextField(
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('${_name.length}'),
        hintText: 'Name',
        labelText: 'Name:',
        helperText: 'Insert name',
        icon: Icon(Icons.person_pin),
      ),
      onChanged: (value){
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createTfEmail() {
     return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: 'E-mail',
        labelText: 'E-mail:',
        helperText: 'Insert E-mail',
        icon: Icon(Icons.email),
      ),
      onChanged: (value){
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createTfPassword() {
     return TextField(
      obscureText: true,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: 'Password',
        labelText: 'Password:',
        icon: Icon(Icons.lock_open),
      ),
      onChanged: (value){
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _createTfDate(BuildContext context) {
     return TextField(
      enableInteractiveSelection: false,
      controller: _textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('${_name.length}'),
        hintText: 'Name',
        labelText: 'Name:',
        helperText: 'Insert name',
        icon: Icon(Icons.person_pin),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());

        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime _picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1940), 
      lastDate: DateTime.now(),
      locale: Locale('en')
    );

    String _date = '';

    if(_picked != null){
      setState(() {
        _date = _picked.toString();
        _textEditingController.text = _date;
      });
    }
  }
}