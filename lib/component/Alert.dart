import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugs_02/flutter_plugs_02.dart';

//自定义有状态组件
class Alert extends StatefulWidget {
  Alert({Key key}) : super(key: key);

  _AlertPageState2 createState() => _AlertPageState2();

  static showAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("确定")),
            ],
          );
        });
  }
}

class _AlertPageState2 extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
