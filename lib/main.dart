import 'package:deck_marker/app/app.dart';
import 'package:deck_marker/app/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:deck_marker/app/firebase.dart' as firebase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  setupDependencies();
  await firebase.init();

  runApp(
    const App(),
  );
}
