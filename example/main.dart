import 'package:flutter/material.dart';

import 'package:shadow_overlay/shadow_overlay.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // you can change theme to make overlay accord.
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: _isDark ? Colors.black : Colors.white,
      body: Center(
        child: ShadowOverlay(
          shadowHeight: 150,
          shadowWidth: 400,
          shadowColor: _isDark ? Colors.black : Colors.white,
          child: Image.network(
            'https://raw.githubusercontent.com/afzl-wtu/shadow_overlay/main/resources/sample2.png',
            fit: BoxFit.cover,
            height: 400,
            width: 400,
          ),
        ),
      ),
    );
  }
}
