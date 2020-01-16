import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/ref/data_list.dart';


class Demo_03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("GridView示例")),
        body: LayoutDemo3());
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing:10.0 ,   //水平子 Widget 之间间距
      mainAxisSpacing: 10.0,    //垂直子 Widget 之间间距
      padding: EdgeInsets.all(10),
      crossAxisCount: 2,  //一行的 Widget 数量
      // childAspectRatio:0.7,  //宽度和高度的比例
      children: this._getListData(),
    );
  }

  List<Widget> _getListData() {
    var tempList = dataList.map((value){
      return Container(
        child:Column(
          children: <Widget>[
            Image.network(value['imageUrl']),
            SizedBox(height: 12,),
            Text(
              value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
              ),
              maxLines: 1,
            )
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color:Color.fromRGBO(233, 233,233, 0.9),
                width: 1
            )
        ),
        // height: 400,  //设置高度没有反应
      );
    });

    print("llq002: " + tempList.toString());

    // ('xxx','xxx')
    return tempList.toList();
  }
}

class LayoutDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return IconContainer(Icons.home, color: Colors.orange, size: Size(160, 144));
    return Container(
      width: 300,
      height: 64,
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconContainer(
            Icons.home,
            color: Colors.green,
            size: Size(32, 32),
          ),
          IconContainer(
            Icons.search,
            color: Colors.yellow,
            size: Size(32, 32),
          ),
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  IconData iconData;
  Color color = Colors.grey;
  Size size = Size(60, 44);
  IconContainer(this.iconData, {this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.size.height,
      width: this.size.width,
      color: this.color,
      child: Center(
        child: Icon(this.iconData),
      ),
    );
  }
}

class LayoutDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          color: Colors.orange,
        ),
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 180,
                child: Image.network("https://www.itying.com/images/flutter/3.png", fit: BoxFit.cover,),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.green,
                    height: 85,
                    child: Image.network("https://www.itying.com/images/flutter/4.png", fit: BoxFit.cover),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 85,
                    child: Image.network("https://www.itying.com/images/flutter/5.png", fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}