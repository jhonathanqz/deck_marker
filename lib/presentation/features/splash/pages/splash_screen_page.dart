import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/presentation/features/settings/mobx/settings.store.dart';
import 'package:deck_marker/presentation/features/splash/mobx/splash.store.dart';
import 'package:deck_marker/presentation/shared/style/app_images.dart';
import 'package:deck_marker/utils/layout.dart';
import 'package:flutter/material.dart';

import 'package:deck_marker/app/firebase.dart' as firebase;

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    _init();

    sl<SplashStore>().dismissSplashScreen(context);
    super.initState();
  }

  void _init() async {
    await firebase.getToken();
    await firebase.onMessageOpenedApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Layout.getSize(context).height,
      width: Layout.getSize(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.logo),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Center(
        child: SizedBox(
          height: Layout.getSize(context).height / 2.5,
          child: Image.asset(
            AppImages.logo,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
