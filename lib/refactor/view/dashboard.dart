import 'package:bagagem_smart/refactor/controller/usuario_controller.dart';
import 'package:bagagem_smart/refactor/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

import '../model/usuario.dart';
import 'component/balanca.dart';
import 'component/navbar_lateral.dart';

class Dashboard extends StatelessWidget {
  UsuarioController usuarioController = UsuarioController();
  MapController mapController = MapController();

  LatLng latitudeLongitude = LatLng(0, 0);

  Dashboard({Key? key}) : super(key: key);

  Future<LatLng?> buscarUltimaLocalizacao(id) async {
    LatLng latLng = await usuarioController.lerCoordenadasAssociadoAoUsuario(id);
    return latLng;
  }

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
              color: Colors.black,
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Icon(Icons.no_luggage_rounded),
                Text('Dispositivo Conectado'),
                Container(
                  child: Image.asset(
                    'lib/refactor/assets/banner-bagagem.jpg',
                    fit: BoxFit.fitWidth,
                    width: double.maxFinite,
                    alignment: Alignment.topCenter,
                  ),
                  height: 115,
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
                    Text('R. Ribeirão dos Arcos, Jardim Roseli', style: TextStyle(fontSize: 14),),
                  ],
                ),
                Text('São Paulo, São Paulo / Brasil', style: TextStyle(fontSize: 14),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sua Bagagem',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          width: double.maxFinite,
                          height: 170,
                          child: FlutterMap(
                            mapController: mapController,
                            options: MapOptions(
                                onMapReady: () async =>  {
                                  latitudeLongitude = (await buscarUltimaLocalizacao(usuario.idUsuario))!,
                                  mapController.move(latitudeLongitude, mapController.zoom)
                                },
                                center: latitudeLongitude,
                                zoom: 17.0,
                                interactiveFlags: 0),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'org.example.app',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: LatLng(-23.60044, -46.43707),
                                    width: 80,
                                    height: 80,
                                    builder: (context) => Image.asset(
                                        "lib/refactor/assets/localizacao-da-bagagem.png"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Balanca(idUsuario: usuario.idUsuario),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
