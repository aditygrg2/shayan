import 'dart:html';

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
      padding: EdgeInsets.all(10),
      height: 200,
      child: Stack(
        children: [
          Center(child: Image.network("https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg",width: double.infinity,fit: BoxFit.fill)),
          // Positioned(child: Image.network("https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg"),width: 500,height: 500,),
          Positioned(child: Text(style: Theme.of(context).textTheme.headlineLarge,greeting),top: 0,),
          Positioned(child: Text(style: Theme.of(context).textTheme.headlineSmall,user),top: 30,),
          Positioned(child: Center(child: Text(qoute,)),bottom: 0,),
        ],
      ),
    );
  }
}
