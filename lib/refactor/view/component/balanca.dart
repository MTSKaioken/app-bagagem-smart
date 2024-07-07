import 'dart:math';

import 'package:bagagem_smart/refactor/view/component/barra_de_progresso.dart';
import 'package:flutter/material.dart';

class Balanca extends StatefulWidget {
  @override
  _Balanca createState() => _Balanca();
}

class _Balanca extends State<Balanca> with SingleTickerProviderStateMixin {
  late AnimationController progressController;

  late Animation<double> animation;

  late double finalAnimacao = 75;

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3800));
    animation =
        Tween<double>(begin: 0, end: finalAnimacao).animate(progressController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.2,
      child: Column(
        children: [
          Positioned(
              child: Container(
                width: 85,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'KG',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
          ),
          Positioned(
            child: Center(
              child: Container(
                width: 10,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          CustomPaint(
            foregroundPainter:
                BarraDeProgresso(progressoAtual: animation.value),
            child: Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              child: GestureDetector(
                onTap: () {
                  if (animation.value == finalAnimacao) {
                    progressController.value = 0;

                    setState(() {
                      finalAnimacao = Random().nextInt(100).toDouble();
                      print(finalAnimacao);

                      animation = Tween<double>(begin: 0, end: finalAnimacao)
                          .animate(progressController)
                        ..addListener(() {
                          setState(() {});
                        });
                    });

                    progressController.forward();
                  } else {
                    progressController.forward();
                  }
                },
                child: Center(
                    child: Text(
                  '${animation.value.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Rowdies',
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
