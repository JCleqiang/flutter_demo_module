import 'package:flutter/material.dart';

// ignore: camel_case_types
class Demo_00 extends StatefulWidget {
  /**
   * 在StatefulWidget调用createState之后，框架将新的状态对象插入树中，然后调用状态对象的initState。
   * 子类化State可以重写initState，以完成仅需要执行一次的工作。 
   * initState的实现中需要调用super.initState。
   */
  @override
  State<StatefulWidget> createState() {
    return MyHome();
  }
}

class MyHome extends State<Demo_00> {
  @override
  //初始化状态
  void initState() {
    super.initState();
    print("initState -- 初始化");
  }

  @override
  // build方法-用于构建Widget子树
  Widget build(BuildContext context) {
    print("build -- 用于构建Widget子树");
    return Scaffold(
        appBar: AppBar(title: Text('首页02')),
        body: Center(
          child: Text(
            "你大爷2222",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 22,
              backgroundColor: Colors.white,
              color: Color.fromARGB(255, 22, 222, 222),
            ),
          ),
        ));
  }

  // 在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一
  // 位置的新旧节点，然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调
  @override
  void didUpdateWidget(Demo_00 oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget -- 更新Widget");
  }

  // 专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble -- 重新装配");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies -- 改变依赖");
  }

  // 当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print("deactive -- 停用");
  }

  /**
   * 当一个状态对象不再需要时，框架调用状态对象的dispose。 您可以覆盖该dispose方法来执行清理工作
   */
  @override
  void dispose() {
    super.dispose();
    print("dispose -- 处理");
  }
}
