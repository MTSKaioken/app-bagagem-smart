import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            OrientationLayoutBuilder(
              portrait: (context) => Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 150),
              ),
              landscape: (context) => Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 5),
              ),
            ),
            Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/1/1b/Square_200x200.png',
                width: 125),
            OrientationLayoutBuilder(
              portrait: (context) => Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 20),
              ),
              landscape: (context) => Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 0),
              ),
            ),
            Text('Malas Smart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.3,
                  color: Colors.black,
                )),
            OrientationLayoutBuilder(
              portrait: (context) => Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 150),
              ),
              landscape: (context) => Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 20),
              ),
            ),
            Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 29.5,
                color: Colors.black,
              ),
            ),
            OrientationLayoutBuilder(
              portrait: (context) => Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 20),
              ),
              landscape: (context) => Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 0),
              ),
            ),
            ElevatedButton(
              child: Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(345, 70),
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
              ),
            ),
            OrientationLayoutBuilder(
              portrait: (context) => Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 20),
              ),
              landscape: (context) => Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 5),
              ),
            ),
            ElevatedButton(
              child: Text(
                'Cadastre-se',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: Colors.black,
                  width: 3,
                ),
                // padding: EdgeInsets.all(20.0),
                fixedSize: Size(300, 70),
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                primary: Colors.white,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
