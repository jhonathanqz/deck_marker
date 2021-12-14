import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_input_border.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';

class AlertNovoJogo extends StatelessWidget {
  final Function() function;
  const AlertNovoJogo({
    Key? key,
    required this.function,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      backgroundColor: Colors.grey[100],
      title: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black38,
                  size: 35,
                ),
                onPressed: () => coolNavigate.goBack(),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 90,
                    child: Image.asset(
                      'images/start_22.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                AppSpacing.sm,
                Container(
                  padding: AppEdgeInsets.tmd,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Você deseja realmente começar um novo jogo?',
                      style: TextStyle(
                        color: AppColors.grey900,
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '\n\nApós confirmação, os pontos da partida atual serão zerados!',
                          style: TextStyle(
                            color: AppColors.grey900,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      content: GestureDetector(
        onTap: function,
        child: Container(
          height: 50,
          decoration: AppInputBorder.borderRadius.copyWith(
            color: AppColors.yellow700,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.yellow700,
            child: const Center(
              child: Text(
                'Novo Jogo!',
                style: AppTextStyles.headingBold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
