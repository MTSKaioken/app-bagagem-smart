import 'package:flutter/material.dart';

import 'NavbarLateral.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bagagem Smart',
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: NavbarLateral(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.black, // Defina a cor desejada aqui
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 24),
                ),
                Icon(Icons.no_luggage_rounded),
                Text('Dispositivo Conectado'),
                // div com img
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Text('São Paulo, Brazil'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
