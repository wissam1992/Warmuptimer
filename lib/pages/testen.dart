
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warmuptimer/Utils/timer_builder_utils.dart';
import 'package:warmuptimer/Utils/irregularclipper.dart';
import 'package:warmuptimer/constants/global_variable.dart';
import 'package:warmuptimer/constants/deviceInfo_variable.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../Model/deviceD.dart';
import '../screens/deviceInfo.dart';class _DeviceInfoViewState extends State<DeviceInfoView> {
  bool isFirstTimerDone = false;

  @override
  Widget build(BuildContext context) {
    final DeviceD device = ModalRoute.of(context)?.settings.arguments as DeviceD;
    DateTime dt = DateTime.parse(device.warmUpTimestamp.toString());

    String _twoDigits(int n) {
      return n.toString().padLeft(2, '0');
    }

    String formattedDateTime = '${dt.year}-${_twoDigits(dt.month)}-${_twoDigits(dt.day)} '
        '${_twoDigits(dt.hour)}:${_twoDigits(dt.minute)}:${_twoDigits(dt.second)}';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('AbbVie WarmUp Timer'),
        ),
        body: Container(
          width: 400,
          height: 750,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimerBuilder(
                duration: Duration(seconds: device.warmuptime),
                builder: (context, Duration remaining) {
                  return Text(
                    'Timer: ${remaining.inMinutes.toString().padLeft(2, '0')}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')} seconds remaining',
                    style: TextStyle(fontSize: 22),
                  );
                },
                onEnd: () {
                  // Play alarm sound
                  FlutterRingtonePlayer.play(
                    android: AndroidSounds.alarm,
                    ios: IosSounds.glass,
                    looping: true,
                    volume: 0.5,
                  );

                  // Show dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Timer Ended'),
                        content: Text(device.message_en),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();

                              // Stop alarm sound
                              FlutterRingtonePlayer.stop();

                              // Start second timer
                              setState(() {
                                isFirstTimerDone = true;
                              });
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Visibility(
                visible: isFirstTimerDone,
                child: TimerBuilder(
                  duration: Duration(seconds: 18),
                  builder: (context, Duration remaining) {
                    return Text(
                      'Timer: ${remaining.inMinutes.toString().padLeft(2, '0')}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')} seconds remaining',
                      style: TextStyle(fontSize: 22),
                    );
                  },
                  onEnd: () {
                    print('Take your injection');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
