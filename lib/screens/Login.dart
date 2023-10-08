import 'dart:ui';

import 'package:bagagem_smart/screens/Dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bagagem Smart',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            textDirection: TextDirection.ltr,
          ),
          backgroundColor: Colors.black87,
        ),
        body: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: null,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_off),
                      )),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 24),
                ),
                TextField(
                  controller: null,
                  obscureText: true, // variavel em cima do icon para alternar
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(Icons.visibility),
                      )),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 24),
                ),
                ElevatedButton(
                  child: Text('login'),
                  onPressed: () {
                    var db = FirebaseFirestore.instance;
                    final user = <String, dynamic>{
                      "first": "Alan",
                      "middle": "Mathison",
                      "last": "Turing",
                      "born": 1912
                    };

// Add a new document with a generated ID
                    db.collection("users").add(user).then((DocumentReference doc) =>
                        print('DocumentSnapshot added with ID: ${doc.id}'));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20.0),
                    fixedSize: Size(400, 70),
                    textStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Text('Esqueceu a senha?'),
              ],
            )),
      ),
    );
  }
}
