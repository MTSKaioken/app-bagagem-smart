import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:core';

class CamposTelaLogin extends StatefulWidget {

  final BuildContext parentContext;

  /* construtor */
  CamposTelaLogin({required this.parentContext});
  // final Function(bool) onLoginResult;
  //
  // CamposTelaLogin({required this.onLoginResult});

  @override
  _CamposTelaLogin createState() => _CamposTelaLogin();

}

class _CamposTelaLogin extends State<CamposTelaLogin> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _senhaEditingController = TextEditingController();
  bool isPasswordVisible = false;

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
    return null;
  }


  void buscarCadastro() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .where('email', isEqualTo: getEmail())
        .where('senha', isEqualTo: getSenha())
        .get();

    var usuario = querySnapshot.docs.firstOrNull;
    trataRetornoUsuario(usuario);
  }

  void trataRetornoUsuario(QueryDocumentSnapshot<Object?>? usuario) {
    if(usuario != null){
      print("\n\nusuario encontrado");
      Navigator.pushNamed(widget.parentContext, "/dashboard");
    } else {
      print("\n\nusuario não encontrado");
      ScaffoldMessenger.of(widget.parentContext).showSnackBar(
        SnackBar(content: Text('Login falhou. Verifique suas credenciais.')),
      );
    }
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
          child: Text('Login'),
          onPressed: () async => {
            this.buscarCadastro()
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
