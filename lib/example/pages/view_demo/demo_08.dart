import 'package:flutter/material.dart';

class Demo_08 extends StatefulWidget {
  Demo_08({Key key}) : super(key: key);

  State<StatefulWidget> createState() {
    return showState();
  }

  State<StatefulWidget> showState() {
    // return _TextFieldDemoPageState(); // TextField的基本使用
    // return _TextDemo(); // TextField属性详解
    return _FormDemoPageState(); // 其它表单类型
  }
}

// TextField
class _TextFieldDemoPageState extends State<Demo_08> {
  //初始化的时候给表单赋值
  TextEditingController _username = new TextEditingController();
  var _password;

  @override
  void initState() {
    super.initState();
    _username.text = '初始值';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TextField账号密码'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          // child:TextDemo() ,
          child: Column(
            children: <Widget>[
              Container(
                  child: Text("账号登录",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              TextField(
                decoration: InputDecoration(hintText: "请输入用户名"),
                controller: _username,
                onChanged: (value) {
                  setState(() {
                    _username.text = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true, // 密文处理
                decoration: InputDecoration(hintText: "密码"),
                onChanged: (value) {
                  print(value);
                  setState(() {
                    this._password = value;
                  });
                },
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                  child: Text("登录"),
                  onPressed: () {
                    print(this._username.text);
                    print(this._password);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}

class _TextDemo extends State<Demo_08> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField属性"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  hintText: "单行文本框", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "多行文本框", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "密码框", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "用户名")),
            SizedBox(height: 20),
            TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "密码",
                  // labelStyle: TextStyle()
                )),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.people), hintText: "请输入用户名")),
          ],
        ),
      ),
    );
  }
}

class _FormDemoPageState extends State<Demo_08> {
  String username;
  int sex = 1;
  String info = '';

  List hobby = [
    {"checked": true, "title": "吃饭"},
    {"checked": false, "title": "睡觉"},
    {"checked": true, "title": "写代码"}
  ];

  List<Widget> _getHobby() {
    List<Widget> tempList = [];
    for (var i = 0; i < this.hobby.length; i++) {
      tempList.add(Row(
        children: <Widget>[
          Text(this.hobby[i]["title"] + ":"),
          Checkbox(
              value: this.hobby[i]["checked"],
              onChanged: (value) {
                setState(() {
                  this.hobby[i]["checked"] = value;
                });
              })
        ],
      ));
    }
    return tempList;
  }

  void _sexChanged(value) {
    setState(() {
      this.sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("学员信息登记系统"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "输入用户信息"),
              onChanged: (value) {
                setState(() {
                  this.username = value;
                });
              },
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Text("男"),
                Radio(
                    value: 1,
                    onChanged: this._sexChanged,
                    groupValue: this.sex),
                SizedBox(width: 20),
                Text("女"),
                Radio(
                    value: 2, onChanged: this._sexChanged, groupValue: this.sex)
              ],
            ),

            //爱好
            SizedBox(height: 40),
            Column(
              children: this._getHobby(),
            ),

            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "描述信息", border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  this.info = value;
                });
              },
            ),

            SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 40,
              child: RaisedButton(
                child: Text("提交信息"),
                onPressed: () {
                  print(this.sex);
                  print(this.username);
                  print(this.hobby);
                },
                color: Colors.blue,
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
