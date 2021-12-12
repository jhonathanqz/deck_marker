import 'package:flutter/material.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';

class SnackHelper {
  static void showSnackInformation(
    String message,
    Color color,
    BuildContext context,
  ) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.textSnackInformation,
        ),
        backgroundColor: color,
        duration: const Duration(
          seconds: 3,
        ),
      ),
    );
  }

  static void showSnackDark(
    String message,
    Color color,
    BuildContext context,
  ) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.textSnackInformation.copyWith(
            color: AppColors.black,
          ),
        ),
        backgroundColor: color,
        duration: const Duration(
          seconds: 3,
        ),
      ),
    );
  }
}
