import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_images.dart';
import '../../../constants/colors.dart';
import '../../../controller/general_provider.dart';
import '../../../services/navigation_service.dart';
import '../../../widgets/empty_space_widget.dart';
import '../../movie_detail/movie_detail_screen.dart';
import '../provider/serach_provider.dart';
import '../result_movie_screen/result_screen.dart';
import '../widgets/search_movie.dart';

class SearchMovieLandBody extends StatelessWidget {
  const SearchMovieLandBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchMovieProvider>(builder: (context, provider, child) {
      return Column(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.all(20),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Color(0xFFEFEFEF)),
              ),
            ),
            child: Container(
              height: 52,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: ShapeDecoration(
                color: const Color(0xFFF2F2F6),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0xFFEFEFEF)),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.search),
                  const DynamicHorizontalSpace(10),
                  Expanded(
                      child: TextField(
                    cursorColor: darkSlateBlue,
                    controller: provider.searchTEC,
                    onChanged: (value) {
                      provider.filterMovie(context);
                    },
                    scrollPadding: EdgeInsets.zero,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        hintText: 'TV shows, movies and more',
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none),
                    onSubmitted: (value) {
                      NavigationService.push(const SearchMovieResultScreen());
                    },
                  )),
                  InkWell(
                      onTap: () {
                        provider.searchTEC.text = '';
                        provider.filterMovie(context);
                      },
                      child: const Icon(Icons.clear)),
                ],
              ),
            ),
          ),
          const DynamicVerticalSpace(30),
          if (provider.searchTEC.text.isEmpty)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SearchMovieWidget(
                              title: 'Comedies',
                              imageUrl: AppImages.comediesPNG),
                          SearchMovieWidget(
                              title: 'Crime', imageUrl: AppImages.crimePNG),
                          SearchMovieWidget(
                              title: 'Family', imageUrl: AppImages.familyPNG),
                          SearchMovieWidget(
                              title: 'Documentaries',
                              imageUrl: AppImages.documentariesPNG),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SearchMovieWidget(
                              title: 'Fantasy', imageUrl: AppImages.fantasyPNG),
                          SearchMovieWidget(
                              title: 'Holidays',
                              imageUrl: AppImages.holidaysPNG),
                          SearchMovieWidget(
                              title: 'Horror', imageUrl: AppImages.horrorPNG),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SearchMovieWidget(
                              title: 'Sci-Fi', imageUrl: AppImages.sciFiPNG),
                          SearchMovieWidget(
                              title: 'Thriller',
                              imageUrl: AppImages.thrillerPNG),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (provider.searchTEC.text.isNotEmpty)
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const DynamicVerticalSpace(20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top results',
                      style: TextStyle(
                        color: Color(0xFF202C43),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const DynamicVerticalSpace(5),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.black.withOpacity(0.10999999940395355),
                        ),
                      ),
                    ),
                  ),
                  const DynamicVerticalSpace(20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider.filterMovies.length,
                      itemBuilder: (context, index) {
                        var movie = provider.filterMovies[index];
                        return InkWell(
                          onTap: () {
                            NavigationService.push(MovieDetailScreen(
                              movie: movie,
                            ));
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 130,
                                height: 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://www.themoviedb.org/t/p/w1280${movie.posterPath}',
                                    fit: BoxFit.fill,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              const DynamicHorizontalSpace(20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      movie.title,
                                      style: const TextStyle(
                                        color: Color(0xFF202C43),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    Provider.of<GeneralProvider>(context,
                                            listen: false)
                                        .getGenreName(movie.genreIds[0]),
                                    style: const TextStyle(
                                      color: Color(0xFFDBDBDF),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.more_horiz,
                                color: skyColor,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ))
        ],
      );
    });
  }
}
