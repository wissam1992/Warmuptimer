import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:warmuptimer/screens/mainScreen.dart';


class Loading extends StatefulWidget {


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void goHome(){
    //Navigator.pushNamed(context, MainScreen.route);
    Navigator.pushReplacementNamed(context, MainScreen.route);

  }
    @override
  void initState() {
    super.initState();
Future.delayed(Duration(seconds: 3)).then((value) {
goHome();}); 

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        )
      )
    );  }
}