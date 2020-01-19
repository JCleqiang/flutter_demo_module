import 'package:flutter/material.dart';

class Demo_11 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _AnimationZoomState();
  }

}

class _AnimationZoomState extends State<Demo_11> with TickerProviderStateMixin {

  // 放大动画
  Animation<double> animationEnlarge;
  // 放大动画控制器
  AnimationController enlargeAnimationController;
  // 缩小动画
  Animation<double> animationNarrow;
  // 缩小动画控制器
  AnimationController narrowAnimationController;

  @override
  void initState() {
    super.initState();

    // 定义动画持续时长
    enlargeAnimationController = new AnimationController(vsync: this, duration:Duration(seconds: 5) );
    narrowAnimationController = new AnimationController(vsync: this, duration: Duration(seconds: 5));

    // 定义缩放动画范围
    animationEnlarge = new Tween(begin: 50.0, end: 150.0).animate(enlargeAnimationController)
      ..addListener((){
        print("EnlargeValue: " + enlargeAnimationController.value.toString());
        print("value: " + animationEnlarge.value.toString());

        setState(() {});
      })
      ..addStatusListener((status){
        // status先开始AnimationStatus.forward, 然后AnimationStatus.completed
        print("EnlargeStatus: " + status.toString());
        if(status == AnimationStatus.completed){ //一般动画结束值为 1.0 的时候调用，对应 forward 操作
          narrowAnimationController.forward();
        }
      });

    animationNarrow = new Tween(begin: 150.0, end: 10.0).animate(narrowAnimationController)
      ..addListener((){
        setState(() {});
      });
    enlargeAnimationController.forward();

  }

  @override
  void dispose() {
    // 释放资源
    enlargeAnimationController.dispose();
    narrowAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimationEnlarge"),
        ),

        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              // 放大动画
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset('assets/images/fei_ji.png',
                  width: animationEnlarge.value,
                  height: animationEnlarge.value,
                ),
              ),

              // 缩小动画
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset('assets/images/fei_ji.png',
                  width: animationNarrow.value,
                  height: animationNarrow.value,
                ),
              ),
            ],
          ),
        )
    );
  }

}