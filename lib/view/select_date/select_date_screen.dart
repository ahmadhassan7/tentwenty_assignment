import 'package:cinereserve/constants/colors.dart';
import 'package:cinereserve/model/upcomming_movie.dart';
import 'package:cinereserve/view/select_date/select_date_land_body.dart';
import 'package:cinereserve/view/select_date/select_date_portrait_body.dart';
import 'package:cinereserve/widgets/app_widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';

class SelectSeatsScreen extends StatelessWidget {
  const SelectSeatsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      useAppbar: false,
      child: Container(
        color: white,
        child: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return SelectDatePortraitBody(movie: movie);
              } else {
                return SelectDateLandBody(movie: movie);
              }
            },
          ),
        ),
      ),
    );
  }
}
