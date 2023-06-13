import 'package:flutter/material.dart';

import '../Model/deviceD.dart';

class AuthScreen extends StatefulWidget {
  static const String routename = 'auth-screen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final DeviceD myDevice = ModalRoute.of(context)?.settings.arguments as DeviceD;

    return Scaffold(
        appBar: AppBar(
          title: Text('Scan your Device'),
        ),
        body: Center(
          child: Column(
            children: [
          Text('DEVICEID:${myDevice.deviceId}'),
              SizedBox(height: 20,),
              Text('Warmuptime:${myDevice.warmuptime}'),
              SizedBox(height: 20,)
            ],
          )
        ,
        )
    );
  }
}
