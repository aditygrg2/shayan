import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:night_gschallenge/widgets/home_screen/watch_modal.dart';

class WatchComponent extends StatefulWidget {
  const WatchComponent({super.key});

  @override
  State<WatchComponent> createState() => _WatchComponentState();
}

class _WatchComponentState extends State<WatchComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          HomeScreenText(
            text: 'Connect your device',
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: Image.asset('assets/watch.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        'Make Sleep Tracking Simple',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Let\'s get your wearable connected. With a little bit of magic, your sleep data will automatically be pulled into your sleep tracker',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButtonWithoutIcon(
                  onPressedButton: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          child: Container(
                              margin: EdgeInsets.all(15),
                              child: Scaffold(body: WatchModal())),
                        );
                      },
                    );
                  },
                  text: 'Fetch data from your watch',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
