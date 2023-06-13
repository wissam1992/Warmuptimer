import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warmuptimer/Utils/timer_builder_utils.dart';
import 'package:warmuptimer/Utils/irregularclipper.dart';
import 'package:warmuptimer/constants/global_variable.dart';
import 'package:warmuptimer/constants/deviceInfo_variable.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';



import '../Model/deviceD.dart';
import '../widgets/deviceInfoText.dart';
class DeviceInfoView extends StatefulWidget {
  static const routename = '/deviceinfo';
  //final String warmuptime;


  //const DeviceInfoView({Key? key,required this.warmuptime}) : super(key: key);

  @override
  _DeviceInfoViewState createState() => _DeviceInfoViewState();
}

class _DeviceInfoViewState extends State<DeviceInfoView> {
  bool isFirstTimerDone = false;

/*
  late int _timerValue;
  @override
  void initState() {
    super.initState();
    _timerValue = int.parse(widget.warmuptime);
  }
*/

  @override
  Widget build(BuildContext context) {

   //Object? warmuptimer=ModalRoute.of(context)?.settings.arguments;
   final DeviceD device = ModalRoute.of(context)?.settings.arguments as DeviceD;

    DateTime dt=DateTime.parse(device.warmUpTimestamp.toString());

    String _twoDigits(int n) {
      return n.toString().padLeft(2, '0');
    }

    String formattedDateTime = '${dt.year}-${_twoDigits(dt.month)}-${_twoDigits(dt.day)} '
        '${_twoDigits(dt.hour)}:${_twoDigits(dt.minute)}:${_twoDigits(dt.second)}';



    // int _timerValue = int.parse(warmuptimer.toString());

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary:  GlobalVariables.secondaryColor,
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
        body:CustomPaint(
          size: Size(350,(350*0.4977011318864494).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainter(),
          child: Container(
            width: 400,
            height: 750,
         /*   decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),*/
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    Text(
                       DeviceInfo.companyName,
                      style: TextStyle(
                          color: Colors.blue, fontSize: 50,),
                    ),
                  ],
                ),
                SizedBox(height: 40),
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

                /*   TimerBuilder(
                  duration: Duration(seconds: device.warmuptime),
                  builder: (context, Duration remaining) {
                    return Text(
                     // 'Timer: ${remaining.inSeconds} seconds remaining',
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
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
               *//*   onEnd: () {
                    // Do something when the timer ends
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
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },*//*
                ),*/
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                            child: DeviceInfoText(label: 'WARMUP TIME', value: device.warmuptime.toString())
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: DeviceInfoText(label: 'GEACE PERIOD:', value: device.graceperiod.toString())
                        ),
                      ],
                    ),

                    SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: DeviceInfoText(label: 'Timestamp', value: formattedDateTime)
                          ,
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
