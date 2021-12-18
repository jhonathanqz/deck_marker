import 'package:deck_marker/app/firebase.dart' as firebase;
import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/presentation/features/splash/mobx/splash.store.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_images.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/widgets/loading/color_loader.dart';
import 'package:deck_marker/utils/layout.dart';
import 'package:flutter/material.dart';

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
    return Material(
      child: Container(
        height: Layout.getSize(context).height,
        width: Layout.getSize(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.fundo3),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: AppEdgeInsets.sdAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                ColorLoader(
                  dotOneColor: AppColors.white,
                  dotTwoColor: AppColors.white,
                  dotThreeColor: AppColors.white,
                ),
                AppSpacing.sm,
                Text(
                  '@jhonathanQz',
                  style: TextStyle(
                    color: AppColors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
