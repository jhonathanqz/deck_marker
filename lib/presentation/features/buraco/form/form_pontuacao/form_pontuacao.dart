import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/presentation/shared/widgets/textfield/simple_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FormPontuacao extends StatefulWidget {
  const FormPontuacao({Key? key}) : super(key: key);

  @override
  _FormPontuacaoState createState() => _FormPontuacaoState();
}

class _FormPontuacaoState extends State<FormPontuacao> {
  final ijBuracoStore = sl<BuracoStore>();

  final TextEditingController canastraLimpaTime1 = TextEditingController();
  final TextEditingController canastraLimpaTime2 = TextEditingController();
  final TextEditingController canastraSujaTime1 = TextEditingController();
  final TextEditingController canastraSujaTime2 = TextEditingController();
  final TextEditingController pontoCartasTime1 = TextEditingController();
  final TextEditingController pontoCartasTime2 = TextEditingController();
  final TextEditingController pontoNegativosTime1 = TextEditingController();
  final TextEditingController pontoNegativosTime2 = TextEditingController();

  @override
  void initState() {
    canastraLimpaTime1.text = '';
    canastraLimpaTime2.text = '';
    canastraSujaTime1.text = '';
    canastraSujaTime2.text = '';
    pontoCartasTime1.text = '';
    pontoCartasTime2.text = '';
    pontoNegativosTime1.text = '';
    pontoNegativosTime2.text = '';
    super.initState();
  }

  @override
  void dispose() {
    canastraLimpaTime1.dispose();
    canastraLimpaTime2.dispose();
    canastraSujaTime1.dispose();
    canastraSujaTime2.dispose();
    pontoCartasTime1.dispose();
    pontoCartasTime2.dispose();
    pontoNegativosTime1.dispose();
    pontoNegativosTime2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: AppEdgeInsets.mdAll,
                child: Text(
                  'Pontuação Time 1',
                  style: AppTextStyles.headingBold.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Container(
              padding: AppEdgeInsets.tmd,
              child: Text(
                ijBuracoStore.bateTime1 == true
                    ? 'Time 1 bateu?   SIM'
                    : 'Time 1 bateu?   NÃO',
                style: AppTextStyles.title,
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: ijBuracoStore.statusBateTime1Yes,
                  activeColor: Colors.greenAccent[700],
                  onChanged: (s) => ijBuracoStore.setBateuTime1Yes(s!),
                ),
                const Text(
                  'Sim',
                  style: AppTextStyles.simple,
                ),
                AppSpacing.mdW,
                Checkbox(
                  value: ijBuracoStore.statusBateTime1No,
                  activeColor: Colors.red,
                  onChanged: (n) => ijBuracoStore.setBateuTime1No(n!),
                ),
                const Text(
                  'Não',
                  style: AppTextStyles.simple,
                ),
              ],
            ),
            Container(
              padding: AppEdgeInsets.tmd,
              child: Text(
                ijBuracoStore.pegouMortoTime1 == true
                    ? 'Time 1 pegou o morto?   SIM'
                    : 'Time 1 pegou o morto?   NÃO',
                style: AppTextStyles.title,
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: ijBuracoStore.statusPegouMortoTime1Yes,
                  activeColor: Colors.greenAccent[700],
                  onChanged: (s) => ijBuracoStore.setPegouMorto1Yes(s!),
                ),
                const Text(
                  'Sim',
                  style: AppTextStyles.simple,
                ),
                AppSpacing.mdW,
                Checkbox(
                  value: ijBuracoStore.statusPegouMortoTime1No,
                  activeColor: Colors.red,
                  onChanged: (n) => ijBuracoStore.setPegouMorto1No(n!),
                ),
                const Text(
                  'Não',
                  style: AppTextStyles.simple,
                ),
              ],
            ),
            AppSpacing.min,
            Container(
              padding: AppEdgeInsets.sdAll,
              child: const Text(
                'Canastra limpa',
                style: AppTextStyles.titleBold,
              ),
            ),

            Center(
              child: SimpleTextField(
                onChanged: ijBuracoStore.setCanastraLimpaTime1,
                textEditingController: canastraLimpaTime1,
                labelText: 'Canastra limpa',
                hintText: 'Pontuação: ',
                textInputType: TextInputType.number,
                onSubmitted: (_) {},
              ),
            ),
            AppSpacing.min,
            Container(
              padding: AppEdgeInsets.sdAll,
              child: const Text(
                'Canastra suja',
                style: AppTextStyles.titleBold,
              ),
            ),

