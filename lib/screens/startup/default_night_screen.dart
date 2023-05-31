import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/main.dart';
import 'package:night_gschallenge/providers/shared_preferences_provider.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:provider/provider.dart';

class DefaultNightScreen extends StatefulWidget {
  const DefaultNightScreen({Key? key}) : super(key: key);
  static const routeName = 'modeSelector';

  @override
  State<DefaultNightScreen> createState() => _DefaultNightScreenState();
}

class _DefaultNightScreenState extends State<DefaultNightScreen> {
  bool chosen1 = false;
  bool chosen2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeScreenText(
            text: "App Personalization",
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Get ready to chill with the cool vibes of Dark Mode or bask in the brightness of Light Mode—your choice!",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CachedNetworkImage(
              imageUrl:
                  "https://cdn.dribbble.com/users/111502/screenshots/4581326/media/e0ecd32f3cc055f4e0702b6171cc6e7b.gif",
              placeholder: (context, url) {
                return Image.asset(
                  'assets/processloading.gif',
                );
              },
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width - 40,
              errorWidget: (context, url, error) {
                return Icon(Icons.error);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: chosen1 ? Colors.amber : null,
                child: IconButton(
                  icon: Icon(
                    Icons.sunny,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    setState(() {
                      chosen1 = true;
                      chosen2 = false;
                    });
                    Provider.of<sharedPreferencesProvider>(context,
                            listen: false)
                        .setValue(
                      {'isModeSet': true, 'mode': 'light'},
                      'launch',
                    );
                  },
                ),
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: chosen2 ? Colors.amber : null,
                child: IconButton(
                  icon: Icon(
                    Icons.dark_mode,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    setState(() {
                      chosen1 = false;
                      chosen2 = true;
                    });
                    Provider.of<sharedPreferencesProvider>(context,
                            listen: false)
                        .setValue(
                            {'isModeSet': true, 'mode': 'dark'}, 'launch');
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButtonWithoutIcon(
                text: "Submit",
                onPressedButton: () {
                  String mode = Provider.of<sharedPreferencesProvider>(context,
                          listen: false)
                      .getValue('launch', 'mode')
                      .toString();
                  if (mode == 'light') {
                    Main.of(context).changeTheme(ThemeMode.light);
                  } else {
                    Main.of(context).changeTheme(ThemeMode.dark);
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
