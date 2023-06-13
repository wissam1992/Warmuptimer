import 'package:flutter/material.dart';
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.0441000,size.height*0.1471429);
    path0.lineTo(size.width*0.5017333,size.height*0.2262143);
    path0.lineTo(size.width*0.9765417,size.height*0.1452429);
    path0.lineTo(size.width*0.9823500,size.height*0.8609571);
    path0.lineTo(size.width*0.0435667,size.height*0.8623857);
    path0.lineTo(size.width*0.0441000,size.height*0.1471429);
    path0.close();
/*    Path path0 = Path();
    path0.moveTo(size.width*0.0443879,size.height*0.1789954);
    path0.quadraticBezierTo(size.width*0.0454310,size.height*0.7175578,size.width*0.0458362,size.height*0.8688742);
    path0.quadraticBezierTo(size.width*0.0998103,size.height*0.8683372,size.width*0.9483017,size.height*0.8648037);
    path0.lineTo(size.width*0.9460431,size.height*0.1735739);
    path0.lineTo(size.width*0.5184655,size.height*0.2582564);
    path0.lineTo(size.width*0.0443879,size.height*0.1789954);
    path0.close();
*/
    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}