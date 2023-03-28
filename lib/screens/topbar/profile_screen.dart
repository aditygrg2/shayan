import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
            profile: false,
          ),
          if (FirebaseAuth.instance.currentUser != null)
            ElevatedButtonWithoutIcon(
              text: 'Logout',
              onPressedButton: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
              },
            ),
          if (FirebaseAuth.instance.currentUser == null)
            Text(
              'Please sign in to see your profile',
            )
        ],
      ),
    );
  }
}
