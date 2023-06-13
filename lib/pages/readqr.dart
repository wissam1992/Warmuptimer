/*
import 'package:flutter/material.dart';
class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var qrstr = "let's Scan it";
  var height,width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanning QR code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(qrstr,style: TextStyle(color: Colors.blue,fontSize: 30),),
            
            ElevatedButton(onPressed: scanBarcode, child:
            Text(('Scanner'))),
            //SizedBox(height: width,)
          ],
        ),
      )
    );
  }

Future<void> scanBarcode() async {

  try {
  String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
    "#ff6666", // color of the status bar
    "Cancel", // text for the cancel button
    true, // enable flash
    ScanMode.QR, // QR code scanning mode
  );
     setState(() {
          qrstr=barcodeScanRes;
        });
} on Exception catch (e) {
    setState(() {
        qrstr='unable to read this';
      });
}

  // handle the scanned barcode/QR code data
}
}

 */