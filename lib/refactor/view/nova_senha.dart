import 'package:bagagem_smart/refactor/util/criptografia-util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'component/btn_show_hide_password.dart';

class NovaSenha extends StatefulWidget {

  const NovaSenha({super.key});

  @override
  _NovaSenha createState() => _NovaSenha();

}


class _NovaSenha extends State<NovaSenha> {

  final emailInputValue =  TextEditingController() ;
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
                        suffixIcon:
                        BtnShowHidePassword(onToggle: togglePassword),
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
}
