import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinereserve/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:cinereserve/controller/general_provider.dart';
import 'package:cinereserve/services/navigation_service.dart';
import 'package:cinereserve/view/movie_detail/movie_detail_screen.dart';
import 'package:cinereserve/view/search_movie/search_movie/search_movie_screen.dart';
import 'package:cinereserve/widgets/app_widgets/scaffold_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Watch extends StatefulWidget {
  const Watch({super.key});

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  var isSelected = false;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return const SearchMovieScreen();
    }
    var size = MediaQuery.of(context).size;

    return ScaffoldWidget(
      useAppbar: false,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Watch',
                        style: TextStyle(
                          color: Color(0xFF202C43),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isSelected = true;
                            });
                          },
                          child: const Icon(Icons.search))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Consumer<GeneralProvider>(
                    builder: (context, provider, child) {
                  if (provider.upcommingMovieModel == null) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.blueGrey,
                      child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 220,
                              alignment: Alignment.bottomLeft,
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 20, right: 20, top: 10),
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: size.width,
                                  ),
                                  Container(
                                    height: 220,
                                    alignment: Alignment.bottomLeft,
                                    decoration: ShapeDecoration(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.black.withOpacity(0),
                                          Colors.black
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 20,
                                    left: 20,
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: provider.upcommingMovieModel!.results.length,
                        itemBuilder: (context, index) {
                          var movie =
                              provider.upcommingMovieModel!.results[index];
                          return InkWell(
                            onTap: () {
                              NavigationService.push(MovieDetailScreen(
                                movie: movie,
                              ));
                            },
                            child: Container(
                              height: 220,
                              alignment: Alignment.bottomLeft,
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 20, right: 20, top: 10),
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: size.width,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
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
                                  Container(
                                    height: 220,
                                    alignment: Alignment.bottomLeft,
                                    decoration: ShapeDecoration(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.black.withOpacity(0),
                                          Colors.black
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 20,
                                    child: Text(
                                      movie.title.length < 30
                                          ? movie.title
                                          : '${movie.title.substring(0, 30)} ...',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
              ),
              const SizedBox(
                height: 75,
              )
            ],
          ),
        ),
      ),
    );
  }
}
