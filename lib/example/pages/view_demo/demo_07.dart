import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Demo_07 extends StatelessWidget {
  const Demo_07({Key key}) : super(key: key);

  showAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("你大爷"),
            content: Container(
              width: 200,
              height: 100,
              color: Colors.red,
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("取消")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("确定")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮示例"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: (){
            showAlert(context, "设置按钮点击");
          })
        ],
      ),
      body: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('阴影按钮'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 20, // 阴影效果
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(content: Text("这是一个原生AlertDialog，这是一个原生AlertDialog。"));
                  },
                );
              },
            ),
            SizedBox(width: 5),
            RaisedButton.icon(
                icon: Icon(Icons.search),
                label: Text('图标按钮'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  print("图标按钮");
                })
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 300,
              child: RaisedButton(
                child: Text('宽度高度'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 20,
                onPressed: () {
                  print("宽度高度");
                },
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 60,
                margin: EdgeInsets.all(40),
                child: RaisedButton(
                  child: Text('自适应按钮'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 20,
                  onPressed: () {
                    print("自适应按钮");
                  },
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('圆角按钮'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  print("圆角按钮");
                }),
            Container(
              height: 80,
              child: RaisedButton(
                  child: Text('圆形按钮'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 20,
                  splashColor: Colors.red,
                  shape: CircleBorder(side: BorderSide(color: Colors.white)),
                  onPressed: () {
                    print("圆形按钮");
                  }),
            ),
            FlatButton(
              child: Text("按钮"),
              color: Colors.blue,
              textColor: Colors.yellow,
              onPressed: () {
                print('FlatButton');
              },
            ),
            SizedBox(width: 10),
            OutlineButton(
                child: Text("按钮2"),
                //  color: Colors.red,  //没有效果
                textColor: Colors.green,
                onPressed: () {
                  print('FlatButton');
                })
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                height: 50,
                child: OutlineButton(
                    child: Text("注册"),
                    textColor: Colors.green,
                    onPressed: () {}),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('登录'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 20,
                  onPressed: () {
                    print("宽度高度");
                  },
                ),
                RaisedButton(
                  child: Text('注册'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 20,
                  onPressed: () {
                    print("宽度高度");
                  },
                ),
                MyButton(
                    text: "自定义按钮",
                    height: 60.0,
                    width: 100.0,
                    pressed: () {})
              ],
            )
          ],
        )
      ],
    );
  }

}

//自定义按钮组件
class MyButton extends StatelessWidget {
  final text;
  final pressed;
  final width;
  final height;
  const MyButton(
      {this.text = '', this.pressed = null, this.width = 80, this.height = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        child: Text(this.text),
        onPressed: this.pressed,
      ),
    );
  }
}
