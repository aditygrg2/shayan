import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/home_screen/watch_company_provider.dart';
import 'package:provider/provider.dart';

class WatchModal extends StatefulWidget {
  @override
  State<WatchModal> createState() => _WatchModalState();
}

class _WatchModalState extends State<WatchModal> {
  bool loading = true;

  void fetchProvider() async {
    var id = FirebaseAuth.instance.currentUser?.uid;
    var permission =
        await Provider.of<WatchDataProvider>(context, listen: false)
            .getPermission();

    if (permission) {
      await FirebaseFirestore.instance.collection('users').doc(id).update({
        'isWatchConnected': true,
      });
      // ignore: use_build_context_synchronously
      showModalBottomSheet(
        backgroundColor: Theme.of(context).primaryColor,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Google Fit successfully connected!',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                    child: Image.asset(
                  'assets/gfit.png',
                  fit: BoxFit.cover,
                )),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Now you will get your sleep details updated automatically. Enjoy sleeping!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButtonWithoutIcon(
                  text: 'Close',
                  onPressedButton: () =>
                      Navigator.of(context).pushNamedAndRemoveUntil(
                    HomeScreen.routeName,
                    ModalRoute.withName(
                      HomeScreen.routeName,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    }
  }

  void providersComingSoon() async {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).primaryColor,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Coming Soon',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/watch.png'),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Thank you for trying out. New providers will be updated soon.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButtonWithoutIcon(
                  text: 'Close',
                  onPressedButton: () =>
                      Navigator.of(context).pop()
                  ),
              ],
            ),
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> watch_list = [
      {
        'title': 'Google Fit',
        'imagePath': 'assets/gfit.png',
        'subtitle': 'Connect to Google Fit via Google Authentication',
        'onPressed': fetchProvider
      },
      {
        'title': 'Samsung Health',
        'imagePath': 'assets/samsunghealth.png',
        'subtitle': 'Connect to Samsung Health',
        'onPressed': providersComingSoon
      },
      {
        'title': 'Garmin',
        'imagePath': 'assets/garmin.png',
        'subtitle': 'Login to your garmin account',
        'onPressed': providersComingSoon
      },
      {
        'title': 'Fitbit',
        'imagePath': 'assets/fitbit.png',
        'subtitle': 'Login to your fitbit account',
        'onPressed': providersComingSoon
      },
    ];
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: Text(
            'Connect your device',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ...watch_list.map((e) {
          return WatchCompanyProvider(
            title: e['title'],
            subtitle: e['subtitle'],
            imagePath: e['imagePath'],
            onPressed: e['onPressed'],
          );
        }).toList(),
        const SizedBox(
          height: 20,
        ),
        ElevatedButtonWithoutIcon(
          text: 'Close',
          onPressedButton: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
