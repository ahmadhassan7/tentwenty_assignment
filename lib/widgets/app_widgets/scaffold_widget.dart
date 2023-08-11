import 'package:flutter/material.dart';

import 'appbar_widget.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget(
      {super.key,
      required this.child,
      this.floatingActionButton,
      this.customPadding = const EdgeInsets.all(0),
      this.useAppbar = true,
      this.customAppBar,
      this.useSingleChildScrollView = false,
      this.resizeToAvoidBottomInset = true,
      this.drawer,
      this.backgroundColor});

  final Widget child;
  final EdgeInsets? customPadding;
  final bool useSingleChildScrollView;
  final bool resizeToAvoidBottomInset;
  final bool useAppbar;
  final PreferredSizeWidget? customAppBar;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawerEnableOpenDragGesture: false, // This way it will not open

      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: useAppbar ? customAppBar ?? const AppbarWidget() : null,
      body: useSingleChildScrollView
          ? SingleChildScrollView(
              padding: customPadding ?? EdgeInsets.zero,
              child: child,
            )
          : Padding(
              padding: customPadding ?? EdgeInsets.zero,
              child: child,
            ),
      floatingActionButton: floatingActionButton,
      drawer: drawer,
    );
  }
}
