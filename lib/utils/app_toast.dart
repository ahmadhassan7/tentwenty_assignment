import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/colors.dart';

class AppToast {
  static showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 4,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: primaryColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
