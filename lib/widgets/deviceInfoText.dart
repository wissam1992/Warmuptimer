import 'package:flutter/material.dart';

class DeviceInfoText extends StatelessWidget {
  final String label;
  final String value;

  DeviceInfoText({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 8),
        Text(
          '$label: $value',
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
      ],
    );
  }
}
