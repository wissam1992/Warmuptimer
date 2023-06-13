

import 'package:flutter/material.dart';
import 'package:warmuptimer/pages/home.dart';
import 'package:warmuptimer/pages/loading.dart';
import 'package:warmuptimer/pages/timer.dart';
import 'package:warmuptimer/screens/deviceInfo.dart';
import 'package:warmuptimer/screens/mainScreen.dart';
import 'package:warmuptimer/widgets/router.dart';


/*
void main()=> runApp(MaterialApp(
  home: MyApp()
));



class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Scanner App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomButton(text: 'create QR code', onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>GenerateDevice()));
            }, ),
            const SizedBox(height: 10),

            CustomButton(text: 'Read QR code', onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ReadDevice()));
            }, ),

          ],
        ),
      ),
    );
  }
}

*/
/*
void main() => runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) => Loading());
        case MainScreen.route:
          return MaterialPageRoute(builder: (context) => MainScreen(title: 'Scanner App'));
        case DeviceInfoView.route:
          return MaterialPageRoute(builder: (context) => DeviceInfoView(warmuptime: '',));
        default:
          return null;
      }
    }
));
*/
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



/*

Future<void> main() async {
 try{
      print('object1');

  final connection = await DatabaseConfig.createConnection();
      print('object');
 final results = await connection.query('SELECT * FROM device');
 print(results);

  await connection.close();

  }
  catch(e){
    print(e);
  }
 

}
*/
/*
void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      //'/location': (context) => ChooseLocation(),
    }
));
*/


