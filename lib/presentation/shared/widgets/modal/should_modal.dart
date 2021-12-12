import 'package:flutter/material.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/presentation/shared/widgets/button/set_label_button.dart';

class ShouldModal extends StatelessWidget {
  const ShouldModal({
    Key? key,
    required this.text,
    required this.value,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final String value;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: AppEdgeInsets.mdAll,
            child: Text.rich(
              TextSpan(
                text: "Atenção!\n",
                style: AppTextStyles.titleBold,
                children: [
                  TextSpan(
                    text: text,
                    style: AppTextStyles.title,
                  ),
                  const TextSpan(
                    text: "\nno valor de ",
                    style: AppTextStyles.title,
                  ),
                  TextSpan(
                    text: 'R\$ $value',
                    style: AppTextStyles.titleBold,
                  ),
                  const TextSpan(
                    text: " ?",
                    style: AppTextStyles.title,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: AppEdgeInsets.hxl,
            child: SetLabelButtons(
              primaryLabel: "Nâo",
              primaryOnPressed: () {
                Navigator.pop(context);
              },
              secondaryLabel: "Sim",
              secondaryOnPressed: onTap,
              enableSecondaryColor: true,
            ),
          ),
          AppSpacing.xl,
        ],
      ),
    );
  }
}
