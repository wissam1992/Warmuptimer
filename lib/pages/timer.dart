import 'dart:async';

import 'package:flutter/material.dart';
import 'package:warmuptimer/Model/Device.dart';
import 'package:warmuptimer/Model/Device.dart';
import 'package:warmuptimer/View/GetData.dart';


import '../View/GetData.dart';
class WarmUpTimer extends StatefulWidget {


  static const route='/warmuptimer';
  final String device_id;
  final int warmuptime;

  const WarmUpTimer({Key? key,required this.device_id, required this.warmuptime}) : super(key: key);

  @override
  State<WarmUpTimer> createState() => _WarmUpTimerState(device_id,warmuptime);
}
GetData data=GetData();
class _WarmUpTimerState extends State<WarmUpTimer> {

  int _counter =10;
  int warmuptime;
  bool _counting =true;
  String device_id;

  _WarmUpTimerState(this.device_id, this.warmuptime);
  GetData data=GetData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Timer for Device: $device_id'),
        
      ),
      body:Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Timer: $_counter',
            style:TextStyle(fontSize: 30,color: Colors.deepOrange),
        ), if (_counting)
          Countdown(warmuptime),

        ],) ,
      ),


    );
  }
  void startCountdown() {
    setState(() {
      _counting = false;
    });
  }

  void stopCountdown() {
    setState(() {
      _counting = false;
    });
  }

}



class Countdown extends StatefulWidget {
  final int counter;

  Countdown(this.counter);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
   late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.counter;
    _startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Countdown: $_counter',
      style: TextStyle(fontSize: 30, color: Colors.deepOrange),
    );
  }

  void _startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter--;
      });
      if (_counter == 0) {
        timer.cancel();
      }
    });
  }
}
