
import 'dart:convert';
import '../Model/Device.dart';





class Testserver{
  printjson(){



    String jsonResponse = '[{"DEVICE_ID": "SYR23DE002","WARMUPTIMESTAMP": "2023-03-03T14:02:25.662Z","ALREADYUSEDFLAG": 1}]';
    List<dynamic> jsonList = json.decode(jsonResponse);
    List<Device> devices = [];
    for (var jsonDevice in jsonList) {
      Device device = Device.fromJson(jsonDevice);
      devices.add(device);
    }
    print(devices);
/*
    String jsonStr = '[{"DEVICE_ID": "SYR23DE002","WARMUPTIMESTAMP": "2023-03-03T14:02:25.662Z","ALREADYUSEDFLAG": 1}]';

    List<Map<String, dynamic>> jsonList = json.decode(jsonStr);

    List<Device> devices = jsonList.map((json) => Device.fromJson(json)).toList();

    Device firstDevice = devices.first;
    print('device_id$firstDevice.deviceId'); // Output: SYR23DE002
*/
  }
/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warmuptimer/Utils/timer_builder_utils.dart';
import 'package:warmuptimer/Utils/irregularclipper.dart';
import 'package:warmuptimer/constants/global_variable.dart';
class DeviceInfoView extends StatefulWidget {
  static const route = '/deviceinfo';

  const DeviceInfoView({Key? key}) : super(key: key);

  @override
  _DeviceInfoViewState createState() => _DeviceInfoViewState();
}

class _DeviceInfoViewState extends State<DeviceInfoView> {
  int _timerValue = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('AbbVie WarmUp Timer'),
        ),
        body: ClipPath(
          clipper: IrregularClipper(),
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TimerBuilder(
                  duration: Duration(seconds: _timerValue),
                  builder: (context, Duration remaining) {
                    return Text(
                      'Timer: ${remaining.inSeconds} seconds remaining',
                      style: TextStyle(fontSize: 24),
                    );
                  },
                  onEnd: () {
                    // Do something when the timer ends
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Timer Ended'),
                          content: Text('The timer has ended.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          'Device: ${DeviceInfo.deviceName}',
                          style: TextStyle(
                              color: Colors.blue, fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          'Battery: ${DeviceInfo.batteryLevel}%',
                          style: TextStyle(
                              color: Colors.blue, fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          'WiFi: ${DeviceInfo.wifiName}',
                          style: TextStyle(
                              color: Colors.blue, fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class DeviceInfo {
  static String get deviceName =>
      'My Device Name'; // Replace with actual device name

  static int get batteryLevel =>
      75; // Replace with actual battery level

  static String get wifiName =>
      'My WiFi Name'; // Replace with actual WiFi name
}
 */

}