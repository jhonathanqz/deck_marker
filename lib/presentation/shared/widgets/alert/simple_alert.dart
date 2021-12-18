import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_size.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/widgets/button/button_primary.dart';

class SimpleAlert extends StatelessWidget {
  const SimpleAlert({
    Key? key,
    required this.text,
    required this.onTap,
    required this.image,
    this.backText = 'Voltar',
    this.nextText = 'Continuar',
    this.backButtonVisible = true,
  }) : super(key: key);
  final String text;
  final String backText;
  final String nextText;
  final String image;
  final Function() onTap;
  final bool backButtonVisible;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      backgroundColor: AppColors.white,
      title: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: AppSize.plusSize,
                    width: AppSize.plusSize,
                    child: Image.asset(
                      image,
                    ),
                  ),
                ),
                Container(
                  padding: AppEdgeInsets.tmd,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      content: Container(
        padding: AppEdgeInsets.bmin,
        child: backButtonVisible
            ? Row(
                children: [
                  Expanded(
                    child: ButtonPrimary(
                      title: backText,
                      colorText: AppColors.white,
                      colorButton: AppColors.grey,
                      onTap: () {
                        coolNavigate.goBack();
                      },
                    ),
                  ),
                  AppSpacing.smW,
                  Expanded(
                    child: ButtonPrimary(
                      title: nextText,
                      onTap: () async {
                        coolNavigate.goBack();
                        onTap();
                      },
                    ),
                  ),
                ],
              )
            : ButtonPrimary(
                title: nextText,
                onTap: () async {
                  coolNavigate.goBack();
                  onTap();
                },
              ),
      ),
    );
  }
}
