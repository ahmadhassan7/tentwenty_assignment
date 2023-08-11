import 'package:cinereserve/view/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:cinereserve/theme/native_theme.dart';
import 'package:cinereserve/widgets/app_widgets/console_error_widget.dart';
import 'package:provider/provider.dart';

import 'helpers/shared_helpers.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await SharedHelpers.initilizeApp();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ConsoleErrorWidget(
      flutterErrorDetails: details,
    );
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: SharedHelpers().controllers,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'CineReserve',
        theme: NativeThemeData().nativeLightTheme(),
        home: const Dashboard(),
      ),
    );
  }
}
