import 'package:bagagem_smart/screens/Dashboard.dart';
import 'package:bagagem_smart/screens/RecuperacaoConta.dart';
import 'package:bagagem_smart/screens/NavbarLateral.dart';
import 'package:bagagem_smart/screens/Login.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AcessDB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Dashboard();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          // return Login();
          return Dashboard();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // return Login();
        return Dashboard();
      },
    );
  }
}