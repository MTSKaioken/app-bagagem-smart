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
            Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(
                color: Colors.black45,
                backgroundColor: Colors.black54,
                strokeAlign: 3.0,
                strokeWidth: 15,
                value: 0.50,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}
