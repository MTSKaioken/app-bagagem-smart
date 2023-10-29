import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoEmail extends StatefulWidget {
  @override
  _CampoEmail createState() => _CampoEmail();
}

class _CampoEmail extends State<CampoEmail> {
  TextEditingController _textEditingController = TextEditingController();

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: _textEditingController,
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