import 'package:cinereserve/utils/math_utils.dart';
import 'package:flutter/material.dart';

class PayProvider extends ChangeNotifier {
  List<int> selectingSeat = [];
  double width = size.width * 0.02;
  selectSeat(int seatNo) {
    selectingSeat.add(seatNo);
    debugPrint('select seat No $seatNo');
    notifyListeners();
  }

  unSelectSeat(int seatNo) {
    selectingSeat.remove(seatNo);
    debugPrint('unSelect seat No $seatNo');

    notifyListeners();
  }

  update() {
    notifyListeners();
  }
}
