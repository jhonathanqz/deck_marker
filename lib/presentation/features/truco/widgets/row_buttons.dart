import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class RowButtons extends StatelessWidget {
  const RowButtons({
    Key? key,
    required this.desfazer,
    required this.novoJogo,
    required this.novaPartida,
  }) : super(key: key);
  final Function() novoJogo;
  final Function() novaPartida;
  final Function() desfazer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonPrimary(
            onTap: desfazer,
            title: 'Desfazer',
            colorButton: AppColors.grey700,
            colorText: AppColors.white,
          ),
        ),
        AppSpacing.minW,
        Expanded(
          child: ButtonPrimary(
            onTap: novoJogo,
            title: 'Novo Jogo',
            colorButton: AppColors.grey800,
            colorText: AppColors.white,
          ),
        ),
        AppSpacing.minW,
        Expanded(
          child: ButtonPrimary(
            onTap: novaPartida,
            title: 'Nova Partida',
            colorButton: AppColors.grey900,
            colorText: AppColors.white,
          ),
        ),
      ],
    );
  }
}
