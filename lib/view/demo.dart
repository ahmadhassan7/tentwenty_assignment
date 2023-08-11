import 'package:flutter/material.dart';

class SomeScreen extends StatefulWidget {
  const SomeScreen({super.key});

  @override
  SomeScreenState createState() => SomeScreenState();
}

class SomeScreenState extends State<SomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 220,
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 3,
              child: Container(
                color: Colors.cyanAccent,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GridView.count(
                  crossAxisCount: 10,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: List<Widget>.generate(
                    50,
                    (index) => Container(
                      width: 10,
                      height: 10,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              height: double.infinity,
              width: double.infinity,
              child: const Text("HELLO"),
            ),
          )
        ],
      ),
    );
  }
}
