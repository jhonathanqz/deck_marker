import 'package:flutter/material.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/widgets/loading/color_loader.dart';
import 'package:deck_marker/utils/layout.dart';

class Loading extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const Loading({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        SizedBox(
          height: Layout.getSize(context).height,
          width: Layout.getSize(context).width,
          child: Visibility(
            visible: isLoading,
            child: Container(
              width: double.infinity,
              height: Layout.getSize(context).height,
              color: AppColors.blurredBackground.withOpacity(0.7),
              child: const Center(
                child: SizedBox(
                  height: 50,
                  child: ColorLoader(
                    dotOneColor: AppColors.white,
                    dotTwoColor: AppColors.white,
                    dotThreeColor: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
