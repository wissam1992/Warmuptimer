import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:warmuptimer/Model/deviceD.dart';

import '../Model/Device.dart';

class GetData {
  Future<Device> getDeviceinfo(String device_info) async {
    try {
      print('in getd');
      final url =
          Uri.parse('http://10.46.221.77:8000/server/deviceinfo/$device_info');
      //final url=Uri.parse('http://10.16.96.1:8000/server/device/SYR23DE001');

      //final url = Uri.parse('http://192.168.0.89:3000/server/deviceinfo/SYR23DE001');
      //final url = Uri.parse('http://localhost:3000/server/deviceinfo/SYR23DE001');
      // http://localhost:3000/server/device/SYR23DE002

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data['DEVICEID'].runtimeType);
        print(data['WARMUPTIMESTAMP']);
        final device1 = Device(
            data['DEVICEID'],
            //DateTime.now(),
            DateTime.parse(data['WARMUPTIMESTAMP']),
            //  data[0]["WARMUPTIMESTAMP"],
            data['ALREADYUSEDFLAG']);
        /*  final device1 = Device(
          data["DEVICE_ID"],
          DateTime.now(),
          data["ALREADYUSEDFLAG"],
        );
        */

        return device1;
      } else {
        // Request failed, handle the error
        print('Request failed with status: ${response.statusCode}.');
        return new Device('', DateTime.now(), 0);
      }
    } catch (e) {
      print('error');
      print(e);
      return new Device('', DateTime.now(), 0);
    }
  }

  Future<DeviceD> getallDeviceinfo(String device_info) async {
    try {
      final url =
          Uri.parse('http://10.46.221.77:8000/server/alldeviceinfo/$device_info');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //print(data['DEVICEID'].runtimeType);
       // print(data['WARMUPTIMESTAMP']);
        final device1 = DeviceD(
            data['DEVICEID'],
            DateTime.parse(data['WARMUPTIMESTAMP']),
            data['GRACEPERIOD'],
            data['WARMUPTIME'],
            data['MESSAGE_EN'],
            data['MESSAGE_DE']);
        return device1;
      } else {

        print('Request failed with status: ${response.statusCode}.');
        return new DeviceD('', DateTime.now(), 0,0,'','');
      }
    } catch (e) {
      print('error$e');

      return new DeviceD('', DateTime.now(), 0,0,'','');
    }
  }

  Future<String> getDataFromServer() async {
    //final url = Uri.parse('https://dart.dev/f/packages/http.json');
    try {
      /*
      String jsonStr = '[{"DEVICE_ID": "SYR23DE002","WARMUPTIMESTAMP": "2023-03-03T14:02:25.662Z","ALREADYUSEDFLAG": 1}]';

      List<Map<String, dynamic>> jsonList = json.decode(jsonStr);

      List<Device> devices = jsonList.map((json) => Device.fromJson(json)).toList();

      Device firstDevice = devices.first;
      print('device_id$firstDevice.deviceId'); // Output: SYR23DE002

       */
      print('in try');
      final url = Uri.parse('http://10.46.102.70:3000/server/devices');
      // http://localhost:3000/server/device/SYR23DE002

      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Request successful, parse the response body
        final data = jsonDecode(response.body);

        //print('Received data: $data');

        List<dynamic> jsonList = data;
        List<Device> devices = [];
        for (var jsonDevice in jsonList) {
          Device device = Device.fromJson(jsonDevice);
          devices.add(device);
        }
        print(devices);

        return data;
      } else {
        // Request failed, handle the error
        print('Request failed with status: ${response.statusCode}.');
        return '';
      }
    } catch (e) {
      print('eror');
      print(e);
      return '';
    }
  }

  Future<String> gettime(String device_id) async {
    try {
      final url = Uri.parse('http://10.46.221.31:8000/server/timer/$device_id');
      // http://localhost:3000/server/device/SYR23DE002

      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Request successful, parse the response body
        final data = jsonDecode(response.body);
        final value = data[0]['WARMUPTIME'];
        print('Received data: $value');
        return value.toString();
      } else {
        // Request failed, handle the error
        print('Request failed with status: ${response.statusCode}.');
        return '';
      }
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> getstring() async {
    try {
      print('in getstring');
      final url = Uri.parse('http://10.46.126.13:3000/server/teststring');
      // http://localhost:3000/server/device/SYR23DE002

      final response = await http.get(url);
      print('in getstring A');
      if (response.statusCode == 200) {
        // Request successful, parse the response body
        final data = jsonDecode(response.body);
        return data.toString();
      } else {
        // Request failed, handle the error
        print('Request failed with status: ${response.statusCode}.');
        return '';
      }
    } catch (e) {
      print(e);
      return '';
    }
  }
/*
  Future<String> getDataFromServer() async {
    // Create a client instance
    final client = http.Client();
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    // Send a GET request to the server
    final response = await client.get( Uri.parse('http://localhost:3000/server'),headers:headers, );

    // Handle the server response
    if (response.statusCode == 200) {
      // Parse the response data
      final responseData = response.body;

      // Close the client
      client.close();

      // Return the response data
      return responseData;
    } else {
      // Handle the error
      throw Exception('Failed to load data from server');
    }
  }*/
/*
    try{
      print('inv fetch');
      // final response = await http.get(Uri.parse('http://192.168.0.1:3000'),headers: {
      final response = await http.get(Uri.parse('http://localhost:3000/server/devices'),headers: {

        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials":
        'true', // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      });


      if (response.statusCode == 200) {
        print('response:');
        print(response);
        print('Response');


        return response.body;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch(e){
      print(e);
      return 'failed to fetch data';
    }
*/

/*
  Future<String> getData() async {


    print('getData');
    var response;
    try {
      //var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      var uri = Uri.parse('https://localhost:3000');
       response = await http.get(uri,headers: {
         "Access-Control-Allow-Origin": "*", // Required for CORS support to work
         "Access-Control-Allow-Credentials":
         'true', // Required for cookies, authorization headers with HTTPS
         "Access-Control-Allow-Headers":
         "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
         "Access-Control-Allow-Methods": "POST, OPTIONS"
       });
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        _responseData = data.toString();
        return _responseData;
      }
      return _responseData;
    }
    catch(e){
      print(e);
      print('catch error:');
      _responseData = 'Error: ${response.statusCode}';
      return _responseData;
    }


    }
*/

/*
  GetData();

Future<void> getdata() async {
  try{
          print('connecting to database');

      final connection = await DatabaseConfig.createConnection();

 final results = await connection.query('SELECT * FROM device');
 print(results);

  await connection.close();

  }
  catch(e){
    print('in exception');
    print(e);
  }

}
*/
}
