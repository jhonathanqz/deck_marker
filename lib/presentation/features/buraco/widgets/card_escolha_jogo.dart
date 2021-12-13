import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardEscolhaJogo extends StatelessWidget {
  final String titleService;
  final String subTitleService;
  final IconData icon;
  final Function() function;
  final Color colorBackground;
  final String directoryImage;

  const CardEscolhaJogo({
    Key? key,
    required this.titleService,
    required this.subTitleService,
    required this.icon,
    required this.colorBackground,
    required this.function,
    required this.directoryImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorBackground,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: Image.asset(
                directoryImage,
                fit: BoxFit.cover,
              ),
            ),
            AppSpacing.sm,
            SizedBox(
              child: Text(
                titleService,
                style: AppTextStyles.headingBold,
              ),
            ),
            SizedBox(
              child: Text(
                subTitleService,
                style: AppTextStyles.headingBold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
