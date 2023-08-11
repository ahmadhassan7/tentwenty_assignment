import 'package:cinereserve/view/select_date/provider/select_date_provider.dart';
import 'package:cinereserve/view/select_date/widgets/date_card.dart';
import 'package:cinereserve/view/select_date/widgets/day_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/general_provider.dart';
import '../../model/upcomming_movie.dart';
import '../../services/navigation_service.dart';
import '../../widgets/empty_space_widget.dart';
import '../pay_to_reserved/pay_to_reserved.dart';

class SelectDatePortraitBody extends StatelessWidget {
  const SelectDatePortraitBody({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    var generalProvider = Provider.of<GeneralProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Consumer<SelectDateProvider>(builder: (context, provider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Color(0xFFEFEFEF)),
              ),
            ),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      NavigationService.pop();
                    },
                    child: const Icon(Icons.arrow_back_ios)),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      movie.originalTitle,
                      style: const TextStyle(
                        color: Color(0xFF202C43),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                      ),
                    ),
                    Text(
                      'In theaters ${generalProvider.formatDate(movie.releaseDate)}',
                      style: const TextStyle(
                        color: Color(0xFF61C3F2),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.transparent,
                )
              ],
            ),
          ),
          const DynamicVerticalSpace(60),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Date'),
                const DynamicVerticalSpace(14),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return SelectSeatsDateCard(
                        text: '${index + 1} Mar',
                        isSelected: provider.selectedDate == index + 1,
                        index: index,
                      );
                    },
                  ),
                ),
                const DynamicVerticalSpace(45),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SelectSeatDayCard(
                        isSelected: provider.selectCenema == index + 1,
                        index: index + 1,
                      );
                    },
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    NavigationService.push(PayToReservedScreen(
                      movie: movie,
                    ));
                  },
                  child: Container(
                    width: size.width,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF61C3F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Select Seats',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 1.43,
                        letterSpacing: 0.20,
                      ),
                    ),
                  ),
                ),
                const DynamicVerticalSpace(26)
              ],
            ),
          )),
        ],
      );
    });
  }
}
