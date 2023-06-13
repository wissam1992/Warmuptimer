

import 'package:flutter/material.dart';
import 'package:warmuptimer/pages/home.dart';
import 'package:warmuptimer/pages/loading.dart';
import 'package:warmuptimer/pages/timer.dart';
import 'package:warmuptimer/screens/deviceInfo.dart';
import 'package:warmuptimer/screens/mainScreen.dart';
import 'package:warmuptimer/widgets/router.dart';


void main() => runApp( MaterialApp(

initialRoute: '/',
    onGenerateRoute: (settings) => generateRoute(settings),
    routes: {
      //Home.route:(context)=>Home(),
      '/': (context) => Loading(),
    //   '/': (context) => Home(),
        // '/': (context) => Home(),
     // WarmUpTimer.route:(context)=>WarmUpTimer(),
      MainScreen.route:(context)=>MainScreen(title: 'Scanner App',),
     // DeviceInfoView.routename:(context)=>DeviceInfoView(),
    //  '/': (context) => ReadDevice(),
      //'/location': (context) => ChooseLocation(),
    }
));






