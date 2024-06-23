import 'package:bagagem_smart/components/ProfileImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../model/usuario.dart';
import 'component/navbar_lateral.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Usuario usuario = ModalRoute.of(context)!.settings.arguments as Usuario;

    return ResponsiveApp(builder: (context) {
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
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  Icon(Icons.no_luggage_rounded),
                  Text('Dispositivo Conectado'),
                  // div com img
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
    });
  }
}
