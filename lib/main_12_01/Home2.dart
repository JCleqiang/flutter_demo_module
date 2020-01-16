import 'package:flutter/material.dart';

class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("333"),
      ),
      body: Center(
        child:  Container(
          height: 400,
          width: 300,
          color: Colors.red,
          child: Stack(
            // alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                //  left: 10,
                child: Icon(Icons.home,size: 40,color: Colors.white),
              ),
              Positioned(
                bottom: 0,
                left: 100,
                child: Icon(Icons.search,size: 30,color: Colors.white),
              ),
              Positioned(
                right: 0,
                child: Icon(Icons.settings_applications,size: 30,color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}