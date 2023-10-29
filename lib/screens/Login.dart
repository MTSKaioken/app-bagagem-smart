import 'package:bagagem_smart/components/CampoEmail.dart';
import 'package:bagagem_smart/components/CampoSenha.dart';
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
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 24),
                ),
                Center(
                  child: CampoSenha(),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 24),
                ),
                ElevatedButton(
                  child: Text('login'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                    // todo logar
                    // var db = FirebaseFirestore.instance;
                    // final user = <String, dynamic>{
                    //   "first": "Alan",
                    //   "middle": "Mathison",
                    //   "last": "Turing",
                    //   "born": 1912
                    // };
// Add a new document with a generated ID
//                     db.collection("users").add(user).then((DocumentReference doc) =>
//                         print('DocumentSnapshot added with ID: ${doc.id}'));
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
