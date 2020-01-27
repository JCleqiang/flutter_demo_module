

import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int _count;
  Counter(this._count);

  void add() {
    ++_count;

    // 这个方法是通知用到Counter对象的widget刷新用的。
    notifyListeners();
  }

  get count {
    return _count;
  }
}