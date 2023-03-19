import 'package:flutter/material.dart';

class LightFeedBack extends StatelessWidget {
  final String imagePath;
  final String title;
  final String feedback;
  const LightFeedBack(
      {required this.imagePath, required this.title, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: null,
      child: Card(
          color: const Color.fromARGB(255, 225, 236, 232),
          child: Column(
            children: [
              Image.asset(imagePath),
              const SizedBox(height: 20, width: double.infinity),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ReadexPro'),
                  ),
                ),
              ),
              const SizedBox(height: 20, width: double.infinity),
              FractionallySizedBox(
                widthFactor: 0.5,
                child: Text(
                  feedback,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 64, 64, 64),
                      fontFamily: 'ReadexPro'),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20, width: double.infinity),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Material(
                  elevation: 10.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 250, 195, 68),
                        elevation: 3),
                    onPressed: () {},
                    child: const Text(
                      'Remeasure',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
