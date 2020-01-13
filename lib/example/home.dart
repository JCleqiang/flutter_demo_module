import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Color _bgColor;
  String _title;

  Home(Color bgColor, String title) {
    _bgColor = bgColor;
    _title = title;
  }

  @override
  State<StatefulWidget> createState() {
    return HomePage(_bgColor, _title);
  }

}


class HomePage extends State<Home> {
  Color _bgColor;
  String _title;

  HomePage(Color bgColor, String title) {
    _bgColor = bgColor;
    _title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Container(
        color: _bgColor,
      ),
    );
  }

}