import 'package:flutter/material.dart';
import 'package:cinereserve/widgets/app_widgets/scaffold_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(useAppbar: false, child: SizedBox());
  }
}
