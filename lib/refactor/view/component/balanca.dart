import 'package:bagagem_smart/refactor/view/component/barra_de_progresso.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Balanca extends StatefulWidget {

  @override
  _Balanca createState() => _Balanca();
}

class _Balanca extends State<Balanca> with SingleTickerProviderStateMixin{

  late AnimationController progressController;

  late Animation<double> animation;

  @override
  void initState(){
    super.initState();
    progressController = AnimationController(vsync: this, duration: Duration(milliseconds: 8000));
    animation = Tween<double>(begin: 0, end: 80).animate(progressController)..addListener(() {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        foregroundPainter: BarraDeProgresso(progressoAtual: animation.value),
        child: Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black
          ),
          child: GestureDetector(
            onTap: (){
              if(animation.value == 80){
                progressController.reverse();
              } else {
                progressController.forward();
              }
            },
            child: Center(child: Text('${animation.value.toStringAsFixed(2)}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                ),
            )),
          ),
        ),
      ),
    );
  }
}
