// ignore_for_file: deprecated_member_use

import 'package:cinereserve/constants/app_images.dart';
import 'package:cinereserve/constants/colors.dart';
import 'package:cinereserve/model/upcomming_movie.dart';
import 'package:cinereserve/services/navigation_service.dart';
import 'package:cinereserve/utils/app_toast.dart';
import 'package:cinereserve/view/pay_to_reserved/provider/pay_provider.dart';
import 'package:cinereserve/widgets/app_widgets/scaffold_widget.dart';
import 'package:cinereserve/widgets/empty_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import '../../controller/general_provider.dart';

class PayToReservedScreen extends StatefulWidget {
  const PayToReservedScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieModel movie;
  @override
  State<PayToReservedScreen> createState() => _PayToReservedScreenState();
}

class _PayToReservedScreenState extends State<PayToReservedScreen> {
  @override
  Widget build(BuildContext context) {
    var generalProvider = Provider.of<GeneralProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;

    return ScaffoldWidget(
      useAppbar: false,
      useSingleChildScrollView: true,
      child: Container(
        color: white,
        child: SafeArea(
          child: Column(
            children: [
              ZoomOverlay(
                modalBarrierColor: Colors.black12, // Optional
                minScale: 0.5, // Optional
                maxScale: 3.0, // Optional
                animationCurve: Curves
                    .fastOutSlowIn, // Defaults to fastOutSlowIn which mimics IOS instagram behavior
                animationDuration: const Duration(
                    milliseconds:
                        300), // Defaults to 100 Milliseconds. Recommended duration is 300 milliseconds for Curves.fastOutSlowIn
                twoTouchOnly: true, // Defaults to false
                onScaleStart: () {}, // optional VoidCallback
                onScaleStop: () {}, // optional VoidCallback
                child: const SizedBox(),
              ),
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
                          widget.movie.originalTitle,
                          style: const TextStyle(
                            color: Color(0xFF202C43),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.25,
                          ),
                        ),
                        Text(
                          'In theaters ${generalProvider.formatDate(widget.movie.releaseDate)}',
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
              InteractiveViewer(
                minScale: 1,
                maxScale: 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(AppImages.screenSVG),
                          Positioned(
                            left: size.width / 2.5,
                            top: 10,
                            child: const Text(
                              'SCREEN',
                              style: TextStyle(
                                color: Color(0xFF8F8F8F),
                                fontSize: 8,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.60,
                              ),
                            ),
                          )
                        ],
                      ),
                      //seats
                      //row 1
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const DynamicHorizontalSpace(6),
                            Consumer<PayProvider>(
                                builder: (context, provider, child) {
                              return Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF202C43),
                                  fontSize: 5.38 * provider.width * 0.2,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 1.25,
                                ),
                              );
                            }),
                            const DynamicHorizontalSpace(26),
                            const SelectSeatCard(
                              0,
                              color: Colors.white,
                            ),
                            const SelectSeatCard(
                              1,
                              color: Colors.white,
                            ),
                            for (int i = 0; i < 2; i++) SelectSeatCard(i),
                            const DynamicHorizontalSpace(10),
                            for (int i = 2; i < 16; i++) SelectSeatCard(i),
                            const DynamicHorizontalSpace(10),
                            for (int i = 16; i < 18; i++) SelectSeatCard(i),
                            const DynamicHorizontalSpace(40),
                          ],
                        ),
                      ),
                      //row 2
                      const SeatBookinMidleSeats(
                        line: '2',
                        mostLeftSeatNo: 18,
                        mostRightSeatNo: 40,
                      ),
                      //row 3
                      const SeatBookinMidleSeats(
                        line: '3',
                        mostLeftSeatNo: 40,
                        mostRightSeatNo: 62,
                      ),
                      //row 4
                      const SeatBookinMidleSeats(
                        line: '4',
                        mostLeftSeatNo: 62,
                        mostRightSeatNo: 84,
                      ),
                      //row 5
                      const SeatBookingBackSeats(
                        line: '5',
                        mostLeftSeatNo: 84,
                        mostRightSeatNo: 108,
                      ),
                      //row 6
                      const SeatBookingBackSeats(
                        line: '6',
                        mostLeftSeatNo: 108,
                        mostRightSeatNo: 132,
                      ),
                      //row 7
                      const SeatBookingBackSeats(
                        line: '7',
                        mostLeftSeatNo: 132,
                        mostRightSeatNo: 156,
                      ),
                      //row 8
                      const SeatBookingBackSeats(
                        line: '8',
                        mostLeftSeatNo: 156,
                        mostRightSeatNo: 180,
                      ),
                      //row 9
                      const SeatBookingBackSeats(
                        line: '9',
                        mostLeftSeatNo: 180,
                        mostRightSeatNo: 204,
                      ),
                      //row 10
                      const SeatBookingBackSeats(
                        line: '10',
                        mostLeftSeatNo: 204,
                        mostRightSeatNo: 102,
                      ),
                    ],
                  ),
                ),
              ),

              //
              const DynamicVerticalSpace(60),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //zoom out
                  InkWell(
                    onTap: () {
                      Provider.of<PayProvider>(context, listen: false).width++;
                      Provider.of<PayProvider>(context, listen: false).update();

                      setState(() {});
                    },
                    child: Container(
                      width: 29.13,
                      height: 29.13,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.8799999952316284),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.46, color: Color(0xFFEFEFEF)),
                          borderRadius: BorderRadius.circular(18.21),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ),
                  const DynamicHorizontalSpace(6),
                  //zoom in
                  InkWell(
                    onTap: () {
                      // if (_zoomLevel == 1) {
                      //   return;
                      // }

                      Provider.of<PayProvider>(context, listen: false).width--;
                      Provider.of<PayProvider>(context, listen: false).update();
                      // transformationController!.value.forward;
                      // _zoomLevel--;
                      setState(() {});
                    },
                    child: Container(
                      width: 29.13,
                      height: 29.13,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.8799999952316284),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.46, color: Color(0xFFEFEFEF)),
                          borderRadius: BorderRadius.circular(18.21),
                        ),
                      ),
                      child: const Icon(
                        Icons.remove,
                        size: 20,
                      ),
                    ),
                  ),
                  const DynamicHorizontalSpace(10)
                ],
              ),
              const DynamicVerticalSpace(20),

              //
              Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //1 selected/un container
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              width: 17.01,
                              height: 16.16,
                              child: SvgPicture.asset(
                                AppImages.seatSVG,
                                color: const Color(0xFFCD9D0F),
                              ),
                            ),
                          ),
                          const DynamicHorizontalSpace(10),
                          const SizedBox(
                            width: 57.50,
                            child: Text(
                              'Selected',
                              style: TextStyle(
                                color: Color(0xFF8F8F8F),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.60,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              width: 17.01,
                              height: 16.16,
                              child: SvgPicture.asset(
                                AppImages.seatSVG,
                                color: const Color(0xFFA5A5A5),
                              ),
                            ),
                          ),
                          const DynamicHorizontalSpace(10),
                          const SizedBox(
                            width: 100.50,
                            child: Text(
                              'Not available',
                              style: TextStyle(
                                color: Color(0xFF8F8F8F),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.60,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),

                      const DynamicVerticalSpace(17),
                      //2
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              width: 17.01,
                              height: 16.16,
                              child: SvgPicture.asset(
                                AppImages.seatSVG,
                                color: const Color(0xFF564CA3),
                              ),
                            ),
                          ),
                          const DynamicHorizontalSpace(10),
                          const SizedBox(
                            child: Text(
                              'VIP (150\$)',
                              style: TextStyle(
                                color: Color(0xFF8F8F8F),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.60,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              width: 17.01,
                              height: 16.16,
                              child: SvgPicture.asset(
                                AppImages.seatSVG,
                                color: const Color(0xFF61C3F2),
                              ),
                            ),
                          ),
                          const DynamicHorizontalSpace(10),
                          const SizedBox(
                            width: 100.50,
                            child: Text(
                              'Regular (50 \$)',
                              style: TextStyle(
                                color: Color(0xFF8F8F8F),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.60,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const DynamicVerticalSpace(32),
                      //
                      Container(
                        width: 97,
                        height: 30,
                        decoration: ShapeDecoration(
                          color: const Color(0x19A5A5A5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '4 ',
                                    style: TextStyle(
                                      color: Color(0xFF202C43),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                      letterSpacing: -0.20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/',
                                    style: TextStyle(
                                      color: Color(0xFF202C43),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 1,
                                      letterSpacing: -0.20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '3 row',
                              style: TextStyle(
                                color: Color(0xFF202C43),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: -0.20,
                              ),
                            ),
                            DynamicHorizontalSpace(10),
                            Icon(
                              Icons.clear,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      //
                      const DynamicVerticalSpace(35),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 108,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: const Color(0x19A5A5A5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: TextStyle(
                                      color: Color(0xFF202C43),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '\$ 50',
                                    style: TextStyle(
                                      color: Color(0xFF202C43),
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 1.25,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const DynamicHorizontalSpace(10),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                AppToast.showToast(message: 'Demo Completed');
                              },
                              child: Container(
                                width: 216,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF61C3F2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Proceed to pay',
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
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// row 2 to 4
class SeatBookinMidleSeats extends StatelessWidget {
  const SeatBookinMidleSeats({
    Key? key,
    required this.line,
    required this.mostLeftSeatNo,
    required this.mostRightSeatNo,
  }) : super(key: key);
  final String line;
  final int mostLeftSeatNo;
  final int mostRightSeatNo;
  @override
  Widget build(BuildContext context) {
    return Consumer<PayProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              line,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF202C43),
                fontSize: 5.38 * provider.width * 0.2,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            const DynamicHorizontalSpace(25),
            for (int i = mostLeftSeatNo; i < mostLeftSeatNo + 4; i++)
              SelectSeatCard(i),
            const DynamicHorizontalSpace(10),
            for (int i = mostLeftSeatNo + 4; i < mostLeftSeatNo + 18; i++)
              SelectSeatCard(i),
            const DynamicHorizontalSpace(10),
            for (int i = mostLeftSeatNo + 18; i < mostLeftSeatNo + 22; i++)
              SelectSeatCard(i),
            const DynamicHorizontalSpace(12),
          ],
        ),
      );
    });
  }
}

//row 5 to 10
class SeatBookingBackSeats extends StatelessWidget {
  const SeatBookingBackSeats({
    Key? key,
    required this.line,
    required this.mostLeftSeatNo,
    required this.mostRightSeatNo,
  }) : super(key: key);
  final String line;
  final int mostLeftSeatNo;
  final int mostRightSeatNo;
  @override
  Widget build(BuildContext context) {
    return Consumer<PayProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              line,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF202C43),
                fontSize: 5.38 * provider.width * 0.2,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            const DynamicHorizontalSpace(14),
            for (int i = mostLeftSeatNo; i < mostLeftSeatNo + 5; i++)
              SelectSeatCard(i),
            const DynamicHorizontalSpace(10),
            for (int i = mostLeftSeatNo + 5; i < mostLeftSeatNo + 19; i++)
              SelectSeatCard(i),
            const DynamicHorizontalSpace(10),
            for (int i = mostLeftSeatNo + 19; i < mostLeftSeatNo + 24; i++)
              SelectSeatCard(i),
          ],
        ),
      );
    });
  }
}

class SelectSeatCard extends StatelessWidget {
  const SelectSeatCard(this.seatNo, {super.key, this.color});
  final int seatNo;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Consumer<PayProvider>(builder: (context, provider, child) {
      if (seatNo < 10 || seatNo < 20) {
        return InkWell(
          onTap: () {
            AppToast.showToast(message: 'Only for Vip');
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: provider.width,
              height: provider.width,
              child: SvgPicture.asset(
                AppImages.seatSVG,
                color: const Color(0xFF564CA3),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }
      if (seatNo % 2 == 0) {
        return InkWell(
          onTap: () {
            AppToast.showToast(message: 'Not Available');
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: provider.width,
              height: provider.width,
              child: SvgPicture.asset(
                AppImages.seatSVG,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }
      return InkWell(
        onTap: () {
          if (provider.selectingSeat.contains(seatNo)) {
            provider.unSelectSeat(seatNo);
          } else {
            provider.selectSeat(seatNo);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: provider.width,
            height: provider.width,
            child: SvgPicture.asset(
              AppImages.seatSVG,
              color: color ??
                  (provider.selectingSeat.contains(seatNo)
                      ? const Color(0xFFCD9D0F)
                      : const Color(0xFF61C3F2)),
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    });
  }
}
