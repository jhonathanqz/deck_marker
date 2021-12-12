import 'package:deck_marker/app/app_module.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador de baralho',
      theme: AppModule.theme,
      initialRoute: AppModule.initialRoute,
      navigatorKey: NavigationService.navigationKey,
      routes: AppModule.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
