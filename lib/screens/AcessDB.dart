import 'package:bagagem_smart/screens/Dashboard.dart';
import 'package:bagagem_smart/screens/Login.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AcessDB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Login();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Login();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Login();
      },
    );
  }
}