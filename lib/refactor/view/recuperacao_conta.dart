import 'package:bagagem_smart/refactor/util/criptografia-util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RecuperacaoConta extends StatefulWidget {

  const RecuperacaoConta({super.key});

  @override
  _RecuperacaoConta createState() => _RecuperacaoConta();

}


class _RecuperacaoConta extends State<RecuperacaoConta> {

  final emailInputValue = TextEditingController();
  final codigoInputValue = TextEditingController();

  late bool isEnabledCodigo = false;
  late bool isEnabledEmail = true;

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

  void resetPassword(BuildContext context) async {
    String destinatario = emailInputValue.text.trim();
    // validar email do destinatario... se for valido prosseguir, se não retornar

    const String remetente = String.fromEnvironment('email-gmail-remetente');
    const String senhaRemetente =
        String.fromEnvironment('password-gmail-remetente');
    final smtpServer = gmail(remetente, senhaRemetente);

    String hash = CriptografiaUtil.generateRandomHash(16);
    final message = Message()
      ..from = Address('bagagemsmart@gmail.com', 'Bagagem Smart')
      ..recipients.add(destinatario)
      ..subject = 'Redefinição de Senha'
      ..text =
          'Informe o código a seguir no aplicativo para poder redefinir sua senha:\n\n${hash}';

    try {
      final sendReport = await send(message, smtpServer);
      print('E-mail enviado: ${sendReport.toString()}');
      _notify(context, 'Notificação',
          'E-mail de redefinição de senha enviado para $destinatario');
      // após o envio com sucesso, bloquear o campo de email e liberar o do
      // código
    } catch (e) {
      print('Erro ao enviar e-mail de redefinição de senha: $e');
      _notify(
          context, 'Erro', 'Erro ao enviar e-mail de redefinição de senha.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(builder: (context) {
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
              'Recuperar a senha',
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
                    enabled: isEnabledEmail,
                    decoration: InputDecoration(
                        filled: !isEnabledEmail,
                        fillColor: isEnabledEmail ? null : Colors.blueGrey[100],
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.mail)),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  TextField(
                    controller: codigoInputValue,
                    decoration: InputDecoration(
                      filled: !isEnabledCodigo,
                      fillColor: isEnabledCodigo ? null : Colors.blueGrey[100],
                      labelText: 'Código',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password),
                      enabled: isEnabledCodigo,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  ElevatedButton(
                    child: Text('Enviar'),
                    onPressed: () async {
                      resetPassword(context);
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
                  Visibility(
                    visible: true,
                    child: GestureDetector(
                      onTap: () {
                        // todo quando o email for enviado, apresentar essa label,
                        // liberar o campo de código e bloquear o do email...
                        // ao clicar no gerar novo código, desbloquear o email e
                        // liberar o campo código
                        setState(() {
                          isEnabledCodigo = !isEnabledCodigo;
                          isEnabledEmail = !isEnabledEmail;
                        });

                      },
                      child: Text('Gerar novo código'),
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }
}
