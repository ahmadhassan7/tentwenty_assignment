class AppApiUtils {
  static String apiKey = '795c4689c7c2a2dd5c376ee150668f47';
  //bas url
  static String baseUrl = 'https://api.themoviedb.org/3/movie';
  static String upcommingMovieUrl = '$baseUrl/upcoming?api_key=$apiKey';
  static String getImageUrl = 'https://api.themoviedb.org/3/movie/';

  static String apiHeader = 'application/json';
}
