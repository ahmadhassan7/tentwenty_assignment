import 'package:flutter/material.dart';

class SearchMovieWidget extends StatelessWidget {
  const SearchMovieWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 100,
      margin: const EdgeInsets.all(5),
      alignment: Alignment.bottomLeft,
      decoration: ShapeDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill),
        color: Colors.black.withOpacity(0.30000001192092896),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 10),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
