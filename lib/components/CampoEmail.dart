import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoEmail extends StatefulWidget {
  @override
  _CampoEmail createState() => _CampoEmail();
}

class _CampoEmail extends State<CampoEmail> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _senhaEditingController = TextEditingController();

  @override
  void setState(VoidCallback fn) {}

  String getEmail() {
    return _emailEditingController.text;
  }

  String getSenha() {
    return _senhaEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: TextFormField(
            controller: _emailEditingController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () async => {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(getEmail()),
                    ),
                  ),
                },
            child: Text("teste email"))
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
