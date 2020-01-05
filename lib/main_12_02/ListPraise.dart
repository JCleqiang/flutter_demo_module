import 'package:flutter/material.dart';
import 'package:flutter_demo_module/ref/listData.dart';

class ListPraise extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPraiseView();
  }
}

class _ListPraiseView extends State<ListPraise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ListPraise",
            style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.details),
                onPressed: () {
                  print("IconButton click");
                }),
          ],
        ),
        body: ListView.builder(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          itemCount: listData.length,

          
          itemBuilder: this._getListData,
        ));
  }

  Widget _getListData(BuildContext context, int index) {
    return ListTile(
      title: Text(listData[index]["title"]),
      trailing: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            print("IconButton click");
          }),
    );
  }
}
