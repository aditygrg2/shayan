import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WelcomeUser extends StatefulWidget {
  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser>
    with TickerProviderStateMixin {
  String user = 'Ronaldo';

  String greeting = 'Good Morning,';

  String quote = "Hope you had a restful night's sleep!";

  String animation = 'dummy animation';

  // one Animation according to day night
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            greeting,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            user,
            style: TextStyle(fontSize: 25),
          ),
          Container(
            height: 150,
            width: double.infinity,
              child: Image.asset(
            'assets/sun.gif',
            fit: BoxFit.cover,
          ))
        ],
      ),
    );
  }
}
