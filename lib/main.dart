import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bagagem_smart/screens/Login.dart';
import 'package:bagagem_smart/screens/RecuperacaoConta.dart';
import 'package:bagagem_smart/screens/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bagagem Smart',
      // themeMode: ThemeMode.system,
      // home: AcessDB(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => Login(),
        '/recuperacao': (context) => RecuperacaoConta(),
      },
    );
  }
}
