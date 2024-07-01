import 'package:bagagem_smart/refactor/view/cadastro.dart';
import 'package:bagagem_smart/refactor/view/dashboard_maps.dart';
import 'package:bagagem_smart/refactor/view/dashboard.dart';
import 'package:bagagem_smart/refactor/view/home_page.dart';
import 'package:bagagem_smart/refactor/view/login.dart';
import 'package:bagagem_smart/refactor/view/recuperacao_conta.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Bagagem Smart',
      // themeMode: ThemeMode.system,
      // home: AcessDB(),
      initialRoute: '/dashboard',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => Login(),
        '/cadastro': (context) => Cadastro(),
        '/recuperacao': (context) => RecuperacaoConta(),
        '/dashboard/maps': (context) => DashboardMaps(),
        '/dashboard': (context) => Dashboard()
      },
    );
  }
}
