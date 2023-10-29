import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ElevatedButton com Texto e Ícone'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Ação do botão
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size(350, 70),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Cor do círculo
                ),
                padding: EdgeInsets.all(10), // Espaçamento entre o ícone e o círculo
                child: Icon(
                  Icons.mail, // Ícone
                  size: 30, // Tamanho do ícone
                  color: Colors.black, // Cor do ícone
                ),
              ),
              SizedBox(width: 30), // Espaçamento entre o círculo e o texto
              Text(
                'Entrar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Cor do texto
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}