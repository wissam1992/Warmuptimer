import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:warmuptimer/View/GetData.dart';
import 'package:warmuptimer/constants/global_variable.dart';
import 'package:warmuptimer/constants/global_variable.dart';
import '../Model/Device.dart';
import '../Model/deviceD.dart';
import '../View/SetData.dart';
import 'deviceInfo.dart';
class ReadDevice extends StatefulWidget {
  const ReadDevice({Key? key}) : super(key: key);

  @override
  State<ReadDevice> createState() => _ReadDeviceState();
}

class _ReadDeviceState extends State<ReadDevice> {

  var txt='Could you please scan your injection?';
  var height,width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return  Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,


      appBar: AppBar(
        title: Text('Scan your Device'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(txt,style: TextStyle(color:GlobalVariables.secondaryColor,fontSize: 25),),
            ElevatedButton(onPressed: scanQr, child:
            Text('Scan now',style: TextStyle(color: Colors.amber,fontSize: 30),
               )), SizedBox(height: width,)

          ],

        ),
      ),

    );
  }
  GetData data=GetData();
  SetData setdata=SetData();
  Future <void>scanQr()async{
    try{

 /*  await FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        setState(() {
          txt=value;
        });
      });*/


      DeviceD device1=await data.getallDeviceinfo('SYR23DE001');


     // if(true){

        try{
         // String warmuptime=await data.gettime('SYR23DE001');
          Navigator.pushNamed(context,DeviceInfoView.routename, arguments: device1);
          await setdata.setdevice(device1.deviceId);

          //Navigator.pushNamed(context, AuthScreen.routename,arguments: device1);
        }
            catch(e){
          print('Error:$e');
            }
     // Navigator.push(context,MaterialPageRoute(builder: (context)  =>WarmUpTimer(device_id: 'SYR23DE001',warmuptime: warmuptime)));
    }catch(e){
      setState(() {
        txt='unable to read this';
      });
    }
  }


}
