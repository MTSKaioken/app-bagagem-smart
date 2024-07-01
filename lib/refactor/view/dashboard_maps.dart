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
    // final Usuario usuario =
    //     ModalRoute.of(context)!.settings.arguments as Usuario;

    return Center(
      child: Container(
        width: double.maxFinite,
        height: 200,
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(-23.60044, -46.43707),
            zoom: 17.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'org.example.app',
            )
          ],
        ),
      ),
    );
  }
}
