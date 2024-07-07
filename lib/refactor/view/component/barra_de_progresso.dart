import 'dart:math';

import 'package:flutter/material.dart';

class BarraDeProgresso extends CustomPainter {

  double progressoAtual;


  BarraDeProgresso({required this.progressoAtual});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circuloInterno = Paint()
        ..strokeWidth = 25
        ..color = Colors.black26
        ..style = PaintingStyle.stroke;

    Paint arco = Paint()
      ..strokeWidth = 25
      ..style = PaintingStyle.stroke
      ..color = Colors.black45
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2, size.height/2) - 7;

    canvas.drawCircle(center, radius, circuloInterno);

    double angle = 2 * pi * (progressoAtual/100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi/2, angle, false, arco);


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