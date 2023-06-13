import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../Model/Device.dart';
class SetData{
  Future<String> setdevice(String device_id)async{
    DateTime currentDateTime = DateTime.now();

    try {
      DateTime currentDateTime = DateTime.now();

      String formattedDateTime = DateFormat('dd.MM.yy HH:mm:ss,SSSSSSSSS').format(currentDateTime);


      final url = Uri.parse('http://10.46.221.77:8000/server/updatedevice/$device_id/$formattedDateTime');

      //05.05.23 15:32:46,123456789
      // http://localhost:3000/server/device/SYR23DE002

      final response = await http.get(url);

      if (response.statusCode == 200) {
        print('Device updated successfully');
        // Request successful, parse the response body
        final data = jsonDecode(response.body);
      //  final value = data[0]['WARMUPTIME'];
       // print('Received data: $value');
        return data.toString();
      } else {
        // Request failed, handle the error
        print('Request failed with status: ${response.statusCode}.');
        return '';
      }
    }

    catch(e){
      print(e);
      return'';
    }
  }

}