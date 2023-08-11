import 'dart:convert';

import 'package:flutter/foundation.dart';

class UpcomingMoviesModel {
  final Dates dates;
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;
  UpcomingMoviesModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  UpcomingMoviesModel copyWith({
    Dates? dates,
    int? page,
    List<MovieModel>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return UpcomingMoviesModel(
      dates: dates ?? this.dates,
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'dates': dates.toMap()});
    result.addAll({'page': page});
    result.addAll({'results': results.map((x) => x.toMap()).toList()});
    result.addAll({'total_pages': totalPages});
    result.addAll({'total_results': totalResults});

    return result;
  }

  factory UpcomingMoviesModel.fromMap(Map<String, dynamic> map) {
    return UpcomingMoviesModel(
      dates: Dates.fromMap(map['dates']),
      page: map['page']?.toInt() ?? 0,
      results: List<MovieModel>.from(
          map['results']?.map((x) => MovieModel.fromMap(x))),
      totalPages: map['total_pages']?.toInt() ?? 0,
      totalResults: map['total_results']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpcomingMoviesModel.fromJson(String source) =>
      UpcomingMoviesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UpcomingMoviesModel(dates: $dates, page: $page, results: $results, total_pages: $totalPages, total_results: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpcomingMoviesModel &&
        other.dates == dates &&
        other.page == page &&
        listEquals(other.results, results) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return dates.hashCode ^
        page.hashCode ^
        results.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}

class Dates {
  final String maximum;
  final String minimum;
  Dates({
    required this.maximum,
    required this.minimum,
  });

  Dates copyWith({
    String? maximum,
    String? minimum,
  }) {
    return Dates(
      maximum: maximum ?? this.maximum,
      minimum: minimum ?? this.minimum,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'maximum': maximum});
    result.addAll({'minimum': minimum});

    return result;
  }

  factory Dates.fromMap(Map<String, dynamic> map) {
    return Dates(
      maximum: map['maximum'] ?? '',
      minimum: map['minimum'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Dates.fromJson(String source) => Dates.fromMap(json.decode(source));

  @override
  String toString() => 'Dates(maximum: $maximum, minimum: $minimum)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Dates &&
        other.maximum == maximum &&
        other.minimum == minimum;
  }

  @override
  int get hashCode => maximum.hashCode ^ minimum.hashCode;
}

class MovieModel {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieModel copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieModel(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'adult': adult});
    result.addAll({'backdrop_path': backdropPath});
    result.addAll({'genre_ids': genreIds});
    result.addAll({'id': id});
    result.addAll({'original_language': originalLanguage});
    result.addAll({'original_title': originalTitle});
    result.addAll({'overview': overview});
    result.addAll({'popularity': popularity});
    result.addAll({'poster_path': posterPath});
    result.addAll({'release_date': releaseDate});
    result.addAll({'title': title});
    result.addAll({'video': video});
    result.addAll({'vote_average': voteAverage});
    result.addAll({'vote_count': voteCount});

    return result;
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      genreIds: List<int>.from(map['genre_ids']),
      id: map['id']?.toInt() ?? 0,
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Result(adult: $adult, backdrop_path: $backdropPath, genre_ids: $genreIds, id: $id, original_language: $originalLanguage, original_title: $originalTitle, overview: $overview, popularity: $popularity, poster_path: $posterPath, release_date: $releaseDate, title: $title, video: $video, vote_average: $voteAverage, vote_count: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        listEquals(other.genreIds, genreIds) &&
        other.id == id &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        other.releaseDate == releaseDate &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdropPath.hashCode ^
        genreIds.hashCode ^
        id.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        posterPath.hashCode ^
        releaseDate.hashCode ^
        title.hashCode ^
        video.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }
}
