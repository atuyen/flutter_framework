import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DemoPlatformChanel extends StatefulWidget {
  @override
  _DemoPlatformChanelState createState() => _DemoPlatformChanelState();
}

class _DemoPlatformChanelState extends State<DemoPlatformChanel> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  static const defaultPlatform = MethodChannel('com.code4func/method1');
  static const toastPlatform = MethodChannel('com.code4func/toast');
  static const platform2 = MethodChannel('com.code4func/method2', JSONMethodCodec());
  static const activityPlatform = MethodChannel('com.code4func/open_activity');





  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';
  String _deviceInfo1 = 'empty';
  String _deviceInfo2 = 'empty';







  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
            SizedBox(height: 20,),
            Text(_deviceInfo1),
            RaisedButton(
              onPressed: () {
                _standardMethodCodec("model");
              },
              child: Text('StandardMethodCodec'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(_deviceInfo2),
            RaisedButton(
              onPressed: () {
                _jSONMethodCodec("model");
              },
              child: Text('JSONMethodCodec'),
            ),

            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                _showToast();
              },
              child: Text('Show Toast'),
            ),

            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                _openActivity();
              },
              child: Text('Open activity'),
            ),
          ],
        ),
      ),
    );
  }

   _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  _standardMethodCodec(String model) async {
    try {
      String result =
      await defaultPlatform.invokeMethod('getDeviceInfoString', {
        "type": "MODEL",
      });

      if (result != null) {
        _deviceInfo1 = result;
      } else {
        _deviceInfo1 = 'can not get device info';
      }
    } on PlatformException catch (e) {
      _deviceInfo1 = e.message;
    }

    setState(() {});
  }

  _jSONMethodCodec(String model) async {
    try {
      var result = await platform2.invokeMethod('getDeviceInfo', {
        "type": "MODEL",
      });

      if (result != null) {
        _deviceInfo2 = result['result'];
      } else {
        _deviceInfo2 = 'can not get device info';
      }
    } on PlatformException catch (e) {
      _deviceInfo2 = e.message;
    }

    setState(() {});
  }

  _showToast(){
    toastPlatform.invokeMethod('showToast');
  }
  _openActivity(){
    activityPlatform.invokeMethod('openActivity');
  }

}
