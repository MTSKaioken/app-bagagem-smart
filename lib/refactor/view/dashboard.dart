import 'package:flutter/material.dart';

import '../model/usuario.dart';
import 'component/balanca.dart';
import 'component/navbar_lateral.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Usuario usuario =
        ModalRoute.of(context)!.settings.arguments as Usuario;

    return MaterialApp(
        title: 'Bagagem Smart',
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: NavbarLateral(parentContext: context, usuarioLogado: usuario),
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
                Icon(Icons.no_luggage_rounded),
                Text('Dispositivo Conectado'),
                // trocar por banner
                Container(
                  child: Image.network(''),
                  height: 125,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    Text('São Paulo, Brazil'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sua Bagagem',
                       style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Balanca(),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
