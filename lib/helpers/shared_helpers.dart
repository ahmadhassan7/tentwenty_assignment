import 'package:flutter/material.dart';
import 'package:cinereserve/controller/general_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../view/pay_to_reserved/provider/pay_provider.dart';
import '../view/search_movie/provider/serach_provider.dart';
import '../view/select_date/provider/select_date_provider.dart';

class SharedHelpers {
  static Future<void> initilizeApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    // await SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    // Get.put(GeneralController());
  }

  final List<SingleChildWidget> controllers = [
    ChangeNotifierProvider(create: (context) => GeneralProvider()),
    ChangeNotifierProvider(create: (context) => SearchMovieProvider()),
    ChangeNotifierProvider(create: (context) => PayProvider()),
    ChangeNotifierProvider(create: (context) => SelectDateProvider()),
    // ChangeNotifierProvider(
    //   create: (context) => UserController(),
    // ),
  ];
}
