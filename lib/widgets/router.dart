import 'package:flutter/material.dart';
import 'package:warmuptimer/screens/auth_screen.dart';
import 'package:warmuptimer/screens/deviceInfo.dart';
Route<dynamic>generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routename:
      return MaterialPageRoute(settings:routeSettings,
          builder:(_)=>const AuthScreen()
      );
    case DeviceInfoView.routename:
      return MaterialPageRoute(settings:routeSettings,
    builder:(_)=>DeviceInfoView()
    );
    default:
      return MaterialPageRoute(settings:routeSettings,
          builder:(_)=>const Scaffold(
        body: Center(
          child: Text('Screen does not Exist'),
        ),
          ),
      );
  }
}