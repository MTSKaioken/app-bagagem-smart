import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Balanca extends StatefulWidget {
  @override
  _Balanca createState() => _Balanca();
}

class _Balanca extends State<Balanca> {
  @override
  Widget build(BuildContext context) {
    return Center(
        heightFactor: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // todo avaliar Widget de layout: Stack https://docs.flutter.dev/ui/layout#examples-stack
            Center(
              child: Stack(
                alignment: Alignment(0.6, 0.6),
                children: [
                  Text('teste', style: TextStyle(color: Colors.white, fontSize: 30), ),

                  Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black45,
                    ),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(48),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Text('10',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
