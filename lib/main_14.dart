import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('main_07')),
      body: HomePage(),
    ));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<HomePage> {
  List data;

  @override
  void initState() {
    super.initState();
    _httpClient();
  }

  void _httpClient() async {
//    var responseBody;

    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(
        Uri.parse("http://www.wanandroid.com/project/list/1/json?cid=1"));

    var response = await request.close();

    if (response.statusCode == 200) {
      var responseBody = await response.transform(utf8.decoder).join();

      var convertDataToJson = jsonDecode(responseBody)["data"]["datas"];
      setState(() {
        data = convertDataToJson;
      });

      convertDataToJson.forEach((item) {
        print(item["envelopePic"]);
      });
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(children: data != null ? _getItem() : _loading()),
    );
  }

  List<Widget> _loading() {
    return <Widget>[
      new Container(
        height: 300.0,
        child: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
            new Text("正在加载"),
          ],
        )),
      )
    ];
  }

  List<Widget> _getItem() {
    return data.map((item) {
      return new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: _getRowWidget(item),
        ),
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0),
      );
    }).toList();
  }

  Widget _getRowWidget(item) {
    return new Row(
      children: <Widget>[
        Flexible(
            flex: 1,
            fit: FlexFit.tight, //和android的weight=1效果一样
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("${item["title"]}".trim(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.left,
                    maxLines: 1),
                    Text(
                      "${item["desc"]}",
                      maxLines: 3,
                    )
                  ],
                )
              ],
            )),
        ClipRect(
          child: FadeInImage.assetNetwork(
            placeholder: "images/01.png",
            image: "${item['envelopePic']}",
            width: 50.0,
            height: 50.0,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
