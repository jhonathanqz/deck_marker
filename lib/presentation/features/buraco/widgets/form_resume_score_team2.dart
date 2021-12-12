import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class FormResumeScoreTeam2 extends StatelessWidget {
  const FormResumeScoreTeam2({
    Key? key,
    required this.ijBuracoStore,
    required this.canastraLimpaTime2,
    required this.canastraSujaTime2,
    required this.pontosMesaTime2,
    required this.pontosNegativosTime2,
  }) : super(key: key);
  final BuracoStore ijBuracoStore;
  final int canastraLimpaTime2;
  final int canastraSujaTime2;
  final int pontosMesaTime2;
  final int pontosNegativosTime2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacing.sm,
        Text(
          ijBuracoStore.bateTime2 == true ? '+ 100 pontos' : '0',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        Text(
          ijBuracoStore.pegouMortoTime2 == true ? '0   pontos' : '- 100 pontos',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        Text(
          '+ $canastraLimpaTime2 pontos',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        Text(
          '+ $canastraSujaTime2 pontos',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        Text(
          '+ $pontosMesaTime2 pontos',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        Text(
          '+ $pontosNegativosTime2 pontos',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        Container(
          margin: AppEdgeInsets.onlyCustom,
          color: Colors.black,
          height: 2,
        ),
        Text(
          '${ijBuracoStore.pontosRodadaTime2} pontos',
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
