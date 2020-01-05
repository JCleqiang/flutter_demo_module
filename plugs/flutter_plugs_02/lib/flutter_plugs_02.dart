import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPlugs02 {
  /*
   * （1）MethodChannel：Flutter App调用Native APIs
   */
  static const MethodChannel _channel = const MethodChannel('leqiang222.io/battery');

  /**
   * 获取app版本号
   */
  static Future<String> get getPlatformVersion  async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /**
   * 获取手机电量
   */
  static Future<String> get getBatteryLevel async {
    String batteryLevel;
    try {
      final int result = await _channel.invokeMethod('getBatteryLevel',{'paramName':'paramVale'});
      batteryLevel = 'Battery level: $result%.';
    } catch(e) {
      batteryLevel = 'Failed to get battery level.';
    }

    return Future.value(batteryLevel);
  }

  /**
   * 关闭Flutter控制器
   * 返回1表示关闭成功，其它表示关闭失败
   */
  static Future<int> get dismissFlutterVC async {
    int result;
    try {
      result = await _channel.invokeMethod('dismissFlutterVC',{'paramName':'paramVale'});
    } catch(e) {
      result = 0;
    }

    return Future.value(result);
  }


  /*
   * （2）EventChannel：Native调用Flutter App
   */
  static const EventChannel _eventChannel = const EventChannel('leqiang222.io/charging');

  void listenNativeEvent() {
    _eventChannel.receiveBroadcastStream().listen(_onEvent, onError:_onError);
  }

  void _onEvent(Object event) {
    print("Battery status: ${event == 'charging' ? '' : 'dis'}charging.");
  }

  void _onError(Object error) {
    print('Battery status: unknown.');
  }
}
