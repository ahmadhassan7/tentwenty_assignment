import 'package:flutter/material.dart';

class MovieDetailTagWidget extends StatelessWidget {
  const MovieDetailTagWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          height: 1.67,
        ),
      ),
    );
  }
}
