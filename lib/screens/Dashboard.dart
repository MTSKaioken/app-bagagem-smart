import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bagagem Smart',
        home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Dashboard',
                textDirection: TextDirection.ltr,
              ),
            ),
            backgroundColor: Colors.black87,
          ),
          body: Center(
            child: Text(
              'Olá Mundo, tela Dashboard',
              textDirection: TextDirection.ltr,
            ),
          ),
        ));
  }
}
