import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:core';

class CampoEmail extends StatefulWidget {
  @override
  _CampoEmail createState() => _CampoEmail();
}

class _CampoEmail extends State<CampoEmail> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _senhaEditingController = TextEditingController();
  bool isPasswordVisible = false;
  String retorno = "teste";

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String getEmail() {
    return _emailEditingController.text;
  }

  String getSenha() {
    return _senhaEditingController.text;
  }

  String? _validarEmail(String? valueField) {
    if (EmailValidator.validate(valueField!)) {
      return null;
    } else {
      return "Email inválido!";
    }
  }

  String? _validarSenha(String? valueField) {
    //todo passar essa rotina para o cadastro
    RegExp temDigito = RegExp(r'(?=.*\d)');
    RegExp temSmallCase = RegExp(r'(?=.*[a-z])');
    RegExp temUpperCase = RegExp(r'(?=.*[A-Z])');
    RegExp temCaracterEspecial = RegExp(r'(?=.*[$*&@#])');
    RegExp temOitoCaracteres = RegExp(r'[0-9a-zA-Z$*&@#]{8,}');

    return null;
  }

  void fetchAllData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').get();

    querySnapshot.docs.forEach((doc) {
      print(doc.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: TextFormField(
            controller: _emailEditingController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: _validarEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: 24),
        ),
        Center(
          child: TextFormField(
            controller: _senhaEditingController,
            obscureText: !isPasswordVisible,
            validator: _validarSenha,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: 'Senha',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: togglePasswordVisibility,
                icon: isPasswordVisible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: 24),
        ),
        ElevatedButton(
          child: Text('login'),
          onPressed: () async => {
            // todo if not valid notify
            // todo logar if is valid
            fetchAllData()
            // final user = <String, dynamic>{
            //   "first": "Alan",
            //   "middle": "Mathison",
            //   "last": "Turing",
            //   "born": 1912
            // };
// Add a new document with a generated ID
//                     db.collection("users").add(user).then((DocumentReference doc) =>
//                         print('DocumentSnapshot added with ID: ${doc.id}'));

            // todo if valid push
            // Navigator.pushNamed(context, '/dashboard');
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            fixedSize: Size(400, 70),
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            primary: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Text(retorno)
      ],
    );
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
    _senhaEditingController.dispose();
    super.dispose();
  }
}
