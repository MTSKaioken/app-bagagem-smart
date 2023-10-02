import 'package:flutter/material.dart';
import 'screens/App.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bagagem Smart',
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: App()
    );
  }

}