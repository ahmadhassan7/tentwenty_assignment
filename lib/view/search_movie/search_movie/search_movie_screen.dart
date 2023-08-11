import 'package:cinereserve/constants/colors.dart';
import 'package:cinereserve/view/search_movie/search_movie/search_movie_land_body.dart';
import 'package:cinereserve/view/search_movie/search_movie/search_movie_portrait_body.dart';
import 'package:flutter/material.dart';

import 'package:cinereserve/widgets/app_widgets/scaffold_widget.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: white,

      child: SafeArea(
        child: ScaffoldWidget(
          useAppbar: false,
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return const SearchMoviePortraitBody();
              } else {
                return const SearchMovieLandBody();
              }
            },
          ),
        ),
      ),
    );
  }
}
