import 'package:cinereserve/view/select_date/provider/select_date_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';

class SelectSeatsDateCard extends StatelessWidget {
  const SelectSeatsDateCard({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.index,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectDateProvider>(builder: (context, provider, child) {
      return InkWell(
        onTap: () {
          provider.selectedDate = index + 1;
          provider.update();
        },
        child: Container(
          height: 32,
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: ShapeDecoration(
            color: isSelected ? const Color(0xFF61C3F2) : offWhiteGray,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 1.67,
            ),
          ),
        ),
      );
    });
  }
}
