import 'package:cinereserve/view/movie_detail/movie_detail_land_body.dart';
import 'package:cinereserve/view/movie_detail/movie_detail_portrait_body.dart';
import 'package:flutter/material.dart';

import '../../model/upcomming_movie.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return MovieDetailPortraitBody(movie: movie);
        } else {
          return MovieDetailLandBody(movie: movie);
        }
      }),
    );
  }
}
