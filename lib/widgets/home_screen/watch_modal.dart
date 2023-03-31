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
    var permission =
        await Provider.of<WatchDataProvider>(context, listen: false)
            .getPermission();

    if (permission) {
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
                  'Device successfully connected!',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset('assets/watch.png'),
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
        'subtitle': 'Connect to Samsung Health'
      },
      {
        'title': 'Garmin',
        'imagePath': 'assets/garmin.png',
        'subtitle': 'Login to your garmin account'
      },
      {
        'title': 'Fitbit',
        'imagePath': 'assets/fitbit.png',
        'subtitle': 'Login to your fitbit account'
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
