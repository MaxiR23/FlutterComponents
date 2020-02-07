import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _value = 20.0;

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('Slider - Checks Page'),
         backgroundColor: Colors.indigo,
       ),
       body: Container(
         padding: EdgeInsets.only(top: 20.0),
         child: Column(
           children: <Widget>[
             _createSlider(),
             _createCheck(),
             _createSwitch(),
             Divider(),
             Expanded(child: _creeateImage())
           ],
         ),
       ),
    );
  }

  Widget _createSlider() {
    return Slider(
      value: _value,
      max: 400.0,
      min: 5.0,
      activeColor: Colors.indigo, 
      onChanged: (_isSelected) ? null : (value){
        setState(() {
          _value = value;
        });
      }
    );
  }

  Widget _creeateImage() {
    return Image(
      image: NetworkImage('https://www.pngitem.com/pimgs/m/27-274457_wolverine-xmen-marvel-wolverine-comic-png-transparent-png.png'),
      width: _value,
      fit: BoxFit.contain,
    ); 
  }

  Widget _createCheck() {
    /*return Checkbox(
      value: _isSelected, 
      activeColor: Colors.indigo,
      onChanged: (value){
        setState(() {
          _isSelected = value;
        });
      }
    );
  }*/

  return CheckboxListTile(
      title: Text('Block Check'),
      value: _isSelected, 
      activeColor: Colors.indigo,
      onChanged: (value){
        setState(() {
          _isSelected = value;
        });
      }
    );
  }

  Widget _createSwitch() {
     return SwitchListTile(
      title: Text('Block Check'),
      value: _isSelected, 
      activeColor: Colors.indigo,
      onChanged: (value){
        setState(() {
          _isSelected = value;
        });
      }
    );
  }
}