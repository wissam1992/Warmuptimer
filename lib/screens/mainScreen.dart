import 'package:flutter/material.dart';
import 'package:warmuptimer/screens/readDevice.dart';

import '../widgets/custom_button.dart';
import 'generateDevice.dart';


class MainScreen extends StatelessWidget {
  static const  route='/mainscreen';
  final String title;
  const MainScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

          /*  CustomButton(text: 'create QR code', onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>GenerateDevice()));
            }, ),

            const SizedBox(height: 10),*/

            CustomButton(text: 'Scan Qr Code', onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ReadDevice()));
            }, ),

          ],
        ),
      ),
    );
  }
}

