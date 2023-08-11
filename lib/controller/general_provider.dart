import 'dart:convert';
import 'dart:developer';

import 'package:cinereserve/model/upcomming_movie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cinereserve/utils/app_key.dart';
import 'package:http/http.dart' as http;

class GeneralProvider extends ChangeNotifier {
  UpcomingMoviesModel? upcommingMovieModel;

  getUpcommingMovies() async {
    log('start');
    var request = await http.get(Uri.parse(AppApiUtils.upcommingMovieUrl));

    log('waiting for api reponse');

    if (request.statusCode == 200) {
      log('response status code is 200');
      var response = request.body;

      upcommingMovieModel = UpcomingMoviesModel.fromJson(response);
      if (kDebugMode) {
        print(response);
      }
      log('------------upcommingMovieModel-----------------');
      if (kDebugMode) {
        print(upcommingMovieModel);
      }
    } else {
      if (kDebugMode) {
        print(request.reasonPhrase);
      }
    }
    notifyListeners();
  }

  getVideoId(int movieId) async {
    var response = await http.get(Uri.parse(
        '${AppApiUtils.baseUrl}/$movieId/videos?api_key=${AppApiUtils.apiKey}'));
    Map<String, dynamic> data = jsonDecode(response.body);
    List videoList = data['results'];
    for (var e in videoList) {
      if (e['type'] == 'Teaser') {
        return e['key'];
      }
    }
  }

  String formatDate(String inputDate) {
    DateTime parsedDate = DateTime.parse(inputDate);
    String formattedDate =
        "${parsedDate.month.toString()} ${parsedDate.day}, ${parsedDate.year}";

    String monthName = "";
    switch (parsedDate.month) {
      case 1:
        monthName = "January";
        break;
      case 2:
        monthName = "February";
        break;
      case 3:
        monthName = "March";
        break;
      case 4:
        monthName = "April";
        break;
      case 5:
        monthName = "May";
        break;
      case 6:
        monthName = "June";
        break;
      case 7:
        monthName = "July";
        break;
      case 8:
        monthName = "August";
        break;
      case 9:
        monthName = "September";
        break;
      case 10:
        monthName = "October";
        break;
      case 11:
        monthName = "November";
        break;
      case 12:
        monthName = "December";
        break;
    }

    formattedDate =
        formattedDate.replaceFirst(parsedDate.month.toString(), monthName);

    return formattedDate;
  }

  String getGenreName(int genreId) {
    List<Map<String, dynamic>> genres = [
      {"id": 28, "name": "Action"},
      {"id": 12, "name": "Adventure"},
      {"id": 16, "name": "Animation"},
      {"id": 35, "name": "Comedy"},
      {"id": 80, "name": "Crime"},
      {"id": 99, "name": "Documentary"},
      {"id": 18, "name": "Drama"},
      {"id": 10751, "name": "Family"},
      {"id": 14, "name": "Fantasy"},
      {"id": 36, "name": "History"},
      {"id": 27, "name": "Horror"},
      {"id": 10402, "name": "Music"},
      {"id": 9648, "name": "Mystery"},
      {"id": 10749, "name": "Romance"},
      {"id": 878, "name": "Science Fiction"},
      {"id": 10770, "name": "TV Movie"},
      {"id": 53, "name": "Thriller"},
      {"id": 10752, "name": "War"},
      {"id": 37, "name": "Western"}
    ];

    for (var genre in genres) {
      if (genre['id'] == genreId) {
        return genre['name'];
      }
    }

    return "Unknown Genre";
  }

  Color getGenreColor(int genreId) {
    if (genreId >= 28 && genreId <= 53) {
      return const Color(0xFF15D2BB);
    } else if (genreId >= 53 && genreId <= 878) {
      return const Color(0xFFE26CA5);
    } else if (genreId >= 878 && genreId <= 10770) {
      return const Color(0xFF564CA3);
    } else {
      return const Color(0xFFCD9D0F);
    }
  }
}
