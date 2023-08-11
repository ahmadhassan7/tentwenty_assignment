import 'dart:io';

import 'package:cinereserve/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:cinereserve/controller/general_provider.dart';

import 'package:cinereserve/view/home/home_screen.dart';
import 'package:cinereserve/view/watch/watch.dart';
import 'package:provider/provider.dart';

import '../../constants/app_images.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
    this.currentindex = 1,
  });
  final int currentindex;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentindex;
    Provider.of<GeneralProvider>(context, listen: false).getUpcommingMovies();
  }

  Widget decide() {
    if (currentIndex == 0) {
      return const HomeScreen();
    } else if (currentIndex == 1) {
      return const Watch();
    } else if (currentIndex == 2) {
      return Container(
        color: white,
      );
    } else if (currentIndex == 3) {
      return Container(color: white);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          decide(),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              height: 75,
              width: size.width,
              decoration: ShapeDecoration(
                color: const Color(0xFF2E2739),
                shape: RoundedRectangleBorder(
                  borderRadius: Platform.isAndroid
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))
                      : BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DashboardWidget(
                    text: 'Dashboard',
                    imageUrl: AppImages.dashboardPNG,
                    isSelected: currentIndex == 0,
                    onTap: () {
                      currentIndex = 0;
                      setState(() {});
                    },
                  ),
                  DashboardWidget(
                    text: 'Watch',
                    imageUrl: AppImages.playButtonPNG,
                    isSelected: currentIndex == 1,
                    onTap: () {
                      currentIndex = 1;
                      setState(() {});
                    },
                  ),
                  DashboardWidget(
                    text: 'Media Library',
                    imageUrl: AppImages.mediaPNG,
                    isSelected: currentIndex == 2,
                    onTap: () {
                      currentIndex = 2;
                      setState(() {});
                    },
                  ),
                  DashboardWidget(
                    text: 'More',
                    imageUrl: AppImages.morePNG,
                    isSelected: currentIndex == 3,
                    onTap: () {
                      currentIndex = 3;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DashboardWidget extends StatelessWidget {
  const DashboardWidget(
      {Key? key,
      required this.imageUrl,
      required this.text,
      required this.isSelected,
      required this.onTap})
      : super(key: key);
  final String imageUrl;
  final String text;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Opacity(
              opacity: isSelected ? 1 : 0.54,
              child: Image.asset(
                imageUrl,
                color: Colors.white,
              ),
            ),
            Opacity(
              opacity: isSelected ? 1 : 0.54,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
