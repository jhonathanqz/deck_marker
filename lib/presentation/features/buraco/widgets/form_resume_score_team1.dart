import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class FormResumeScoreTeam1 extends StatelessWidget {
  const FormResumeScoreTeam1({
    Key? key,
    required this.ijBuracoStore,
    required this.canastraLimpaTime1,
    required this.canastraSujaTime1,
    required this.pontosMesaTime1,
    required this.pontosNegativosTime1,
  }) : super(key: key);
  final BuracoStore ijBuracoStore;
  final int canastraLimpaTime1;
  final int canastraSujaTime1;
  final int pontosMesaTime1;
  final int pontosNegativosTime1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacing.sm,
        Text(
          ijBuracoStore.bateTime1 == true ? '+ 100 pontos' : '0',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        Text(
          ijBuracoStore.pegouMortoTime1 == true ? '0   pontos' : '- 100 pontos',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        Text(
          '+ $canastraLimpaTime1 pontos',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        Text(
          '+ $canastraSujaTime1 pontos',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        Text(
          '+ $pontosMesaTime1 pontos',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        const Divider(),
        Text(
          '+ $pontosNegativosTime1 pontos',
          style: AppTextStyles.title,
        ),
        AppSpacing.sm,
        Container(
          margin: AppEdgeInsets.onlyCustom,
          color: Colors.black,
          height: 2,
        ),
        Text(
          '${ijBuracoStore.pontosRodadaTime1} pontos',
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
