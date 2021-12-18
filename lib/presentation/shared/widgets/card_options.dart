import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_input_border.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardOptionsWidget extends StatelessWidget {
  final String titleService;
  final String subTitleService;
  final IconData icon;
  final Function() function;
  final Color colorBackground;
  final String imageDirectory;

  const CardOptionsWidget({
    Key? key,
    required this.titleService,
    required this.subTitleService,
    required this.icon,
    required this.colorBackground,
    required this.function,
    required this.imageDirectory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: AppInputBorder.borderRadius.copyWith(
          color: colorBackground,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: Image.asset(
                imageDirectory,
                fit: BoxFit.contain,
              ),
            ),
            AppSpacing.sm,
            SizedBox(
              child: Text(
                titleService,
                style: AppTextStyles.headingBold,
              ),
            ),
            Container(
              padding: AppEdgeInsets.vmin,
              child: Text(subTitleService),
            )
          ],
        ),
      ),
    );
  }
}
