import 'package:flutter/material.dart';
import 'package:cinereserve/controller/general_provider.dart';
import 'package:cinereserve/model/upcomming_movie.dart';
import 'package:provider/provider.dart';

class SearchMovieProvider extends ChangeNotifier {
  var searchTEC = TextEditingController();
  List<MovieModel> filterMovies = [];

  filterMovie(BuildContext context) {
    var upcommingMovis = Provider.of<GeneralProvider>(context, listen: false)
        .upcommingMovieModel;
    if (upcommingMovis == null) {
      return;
    }
    filterMovies.clear();
    var movieList = upcommingMovis.results;
    for (var e in movieList) {
      if (e.originalTitle
          .toLowerCase()
          .contains(searchTEC.text.toLowerCase().trim())) {
        filterMovies.add(e);
      }
    }
    notifyListeners();
  }
}
