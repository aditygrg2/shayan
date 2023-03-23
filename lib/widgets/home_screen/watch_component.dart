import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';

class WatchComponent extends StatefulWidget {
  const WatchComponent({super.key});

  @override
  State<WatchComponent> createState() => _WatchComponentState();
}

class _WatchComponentState extends State<WatchComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          HomeScreenText(
            text: 'Connect your device',
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            decoration: BoxDecoration(color: Color.fromRGBO(143, 227, 221, 1),borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset('watch.png'),
                    ),
                    Container(
                      child: Text(
                        'Make sleep tracking simple',
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Text(
                      'Let’s get your wearable connected. With a little bit of magic, your sleep data will automatically be pulled into your sleep tracker'),
                ),
                SizedBox(height: 6,),
                ElevatedButtonWithoutIcon(
                  onPressedButton: (){
                    setState(() {
                      
                    });
                  },
                  text: 'get Synced',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
