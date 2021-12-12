import 'package:flutter/material.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';

class DividerVerticalWidget extends StatelessWidget {
  const DividerVerticalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: AppColors.grey,
    );
  }
}
