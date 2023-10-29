import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoSenha extends StatefulWidget {
  @override
  _CampoSenha createState() => _CampoSenha();
}

class _CampoSenha extends State<CampoSenha> {
  final String email = ;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String getEmail() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: ,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}