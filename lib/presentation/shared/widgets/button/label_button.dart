import 'package:flutter/material.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_size.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/presentation/shared/widgets/loading/color_loader.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  final bool showProgress;
  final Color backgroundColor;

  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.showProgress = false,
    this.style,
    this.backgroundColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.t56,
      width: AppSize.widthAdditional,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: showProgress
            ? const Center(
                child: ColorLoader(),
              )
            : Text(
                label,
                style: style ?? AppTextStyles.titleButton,
              ),
      ),
    );
  }
}
