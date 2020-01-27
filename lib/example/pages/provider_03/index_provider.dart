import 'package:flutter/widgets.dart';

/* 
 * @description: tab页面page索引模型
 * @author leqiang222
 * @create 2020/1/26 
 */

class IndexProvider with ChangeNotifier {
  int _index = 0;
  PageController pageController;

  int get index => _index;

  set index(int value) {
    _index = value;
    pageController.jumpToPage(this._index);
    notifyListeners();
  }

  IndexProvider() {
    pageController = PageController(initialPage: _index);
  }

  //使用ChangeNotifierProvider会在销毁时调用dispose()方法释放资源
  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }
}