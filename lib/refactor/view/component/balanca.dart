import 'dart:math';

import 'package:bagagem_smart/refactor/util/util.dart';
import 'package:bagagem_smart/refactor/view/component/barra_de_progresso.dart';
import 'package:flutter/material.dart';

import '../../controller/usuario_controller.dart';

class Balanca extends StatefulWidget {

  final String idUsuario;

  Balanca({super.key, required this.idUsuario});



  @override
  _Balanca createState() => _Balanca();
}

class _Balanca extends State<Balanca> with SingleTickerProviderStateMixin {

  UsuarioController usuarioController = UsuarioController();

  late AnimationController progressController;

  late Animation<double> animation;

  late double finalAnimacao = 0;

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
      heightFactor: 1.1,
      child: Column(
        children: [
          Container(
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
          Center(
            child: Container(
              width: 10,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black,
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
                onTap: () async {
                  if (animation.value == finalAnimacao) {
                    progressController.value = 0;

                    double peso = await usuarioController.lerPesoAssociadoAoUsuario(widget.idUsuario);
                    if(peso > 0.0) {
                      setState(() {
                        finalAnimacao = peso;

                        animation = Tween<double>(begin: 0, end: finalAnimacao)
                            .animate(progressController)
                          ..addListener(() {
                            setState(() {});
                          });
                      });
                      progressController.forward();
                    } else {
                      Util.notify(context, "Notificação", "Nenhuma leitura encontrada!");
                    }
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
