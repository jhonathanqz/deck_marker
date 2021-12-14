import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/widgets/textfield/simple_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/app/injection_container.dart';

class FormPlayersTeam1 extends StatefulWidget {
  FormPlayersTeam1({
    Key? key,
    required this.numberPlayers,
  });
  final int numberPlayers;

  @override
  _FormPlayersTeam1State createState() => _FormPlayersTeam1State();
}

class _FormPlayersTeam1State extends State<FormPlayersTeam1> {
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();
  final TextEditingController player3Controller = TextEditingController();
  final TextEditingController player4Controller = TextEditingController();
  final TextEditingController player5Controller = TextEditingController();

  @override
  void initState() {
    player1Controller.text = '';
    player2Controller.text = '';
    player3Controller.text = '';
    player4Controller.text = '';
    player5Controller.text = '';
    super.initState();
  }

  @override
  void dispose() {
    player1Controller.dispose();
    player2Controller.dispose();
    player3Controller.dispose();
    player4Controller.dispose();
    player5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final ijBuracoStore = sl<BuracoStore>();
        return Column(
          children: [
            Center(
              child: SimpleTextField(
                onChanged: ijBuracoStore.setJogador1,
                textEditingController: player1Controller,
                labelText: 'Nome Jogador(a)',
                hintText: 'Nome: ',
                textInputType: TextInputType.text,
                onSubmitted: (_) {},
              ),
            ),
            Padding(
              padding: AppEdgeInsets.tsd,
              child: Center(
                child: SimpleTextField(
                  onChanged: widget.numberPlayers == 2
                      ? ijBuracoStore.setJogador6
                      : ijBuracoStore.setJogador2,
                  textEditingController: player2Controller,
                  labelText: 'Nome Jogador(a)',
                  hintText: 'Nome: ',
                  textInputType: TextInputType.text,
                  onSubmitted: (_) {},
                ),
              ),
            ),
            Visibility(
              visible: widget.numberPlayers == 6 ||
                  widget.numberPlayers == 8 ||
                  widget.numberPlayers == 10,
              child: Padding(
                padding: AppEdgeInsets.tsd,
                child: Center(
                  child: SimpleTextField(
                    onChanged: ijBuracoStore.setJogador3,
                    textEditingController: player3Controller,
                    labelText: 'Nome Jogador(a)',
                    hintText: 'Nome: ',
                    textInputType: TextInputType.text,
                    onSubmitted: (_) {},
                  ),
                ),
              ),
            ),
            Visibility(
              visible: widget.numberPlayers == 8 || widget.numberPlayers == 10,
              child: Padding(
                padding: AppEdgeInsets.tsd,
                child: Center(
                  child: SimpleTextField(
                    onChanged: ijBuracoStore.setJogador4,
                    textEditingController: player4Controller,
                    labelText: 'Nome Jogador(a)',
                    hintText: 'Nome: ',
                    textInputType: TextInputType.text,
                    onSubmitted: (_) {},
                  ),
                ),
              ),
            ),
            Visibility(
              visible: widget.numberPlayers == 10,
              child: Padding(
                padding: AppEdgeInsets.tsd,
                child: Center(
                  child: SimpleTextField(
                    onChanged: ijBuracoStore.setJogador5,
                    textEditingController: player5Controller,
                    labelText: 'Nome Jogador(a)',
                    hintText: 'Nome: ',
                    textInputType: TextInputType.text,
                    onSubmitted: (_) {},
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
