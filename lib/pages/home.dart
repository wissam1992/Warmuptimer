import 'package:flutter/material.dart';
import 'package:warmuptimer/View/GetData.dart';

class Home extends StatefulWidget {
  static const  route='/';
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int response=0;
  Future<void> _incrementCounter(int _counter) async {
    for(int i=_counter;i>=0;i--) {
      setState(() {
        response=_counter--;
      });
      await Future.delayed(Duration(seconds: 1));
    }
  }

    
GetData data=GetData();
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      /*
      theme:ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          appBarTheme:const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              )
          )
      ),

       */
      appBar: AppBar(
        title: Text('Scannerd'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('$response',style:TextStyle(color: Colors.blue) ,),

                FloatingActionButton(onPressed:() async{

                  String str=await data.getstring();
                  print('Home:$str');
                 /* Device device=await data.getDeviceinfo();
                  print(device);*/
                 // final  responseData = await data.gettime();
                     //   _incrementCounter(int.parse(responseData));

                })
          ],
        ),
      ),
    );
  }


}