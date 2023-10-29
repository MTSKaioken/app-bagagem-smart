import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RecuperacaoConta extends StatelessWidget {
  const RecuperacaoConta({Key? key}) : super(key: key);

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
                    controller: null,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
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
                      final Uri _emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'kaioruan2018@gmail.com',
                        // Substitua pelo endereço de e-mail do destinatário
                        queryParameters: {
                          'subject': 'Assunto do E-mail',
                          // Substitua pelo assunto desejado
                          'body': 'Corpo do E-mail',
                          // Substitua pelo corpo do e-mail desejado
                        },
                      );

                      if (await canLaunch(_emailLaunchUri.toString())) {
                        await launch(_emailLaunchUri.toString());
                      } else {
                        // Caso o cliente de e-mail não possa ser aberto
                        // Você pode lidar com isso de acordo com sua necessidade, como exibir uma mensagem de erro.
                      }
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
    });
  }
}
