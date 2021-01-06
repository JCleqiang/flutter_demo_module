import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/pages/view_demo/banner/story.dart';

typedef void OnTapBannerItem(StoryModel story);

class HomeBanner extends StatefulWidget {
  final List<StoryModel> bannerStories;
  final OnTapBannerItem onTap;

  HomeBanner(this.bannerStories, this.onTap, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BannerState();
  }
}

class _BannerState extends State<HomeBanner> {
  PageController controller;

  List<Widget> pageChildren() {
    return widget.bannerStories.map((value) {
      return Container(
        child: Image.network(
          value.image,
          fit: BoxFit.cover,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 226.0,
      child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
        PageView(
          controller: controller,
          children: pageChildren(),
        )
      ]),
    );
  }
}
