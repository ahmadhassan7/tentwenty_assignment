import 'package:flutter/foundation.dart';

class SelectDateProvider extends ChangeNotifier {
  var selectedDate = 5;
  var selectCenema = 1;
  update() {
    notifyListeners();
  }
}
