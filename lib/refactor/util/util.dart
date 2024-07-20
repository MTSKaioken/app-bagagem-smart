import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class Util{


  static String generateRandomHash(int length) {
    final random = Random.secure();
    final values = List<int>.generate(length ~/ 2, (_) => random.nextInt(256));
    return values.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join('');
  }

  static String lpad(String originalString, int length, {String padChar = ' '}) {
    if (originalString.length >= length) {
      return originalString;
    }
    return padChar * (length - originalString.length) + originalString;
  }

  static void notify(BuildContext context, String tituloModal, String mensagemModal, [String? route]) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(
            tituloModal,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          message: Text(
            mensagemModal,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          ),
          cancelButton: CupertinoActionSheetAction(
            child: Text('OK'),
            onPressed: () {
              if(route != null){
                Navigator.pushNamed(context, route);
              } else {
                Navigator.pop(context);
              }

            },
          ),
        );
      },
    );
  }


}