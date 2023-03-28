import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:night_gschallenge/providers/authentication_provider.dart';
import 'package:provider/provider.dart';

class WelcomeUser extends StatefulWidget {
  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser>
    with TickerProviderStateMixin {
  String greeting = 'Good Morning,';

  String quote = "Hope you had a restful night's sleep!";

  String animation = 'dummy animation';

  bool isLogin = FirebaseAuth.instance.currentUser!=null;
  String? userId;

  // one Animation according to day night
  @override
  Widget build(BuildContext context) {
    if(isLogin){
      userId = Provider.of<AuthenticationProvider>(context).getId();
    }
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
          const SizedBox(
            height: 10,
          ),
          if (isLogin)
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(userId)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data?['name'],
                    style: TextStyle(fontSize: 25),
                  );
                }

                return const Text(
                  'User',
                  style: TextStyle(fontSize: 25),
                );
              },
            ),
          Container(
            height: 150,
            width: double.infinity,
            child: Image.asset(
              'assets/sun.gif',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
