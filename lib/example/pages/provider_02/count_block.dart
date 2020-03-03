
import 'dart:async';

class CountBlock {
  /// 1.1 定义一个Controller
  final StreamController<int> countController = StreamController();
  /// 1.2 获取 StreamSink 做 add 入口
  StreamSink<int> get countSink => countController.sink;
  /// 1.3 获取 Stream 用于监听
  Stream<int> get countStream => countController.stream;


  int count = 0;

  add() {
    countSink.add(++count);
  }

  dispose() {
    countController.close();
  }

}