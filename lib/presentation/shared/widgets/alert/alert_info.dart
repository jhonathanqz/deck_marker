import 'package:flutter/material.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_input_border.dart';
import 'package:deck_marker/presentation/shared/style/app_size.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/presentation/shared/widgets/button/button_primary.dart';
import 'package:deck_marker/utils/cool_navigate.dart';

@immutable
class AlertInfo extends StatelessWidget {
  final String message;
  final Function() function;
  final String? textButton;
  final String title;
  final bool isDualButton;
  final String image;
  const AlertInfo({
    Key? key,
    required this.title,
    required this.message,
    required this.function,
    this.textButton = 'Finalizar',
    this.isDualButton = false,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppInputBorder.borderRadiusAll,
      ),
      elevation: 2,
      backgroundColor: AppColors.white,
      title: SizedBox(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: AppSize.t56,
                width: AppSize.t56,
                child: Image.asset(image),
              ),
            ),
            AppSpacing.sm,
            Center(
              child: Text(
                title,
                style: AppTextStyles.titleBold.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            Container(
              padding: AppEdgeInsets.tmd,
              child: Text(
                message,
                style: AppTextStyles.title,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      content: isDualButton
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      coolNavigate.goBack();
                    },
                    child: Text(
                      'voltar',
                      style: AppTextStyles.titleBold.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ButtonPrimary(
                    colorButton: AppColors.grey3,
                    onTap: function,
                    title: textButton!,
                  ),
                ),
              ],
            )
          : ButtonPrimary(
              colorButton: AppColors.grey3,
              onTap: function,
              title: textButton!,
            ),
    );
  }
}
