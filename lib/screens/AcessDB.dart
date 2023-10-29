import 'package:bagagem_smart/screens/HomePage.dart';
import 'package:bagagem_smart/screens/Login.dart';
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
          return HomePage();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          // return Login();
          return HomePage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // return Login();
        return HomePage();
      },
    );
  }
}