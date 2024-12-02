import 'package:bagagem_smart/refactor/view/cadastro.dart';
import 'package:bagagem_smart/refactor/view/dashboard_maps.dart';
import 'package:bagagem_smart/refactor/view/dashboard.dart';
import 'package:bagagem_smart/refactor/view/home_page.dart';
import 'package:bagagem_smart/refactor/view/login.dart';
import 'package:bagagem_smart/refactor/view/nome_localizacao.dart';
import 'package:bagagem_smart/refactor/view/politica_de_privacidade.dart';
import 'package:bagagem_smart/refactor/view/recuperacao_conta.dart';
import 'package:bagagem_smart/refactor/view/termos_and_condicoes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bagagem_smart/refactor/view/editar_perfil.dart';
import 'refactor/view/nova_senha.dart';

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
      locale: const Locale('pt', 'BR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('pt', 'BR')
      ],
      title: 'Bagagem Smart',
      // themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => Login(),
        '/cadastro': (context) => Cadastro(),
        '/recuperacao': (context) => RecuperacaoConta(),
        '/dashboard/maps': (context) => DashboardMaps(),
        '/dashboard': (context) => Dashboard(),
        '/editar': (context) => EditarPerfil(),
        '/politica/privacidade': (context) => PoliticaDePrivacidade(),
        '/politica/condicoes': (context) => TermosAndCondicoes(),
        '/localizacao': (context) => NomeLocalizacao(),
        '/redefinir-senha': (context) => NovaSenha()
      },
    );
  }
}
