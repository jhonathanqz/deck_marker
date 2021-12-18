import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/widgets/appbar/app_bar_widget.dart';
import 'package:deck_marker/presentation/shared/widgets/loading/loading.dart';
import 'package:flutter/material.dart';

class ScaffoldPrimary extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? leading;
  final bool isLoading;
  final Widget? widgetAction;
  final bool isAction;
  final Widget? header;
  final Widget? footer;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? bottom;
  final bool? isOcultAppBar;

  const ScaffoldPrimary({
    Key? key,
    required this.title,
    required this.child,
    this.isLoading = false,
    this.leading,
    this.widgetAction,
    this.header,
    this.footer,
    this.floatingActionButton,
    this.isAction = false,
    this.bottom,
    this.isOcultAppBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: title,
        context: context,
        leading: leading,
        widget: isAction ? widgetAction! : Container(),
        bottom: bottom,
        isVisible: !isOcultAppBar!,
      ),
      floatingActionButton: floatingActionButton ?? Container(),
      backgroundColor: AppColors.background,
      body: Loading(
        isLoading: isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header ?? Container(),
            Expanded(child: child),
            footer ?? Container(),
          ],
        ),
      ),
    );
  }
}
