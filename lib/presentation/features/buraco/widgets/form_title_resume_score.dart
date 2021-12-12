import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class FormTitleResumeScore extends StatelessWidget {
  const FormTitleResumeScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacing.sm,
        const Text(
          'Pontos bate:',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        const Text(
          'Pontos morto:',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        const Text(
          'Canastra limpa:',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        const Text(
          'Canastra suja:',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        const Text(
          'Pontuação da mesa:',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        const Text(
          'Pontuação negativa:',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        //Divider(),
        Container(
          margin: AppEdgeInsets.onlyCustom,
          color: Colors.black,
          height: 2,
        ),
        const Text(
          'Total da rodada:',
          style: AppTextStyles.titleBold,
        ),
        AppSpacing.sm,
        Container(
          margin: AppEdgeInsets.tmin,
          color: Colors.black,
          height: 2,
        ),
      ],
    );
  }
}
