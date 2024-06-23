import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoSenha extends StatefulWidget {

  final Function(String) callback;

  CampoSenha({required this.callback});

  @override
  _CampoSenha createState() => _CampoSenha();
}

class _CampoSenha extends State<CampoSenha> {

  String senha = "";
  bool isPasswordVisible = false;

  void updateSenha(String data){
    widget.callback(senha);
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        obscureText: !isPasswordVisible,
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
    );
  }
}