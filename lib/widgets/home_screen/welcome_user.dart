import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WelcomeUser extends StatelessWidget {
  String user = 'Ronaldo';

  String greeting = 'Good Morning,';
  String qoute = "Hope you had a restful night's sleep!";
  String animation = 'dummy animation';
  //one Animation according to day night
  // WelcomeUser(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Center(
              child: Image.network(
                  "https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg",
                  width: double.infinity,
                  fit: BoxFit.fill)),
          Positioned(
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                  style: Theme.of(context).textTheme.headlineLarge, greeting),
            ),
            top: 0,
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(style: Theme.of(context).textTheme.headlineSmall, user),
            ),
            top: 40,
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
              qoute,
            )),
            bottom: 0,
          ),
        ],
      ),
    );
  }
}
