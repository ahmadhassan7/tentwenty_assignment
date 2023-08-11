import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cinereserve/services/navigation_service.dart';
import 'package:cinereserve/view/search_movie/provider/serach_provider.dart';
import 'package:cinereserve/widgets/app_widgets/scaffold_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../controller/general_provider.dart';
import '../../../widgets/empty_space_widget.dart';
import '../../movie_detail/movie_detail_screen.dart';

class SearchMovieResultScreen extends StatelessWidget {
  const SearchMovieResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchMovieProvider>(builder: (context, provider, child) {
      return ScaffoldWidget(
          useAppbar: false,
          backgroundColor: const Color(0xFFF6F6FA),
          child: Container(
        color: white,
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.50, color: Color(0xFFEFEFEF)),
                      ),
                    ),
                    child: Row(
                      children: [
                        const DynamicHorizontalSpace(20),
                        InkWell(
                            onTap: () {
                              NavigationService.pop();
                            },
                            child: const Icon(Icons.arrow_back_ios)),
                        const DynamicHorizontalSpace(20),
                        Text(
                          '${provider.filterMovies.length} Results Found',
                          style: const TextStyle(
                            color: Color(0xFF202C43),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.25,
                          ),
                        )
                      ],
                    ),
                  ),
                  const DynamicVerticalSpace(5),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  ))
                ],
              ),
            ),
          ));
    });
  }
}
