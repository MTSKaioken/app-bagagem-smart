import 'package:flutter/material.dart';

class UnidadeMedida extends CustomPainter {

  String unidadeMedida;


  UnidadeMedida({required this.unidadeMedida});

  @override
  void paint(Canvas canvas, Size size) {
    Paint plaquinha = Paint()
      ..strokeWidth = 40
      ..style = PaintingStyle.fill
      ..color = Colors.black
      ..strokeCap = StrokeCap.square;
    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(size.width, -size.height/4), width: size.width / 2, height: size.height / 3),
      Radius.circular(15),
    );
    canvas.drawRRect(fullRect, plaquinha);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}