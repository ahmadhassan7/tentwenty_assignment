import 'package:cinereserve/view/select_date/provider/select_date_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_images.dart';
import '../../../constants/colors.dart';
import '../../../widgets/empty_space_widget.dart';

class SelectSeatDayCard extends StatelessWidget {
  const SelectSeatDayCard({
    Key? key,
    required this.isSelected,
    required this.index,
  }) : super(key: key);
  final bool isSelected;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectDateProvider>(builder: (context, provider, child) {
      return InkWell(
        onTap: () {
          provider.selectCenema = index;
          provider.update();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '12:30',
                  style: TextStyle(
                    color: Color(0xFF202C43),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 1.60,
                  ),
                ),
                DynamicHorizontalSpace(10),
                Text(
                  'Cinetech + hall 1',
                  style: TextStyle(
                    color: Color(0xFF8F8F8F),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.60,
                  ),
                )
              ],
            ),
            const DynamicVerticalSpace(5),
            Container(
              width: 249,
              height: 145,
              margin: const EdgeInsets.all(5),
              decoration: ShapeDecoration(
                color: lavenderWhite,
                image: DecorationImage(
                    image: AssetImage(AppImages.seatsBookingPNG)),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 0.50,
                      color:
                          isSelected ? const Color(0xFF61C3F2) : Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: isSelected
                    ? const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                        )
                      ]
                    : [],
              ),
            ),
            const DynamicVerticalSpace(6),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'From',
                    style: TextStyle(
                      color: Color(0xFF8F8F8F),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.60,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: Color(0xFF202C43),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.60,
                    ),
                  ),
                  TextSpan(
                    text: '50\$ ',
                    style: TextStyle(
                      color: Color(0xFF202C43),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.60,
                    ),
                  ),
                  TextSpan(
                    text: 'or',
                    style: TextStyle(
                      color: Color(0xFF8F8F8F),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.60,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: Color(0xFF202C43),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.60,
                    ),
                  ),
                  TextSpan(
                    text: '2500 bonus',
                    style: TextStyle(
                      color: Color(0xFF202C43),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.60,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
