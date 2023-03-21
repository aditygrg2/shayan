import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/light_provider.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/Measuring_light.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/lightModal.dart';
import 'package:provider/provider.dart';

class LightPollution extends StatefulWidget {
  static const routeName = 'menu/light';

  @override
  _LightPollutionState createState() => _LightPollutionState();
}

class _LightPollutionState extends State<LightPollution> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool state = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<LightProvider>(context, listen: false).stopListening();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(text: 'Light Pollution'),

          Container(
            margin: EdgeInsets.all(40),
            height: 200,
            child: Image.asset(
              'assets/scanload.gif',
              fit: BoxFit.contain,
            ),
          ),

          // Informative Text
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.lightbulb_circle_rounded, size: 30),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: (width - 40) * 0.9,
                  child: Text(
                    'Use your device to measure your bedroom\'s light intensity level, try not to pass the 20 lux mark',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )
              ],
            ),
          ),

          // Last Checked Text
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 10),
            child: Center(
              child: Text('Last Checked: x minutes ago'),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          if (!state)
            Center(
              child: ElevatedButtonWithoutIcon(
                text: "Measure",
                onPressedButton: () {
                  if (state == true) {
                    null;
                  } else {
                    Provider.of<LightProvider>(context, listen: false)
                        .initPlatformState();
                    setState(() {
                      state = true;
                    });
                  }
                },
              ),
            ),

          Consumer<LightProvider>(
            builder: (context, value, child) {
              if (value.state && !value.success) {
                return MeasuringLight();
              } else if (value.success == true && value.state == false) {
                return Center(
                  child: ElevatedButtonWithoutIcon(
                    onPressedButton: () {
                      setState(() {
                        state = false;
                      });
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return LightModal();
                        },
                      );
                    },
                    text: 'Results',
                  ),
                );
              } else {
                return Card();
              }
            },
          )
        ],
      ),
    );
  }
}
