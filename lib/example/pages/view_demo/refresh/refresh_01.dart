import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RefreshDemoPageState();
  }
}

class _RefreshDemoPageState extends State<RefreshDemoPage> {
  final int pageSize = 10;
  final ScrollController _scrollController = new ScrollController();
  final GlobalKey<RefreshIndicatorState> refreshKey = new GlobalKey();
  bool disposed = false;
  List<String> dataList = List();

  @override
  void initState() {
    super.initState();

    // 列表监听, 列表到最底部加载更多数据
    _scrollController.addListener(() {
      var isScrollBottom = _scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent;
      if (isScrollBottom) {
        loadMore();
      }
    });

    Future.delayed(Duration(seconds: 0), () {
      refreshKey.currentState.show();
    });
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    dataList.clear();

    for (int i = 0; i < pageSize; i++) {
      dataList.add("refresh");
    }

    if (disposed) {
      return;
    }

    setState(() {});
  }

  Future<void> loadMore() async {
    await Future.delayed(Duration(seconds: 2));
    for (int i = 0; i < pageSize; i++) {
      dataList.add("loadmore");
    }

    if (disposed) {
      return;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("刷新01"),
      ),
      body: Container(
        child: RefreshIndicator(
          ///GlobalKey，用户外部获取RefreshIndicator的State，做显示刷新
          key: refreshKey,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index == dataList.length) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Align(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return Card(
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: Text("Item ${dataList[index]} $index"),
                ),
              );
            },
            itemCount: (dataList.length >= pageSize)
                ? dataList.length + 1
                : dataList.length,
          ),
        ),
      ),
    );
  }
}