            Center(
              child: SimpleTextField(
                onChanged: ijBuracoStore.setCanastraSujaTime1,
                textEditingController: canastraSujaTime1,
                labelText: 'Canastra suja',
                hintText: 'Pontuação: ',
                textInputType: TextInputType.number,
                onSubmitted: (_) {},
              ),
            ),
            AppSpacing.min,
            Container(
              padding: AppEdgeInsets.sdAll,
              child: const Text(
                'Pontuação das cartas',
                style: AppTextStyles.titleBold,
              ),
            ),
            Center(
              child: SimpleTextField(
                onChanged: ijBuracoStore.setPontuacaoCartasTime1,
                textEditingController: pontoCartasTime1,
                labelText: 'Pontuação das cartas',
                hintText: 'Pontuação: ',
                textInputType: TextInputType.number,
                onSubmitted: (_) {},
              ),
            ),
            AppSpacing.min,
            Container(
              padding: AppEdgeInsets.sdAll,
              child: Text(
                'Pontuação negativa',
                style: AppTextStyles.titleBold.copyWith(
                  color: AppColors.redInformation,
                ),
              ),
            ),
            Center(
              child: SimpleTextField(
                onChanged: ijBuracoStore.setPontuacaoNegativaTime1,
                textEditingController: pontoNegativosTime1,
                labelText: 'Pontuação negativa',
                hintText: 'Pontuação: ',
                textInputType: TextInputType.number,
                onSubmitted: (_) {},
              ),
            ),

            //*************************************************************************************************************************** */
            //*************************************************************************************************************************** */
            AppSpacing.md,
            Center(
              child: Container(
                padding: AppEdgeInsets.mdAll,
                child: Text(
                  'Pontuação Time 2',
                  style: AppTextStyles.headingBold.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            Container(
              padding: AppEdgeInsets.tmd,
              child: Text(
                ijBuracoStore.bateTime2 == true
                    ? 'Time 2 bateu?   SIM'
                    : 'Time 2 bateu?   NÃO',
                style: AppTextStyles.title,
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: ijBuracoStore.statusBateTime2Yes,
                  activeColor: Colors.greenAccent[700],
                  onChanged: (s) => ijBuracoStore.setBateuTime2Yes(s!),
                ),
                const Text(
                  'Sim',
                  style: AppTextStyles.simple,
                ),
                AppSpacing.mdW,
                Checkbox(
                  value: ijBuracoStore.statusBateTime2No,
                  activeColor: Colors.red,
                  onChanged: (n) => ijBuracoStore.setBateuTime2No(n!),
                ),
                const Text('Não', style: AppTextStyles.simple),
              ],
            ),
            Container(
              padding: AppEdgeInsets.tmd,
              child: Text(
                ijBuracoStore.pegouMortoTime2 == true
                    ? 'Time 2 pegou o morto?   SIM'
                    : 'Time 2 pegou o morto?   NÃO',
                style: AppTextStyles.title,
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: ijBuracoStore.statusPegouMortoTime2Yes,
                  activeColor: Colors.greenAccent[700],
                  onChanged: (s) => ijBuracoStore.setPegouMorto2Yes(s!),
                ),
                const Text(
                  'Sim',
                  style: AppTextStyles.simple,
                ),
                AppSpacing.mdW,
                Checkbox(
                  value: ijBuracoStore.statusPegouMortoTime2No,
                  activeColor: Colors.red,
                  onChanged: (n) => ijBuracoStore.setPegouMorto2No(n!),
                ),
                const Text(
                  'Não',
                  style: AppTextStyles.simple,
                ),
              ],
            ),
            AppSpacing.min,
            Container(
              padding: AppEdgeInsets.sdAll,
              child: const Text(
                'Canastra limpa',
                style: AppTextStyles.titleBold,
              ),
            ),
            Center(
              child: SimpleTextField(
                onChanged: ijBuracoStore.setCanastraLimpaTime2,
                textEditingController: canastraLimpaTime2,
                labelText: 'Canastra limpa',
                hintText: 'Pontuação: ',
                textInputType: TextInputType.number,
                onSubmitted: (_) {},
              ),
            ),
            AppSpacing.min,
            Container(
              padding: AppEdgeInsets.sdAll,
              child: const Text(
                'Canastra suja',
                style: AppTextStyles.titleBold,
              ),
            ),
            Center(
              child: SimpleTextField(
                onChanged: ijBuracoStore.setCanastraSujaTime2,
                textEditingController: canastraSujaTime2,
                labelText: 'Canastra suja',
                hintText: 'Pontuação: ',
                textInputType: TextInputType.number,
                onSubmitted: (_) {},
              ),
            ),
            AppSpacing.min,
            Container(
              padding: AppEdgeInsets.sdAll,
              child: const Text(
                'Pontuação das cartas',
                style: AppTextStyles.titleBold,
              ),
            ),
            Center(
              child: SimpleTextField(
                onChanged: ijBuracoStore.setPontuacaoCartasTime2,
                textEditingController: pontoCartasTime2,
                labelText: 'Pontuação das cartas',
                hintText: 'Pontuação: ',
                textInputType: TextInputType.number,
                onSubmitted: (_) {},
              ),
            ),
            AppSpacing.min,
            Container(
              padding: AppEdgeInsets.sdAll,
              child: Text(
                'Pontuação negativa',
                style: AppTextStyles.titleBold.copyWith(
                  color: AppColors.redInformation,
                ),
              ),
            ),
            Center(
              child: SimpleTextField(
                onChanged: ijBuracoStore.setPontuacaoNegativaTime2,
                textEditingController: pontoNegativosTime2,
                labelText: 'Pontuação negativa',
                hintText: 'Pontuação: ',
                textInputType: TextInputType.number,
                onSubmitted: (_) {},
              ),
            ),
          ],
        );
      },
    );
  }
}
