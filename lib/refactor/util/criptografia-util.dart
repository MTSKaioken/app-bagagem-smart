import 'dart:convert';
import 'dart:math';

class CriptografiaUtil{


  static String generateRandomHash(int length) {
    final random = Random.secure();
    final values = List<int>.generate(length ~/ 2, (_) => random.nextInt(256));
    return values.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join('');
  }

}