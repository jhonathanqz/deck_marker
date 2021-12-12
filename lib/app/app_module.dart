import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/escolha_marcador.dart';
import 'package:deck_marker/presentation/features/buraco/pages/escolha_do_jogo_buraco.dart';
import 'package:deck_marker/presentation/features/buraco/pages/jogadores_buraco.dart';
import 'package:deck_marker/presentation/features/buraco/pages/jogo_buraco.dart';
import 'package:deck_marker/presentation/features/buraco/pages/pontuacao_buraco.dart';
import 'package:deck_marker/presentation/features/buraco/pages/pontuacao_resume_buraco.dart';
import 'package:deck_marker/presentation/features/splash/pages/splash_screen_page.dart';
import 'package:deck_marker/presentation/features/truco/pages/home_jogador.dart';
import 'package:flutter/material.dart';

class AppModule {
  static String get initialRoute => NameRoute.splash;
  static Map<String, Widget Function(BuildContext)> routes = {
    NameRoute.splash: (_) => const SplashScreenPage(),
    NameRoute.home: (_) => EscolhaMarcador(),
    NameRoute.escolhaJogoBuraco: (_) => EscolhaDoJogoBuraco(),
    NameRoute.jogadoresBuraco: (_) => JogadoresBuraco(),
    NameRoute.jogoBuraco: (_) => JogoBuraco(),
    NameRoute.pontuacaoBuraco: (_) => PontuacaoBuraco(),
    NameRoute.resumoPontuacaoBuraco: (_) => PontuacaoResumeBuraco(),
    NameRoute.homeJogadorTruco: (_) => HomeJogador(),
  };

  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
