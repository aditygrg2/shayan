import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/topbar/chat_screen.dart';
import 'package:night_gschallenge/screens/topbar/profile_screen.dart';

class TopRow extends StatelessWidget {
  final bool? back;
  final bool? profile;

  TopRow({this.back = false, this.profile = true});

  @override
  Widget build(BuildContext context) {
    var notificationBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(
        top: notificationBarHeight,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: back == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        children: [
          if (back!)
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ],
            ),
          if (back!)
            Row(
              children: [
                if(profile!)
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed(ProfileScreen.routeName);
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed(ChatScreen.routeName);
                  },
                  icon: Icon(
                    Icons.message_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          if (!back! && profile!)
            IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed(ProfileScreen.routeName);
              },
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          if (!back!)
            IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed(ChatScreen.routeName);
              },
              icon: Icon(
                Icons.message_rounded,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }
}
