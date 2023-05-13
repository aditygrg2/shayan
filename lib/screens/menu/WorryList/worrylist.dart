import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/menu/WorryList/Steps/step_one.dart';
import 'package:night_gschallenge/screens/menu/WorryList/Steps/step_three.dart';
import 'package:night_gschallenge/screens/menu/WorryList/Steps/step_two.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/menuHeroImage.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class Worrylist extends StatefulWidget {
  static const routeName = 'menu/worrylist';

  @override
  State<Worrylist> createState() => _WorrylistState();
}

class _WorrylistState extends State<Worrylist> {
  final List<String> _steps = [
    'Adding worries to a list',
    'Distributing worries to solvable or non-solvable',
    'Managing and finding solution to worries',
    'Implementation of solutions'
  ];

  var id = FirebaseAuth.instance.currentUser?.uid;

  int validator = 0;

  void checkValidity() async {
    if (id != null) {
      bool isWorryListOpened = false;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id!)
          .get()
          .then((value) {
        isWorryListOpened = value['isWorryListOpened'];
      });

      if (isWorryListOpened) {
        Navigator.of(context).popAndPushNamed(StepOne.routeName);
      }
    } else {
      setState(() {
        validator = 1;
      });
    }
  }

  @override
  void initState() {
    checkValidity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (validator == 0) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else if (validator == 1) {
      return Scaffold(
          body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: Theme.of(context).canvasColor,
            ),
            child: Column(children: [
              const Text(
                'Worry List',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MenuHeroImage(
                image: 'assets/worry.gif',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'It is not surprising that some of us may use our problem solving skills at the wrong times and places, namely bedtime. We may think about a problem, trying to solve it, but unfortunately, the anxiety caused by the problem will keep us awake. Constructive worry is a method for managing the tendency to worry during that quiet time when sleep is supposed to be taking over.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'This will work in 4 steps :',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ..._steps.map((step) {
                return ListTile(
                  leading: Image.asset('assets/check-mark.png'),
                  title: Text(step),
                );
              }),
            ]),
          ),
          Center(
            child: ElevatedButtonWithoutIcon(
              text: 'Proceed',
              onPressedButton: () async {
                if (id != null) {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(id!)
                      .update({'isWorryListOpened': true});
                }

                Navigator.of(context).pushNamed(StepOne.routeName);
              },
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ));
    }

    return CircularProgressIndicator();
  }
}
