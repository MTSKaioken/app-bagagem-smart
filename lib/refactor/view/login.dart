import 'package:bagagem_smart/refactor/exception/validation_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/btn_show_hide_password.dart';
import 'package:bagagem_smart/refactor/model/usuario.dart';
import 'package:bagagem_smart/refactor/controller/usuario_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  UsuarioController usuarioController = UsuarioController();
  final emailInputValue = TextEditingController();
  final senhaInputValue = TextEditingController();

  bool isPasswordVisible = false;

  _isPasswordVisible() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void _notify(BuildContext context, String tituloModal, String mensagemModal) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(
            tituloModal,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          message: Text(
            mensagemModal,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          ),
          cancelButton: CupertinoActionSheetAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void callbackLogin(BuildContext context) async {
    try {
      Usuario usuario = await usuarioController.autenticarUsuario(
          emailInputValue.text, senhaInputValue.text);
      Navigator.pushNamed(context, "/dashboard", arguments: usuario);
    } on ValidationException catch (e) {
      _notify(context, "Notificação", e.getMessage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bagagem Smart',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: TextFormField(
                        controller: emailInputValue,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        // validator: usuarioController.validarEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(top: 24),
                    ),
                    Center(
                      child: TextFormField(
                        controller: senhaInputValue,
                        obscureText: !isPasswordVisible,
                        // validator: usuarioController.validarSenha,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                          suffixIcon: BtnShowHidePassword(
                            onToggle: _isPasswordVisible,
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
                      onPressed: () => {callbackLogin(context)},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20.0),
                        fixedSize: Size(400, 70),
                        textStyle: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/recuperacao');
                  },
                  child: Text('Esqueceu a senha?'),
                ),
              ],
            )),
      ),
    );
  }
}
