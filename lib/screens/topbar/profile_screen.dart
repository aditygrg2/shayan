import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/screens/startup/splash_screen.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class ProfileInfo extends StatelessWidget {
  String attribute, value;
  ProfileInfo(this.attribute, this.value);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            attribute,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Container(
          child: Text(""),
          height: 1,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
        )
      ]),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  Map<String, String> profile = {
    "Name": "Roanldo",
    "Email ID": "ronaldo@gmail.com",
    "Age": "15 years",
    "Weight": "70 Kg",
    "Height": "190 cm",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              TopRow(
                back: true,
                profile: false,
              ),
              Positioned(
                child: Container(
                  child: Text(""),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.only(
                         
                          bottomLeft: Radius.circular(800),
                          bottomRight: Radius.circular(800))),
                ),
              ),
              Positioned(top: 10,left: MediaQuery.of(context).size.width/2-90,child: Container(child: Icon(Icons.person_outline_sharp,color: Colors.black,size: 170,),))
            ],
          ),
          if (FirebaseAuth.instance.currentUser == null)
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(padding: const EdgeInsets.all(10),child: Text("Please Login/SignUp",style: Theme.of(context).textTheme.headlineLarge,),),
                  SizedBox(height: 10,),
                ElevatedButtonWithoutIcon(text: "Login",onPressedButton: (){
                    Navigator.of(context).popUntil((route) => route=="");
                    Navigator.of(context).pushNamed(SplashScreen.routeName);
                  },)
                ],
              ),
            ),
          if (FirebaseAuth.instance.currentUser != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...profile.entries.map((e) {
                  return ProfileInfo(e.key, e.value);
                }).toList(),
                Center(
                  child: ElevatedButtonWithoutIcon(
                    text: 'Logout',
                    onPressedButton: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context)
                          .popUntil((route) => route=="");
                      Navigator.of(context).pushNamed(SplashScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
