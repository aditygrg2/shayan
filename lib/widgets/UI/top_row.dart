import 'package:flutter/material.dart';
import 'package:night_gschallenge/main.dart';
import 'package:night_gschallenge/screens/store/store_screen.dart';
import 'package:night_gschallenge/screens/topbar/chat_screen.dart';
import 'package:night_gschallenge/screens/topbar/profile_screen.dart';


class TopRow extends StatefulWidget {
  final bool? back;
  final bool? profile;

  TopRow({this.back = false, this.profile = true});

  @override
  State<TopRow> createState() => _TopRowState();
}

class _TopRowState extends State<TopRow> {
  @override
  Widget build(BuildContext context) {
    final brightness = Main.of(context).getTheme();
    var notificationBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(
        top: notificationBarHeight,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: widget.back == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        children: [
          if (widget.back!)
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 35,
                  ),
                ),
              ],
            ),
          if (widget.back!)
            Row(
              children: [
                if (widget.profile!)
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName);
                    },
                    icon: Icon(
                      Icons.person,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ChatScreen.routeName);
                  },
                  icon: Icon(
                    Icons.message_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
          if (!widget.back! && widget.profile!)
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ProfileScreen.routeName);
              },
              icon: Icon(
                Icons.person,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          if (!widget.back!)
            IconButton(onPressed: () {
              Navigator.of(context).pushNamed(StoreScreen.routeName);
            }, icon: Icon(Icons.shop)),
          if (!widget.back!)
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ChatScreen.routeName);
              },
              icon: Icon(
                Icons.message_rounded,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          if (!widget.back!)
            IconButton(
              onPressed: () {
                setState(() {
                  if (brightness == ThemeMode.dark) {
                    Main.of(context).changeTheme(ThemeMode.light);
                  } else {
                    Main.of(context).changeTheme(ThemeMode.dark);
                  }
                });
              },
              icon: brightness == ThemeMode.dark
                  ? Icon(Icons.light_mode)
                  : Icon(Icons.dark_mode),
            ),
        ],
      ),
    );
  }
}
