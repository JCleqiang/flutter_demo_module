
import 'dart:async';

class CountBlock {
  final StreamController<int> _countController = StreamController();
  int count = 0;
  Stream<int> stream;

  CountBlock(){
    stream = _countController.stream.asBroadcastStream();
  }

  add() {
    _countController.sink.add(++count);
  }

  dispose() {
    _countController.close();
  }

}