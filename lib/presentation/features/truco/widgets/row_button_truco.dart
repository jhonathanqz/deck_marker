import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class RowButtonTruco extends StatelessWidget {
  const RowButtonTruco({
    Key? key,
    required this.increase1,
    required this.increase3,
    required this.increase6,
    required this.increase9,
    required this.increase12,
  }) : super(key: key);
  final Function() increase1;
  final Function() increase3;
  final Function() increase6;
  final Function() increase9;
  final Function() increase12;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: increase1,
            child: Text(
              '+1',
              style: AppTextStyles.headingBold.copyWith(
                fontSize: 25,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        AppSpacing.minW,
        Expanded(
          child: TextButton(
            onPressed: increase3,
            child: Text(
              '+3',
              style: AppTextStyles.headingBold.copyWith(
                fontSize: 25,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        AppSpacing.minW,
        Expanded(
          child: TextButton(
            onPressed: increase6,
            child: Text(
              '+6',
              style: AppTextStyles.headingBold.copyWith(
                fontSize: 25,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        AppSpacing.minW,
        Expanded(
          child: TextButton(
            onPressed: increase9,
            child: Text(
              '+9',
              style: AppTextStyles.headingBold.copyWith(
                fontSize: 25,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        AppSpacing.minW,
        Expanded(
          child: TextButton(
            onPressed: increase12,
            child: Text(
              '+12',
              style: AppTextStyles.headingBold.copyWith(
                fontSize: 25,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
