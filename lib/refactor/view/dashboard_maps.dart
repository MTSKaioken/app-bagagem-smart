import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../model/usuario.dart';
import 'component/navbar_lateral.dart';

class DashboardMaps extends StatelessWidget {
  const DashboardMaps({Key? key}) : super(key: key);

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
            child: Stack(
              children: [
                Icon(Icons.no_luggage_rounded),
                Text('Dispositivo Conectado'),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 0),
                ),
                FlutterMap(
                  options: MapOptions(
                    center: LatLng(-23.60044, -46.43707),
                    zoom: 17.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'org.example.app',
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    Text('São Paulo, Brazil'),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
