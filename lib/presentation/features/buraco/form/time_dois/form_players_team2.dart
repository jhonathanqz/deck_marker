import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/widgets/textfield/simple_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FormPlayersTeam2 extends StatefulWidget {
  const FormPlayersTeam2({
    Key? key,
    required this.numberPlayers,
  }) : super(key: key);
  final int numberPlayers;

  @override
  _FormPlayersTeam2State createState() => _FormPlayersTeam2State();
}

class _FormPlayersTeam2State extends State<FormPlayersTeam2> {
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
                onChanged: ijBuracoStore.setJogador6,
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
                  onChanged: ijBuracoStore.setJogador7,
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
                    onChanged: ijBuracoStore.setJogador8,
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
                    onChanged: ijBuracoStore.setJogador9,
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
                    onChanged: ijBuracoStore.setJogador10,
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
