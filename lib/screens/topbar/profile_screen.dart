import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:night_gschallenge/screens/startup/splash_screen.dart';
import 'package:night_gschallenge/widgets/UI/ListTileIconCreators.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';

class ProfileInfo extends StatelessWidget {
  String attribute, value;
  ProfileInfo(this.attribute, this.value);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            attribute,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Container(
          child: const Text(""),
          height: 1,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
          ),
        )
      ]),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  var currentUser = FirebaseAuth.instance.currentUser;
  static const routeName = '/profile';
  String version = "v1.0";

  Map<String, dynamic> profile = {
    "Name": FirebaseAuth.instance.currentUser?.displayName,
    "Email ID": FirebaseAuth.instance.currentUser?.email,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  child: const Text(""),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(800),
                          bottomRight: Radius.circular(800))),
                ),
              ),
              TopRow(
                back: true,
                profile: false,
              ),
              Positioned(
                top: 10,
                left: MediaQuery.of(context).size.width / 2 - 90,
                child: Container(
                  child: Icon(
                    Icons.person_outline_sharp,
                    color: Theme.of(context).iconTheme.color,
                    size: 170,
                  ),
                ),
              )
            ],
          ),
          if (currentUser == null)
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Please Login/SignUp",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButtonWithoutIcon(
                    text: "Login",
                    onPressedButton: () {
                      Navigator.of(context).popUntil(
                        (route) => route == "",
                      );
                      Navigator.of(context).pushNamed(SplashScreen.routeName);
                    },
                  )
                ],
              ),
            ),
          if (currentUser != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...profile.entries.map((e) {
                  return ProfileInfo(e.key, e.value);
                }).toList(),
                ListTileIconCreators(
                  title: 'Logout',
                  icon: Icons.logout,
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).popUntil((route) => route == "");
                    Navigator.of(context).pushNamed(SplashScreen.routeName);
                  },
                )
              ],
            ),
          if (currentUser != null)
            ListTileIconCreators(
              title: 'Revoke Google Fit ID',
              onTap: () async {
                await Provider.of<WatchDataProvider>(context, listen: false)
                    .revoke();

                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(currentUser?.uid)
                    .update({
                  'isWatchConnected': false,
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Your account is successfully reset"),
                  ),
                );
              },
              icon: Icons.signal_cellular_no_sim_sharp,
            ),
        ],
      ),
    );
  }
}
