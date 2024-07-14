import 'package:bagagem_smart/refactor/controller/usuario_controller.dart';
import 'package:bagagem_smart/refactor/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../exception/validation_exception.dart';
import 'component/btn_show_hide_password.dart';

class NovaSenha extends StatefulWidget {
  const NovaSenha({super.key});

  @override
  _NovaSenha createState() => _NovaSenha();
}

class _NovaSenha extends State<NovaSenha> {
  UsuarioController usuarioController = UsuarioController();
  final emailInputValue = TextEditingController();

  final senhaInputValue = TextEditingController();
  final senhaRepetidaInputValue = TextEditingController();
  bool isPasswordVisible = false;
  bool isPasswordConfirmationVisible = false;

  togglePassword() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  togglePasswordConfirmation() {
    setState(() {
      isPasswordConfirmationVisible = !isPasswordConfirmationVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    emailInputValue.text = email;
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
            'Alteração de senha',
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
                  controller: emailInputValue,
                  enabled: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[100],
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.mail)),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 24),
                ),
                Center(
                  child: TextFormField(
                    controller: senhaInputValue,
                    obscureText: !isPasswordVisible,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Nova senha',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: BtnShowHidePassword(onToggle: togglePassword),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 24),
                ),
                Center(
                  child: TextFormField(
                    controller: senhaRepetidaInputValue,
                    obscureText: !isPasswordConfirmationVisible,
                    decoration: InputDecoration(
                        labelText: 'Confirmar nova senha',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: BtnShowHidePassword(
                            onToggle: togglePasswordConfirmation)),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 24),
                ),
                ElevatedButton(
                  child: Text('Redefinir'),
                  onPressed: () async {
                    await redefinirSenha(context);
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
              ],
            )),
      ),
    );
  }

  Future<void> redefinirSenha(BuildContext context) async {
    try {
      usuarioController.validarSenha(
          senhaInputValue.text, senhaRepetidaInputValue.text);
      await usuarioController.atualizarSenhaAssociadaAoEmail(
          emailInputValue.text, senhaInputValue.text);
      Util.notify(context, "Notificação", "Senha atualizada com sucesso!", "/");
    } on ValidationException catch (e) {
      Util.notify(context, "Notificação", e.getMessage());
    }
  }
}
