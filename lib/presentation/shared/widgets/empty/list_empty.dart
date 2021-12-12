import 'package:flutter/material.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppEdgeInsets.sdAll,
      child: Center(
        child: Text(
          message,
          style: AppTextStyles.titleButton,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
