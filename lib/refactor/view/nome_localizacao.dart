import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class NomeLocalizacao extends StatefulWidget {
  @override
  _NomeLocalizacaoState createState() => _NomeLocalizacaoState();
}

class _NomeLocalizacaoState extends State<NomeLocalizacao> {
  String _locationName = 'Clique para obter o nome da localização';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Localização'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _getLocationName(37.7749, -122.4194); // Passa as coordenadas desejadas
          },
          child: Text(
            _locationName,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Future<void> _getLocationName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(-23.60044, -46.43707, localeIdentifier: "pt_BR");

      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        setState(() {
          _locationName = '${placemark.street}, ${placemark.subLocality} - ${placemark.administrativeArea}, ${placemark.subLocality} / ${placemark.country}';
        });
      } else {
        setState(() {
          _locationName = 'Localização não encontrada';
        });
      }
    } catch (e) {
      print('Erro ao obter a localização: $e');
      setState(() {
        _locationName = 'Erro ao obter a localização';
      });
    }
  }
}
