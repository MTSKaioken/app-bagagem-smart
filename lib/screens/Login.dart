import 'package:bagagem_smart/components/CampoEmail.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                CampoEmail(),
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
