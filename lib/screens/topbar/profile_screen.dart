import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';


class ProfileInfo extends StatelessWidget{
  String attribute,value;
  ProfileInfo(this.attribute,this.value);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Container(padding: EdgeInsets.all(10),child: Text(attribute,style: Theme.of(context).textTheme.bodySmall,),),
        Container(padding: EdgeInsets.all(10),child: Text(value,style: Theme.of(context).textTheme.bodyMedium,),),
      ]),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  Map<String,String>profile=
    {
      "name":"Roanldo",
      "Email ID":"ronaldo@gmail.com",
      "Age":"15 years",
      "Weight":"70 Kg",
      "Height":"190 cm",
    };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
            profile: false,
          ),
          if (FirebaseAuth.instance.currentUser == null)
            Text(
              'Please sign in to see your profile',
            ),
          if (FirebaseAuth.instance.currentUser != null)
            Column(
              children: [
                ElevatedButtonWithoutIcon(
              text: 'Logout',
              onPressedButton: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
              },
            ),
              ],
            ),

        ],
      ),
    );
  }
}
