import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/authentication_provider.dart';
import 'package:provider/provider.dart';

class WelcomeUser extends StatefulWidget {
  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

Widget getStatus(int hours) {
  if (hours > 3 && hours < 15) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: "https://i.ibb.co/jwYkSJH/sun.gif",
        fit: hours >= 20 ? BoxFit.contain : BoxFit.cover,
        placeholder: (context, url) {
          return Image.asset(
            'assets/processloading.gif',
            fit: hours >= 20 ? BoxFit.contain : BoxFit.cover,
          );
        },
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
      ),
    );
  } else if (hours > 15 && hours < 20) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: "https://i.ibb.co/d4YTYn8/good-evening.gif",
        fit: hours >= 20 ? BoxFit.contain : BoxFit.cover,
        placeholder: (context, url) {
          return Image.asset(
            'assets/processloading.gif',
            fit: hours >= 20 ? BoxFit.contain : BoxFit.cover,
          );
        },
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
      ),
    );
  } else {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: "https://i.ibb.co/nBxhtTc/output-onlinegiftools-27.gif",
        fit: hours >= 20 ? BoxFit.contain : BoxFit.cover,
        placeholder: (context, url) {
          return Image.asset(
            'assets/processloading.gif',
            fit: hours >= 20 ? BoxFit.contain : BoxFit.cover,
          );
        },
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
      ),
    );
  }
}

class _WelcomeUserState extends State<WelcomeUser> {
  String quote = "Hope you had a restful night's sleep!";
  bool isLogin = FirebaseAuth.instance.currentUser != null;
  String? userId;

  @override
  Widget build(BuildContext context) {
    var hours = DateTime.now().hour;
    if (isLogin) {
      userId = Provider.of<AuthenticationProvider>(context).getId();
    }
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good ${hours >3 && hours < 15 ? "Morning" : hours>15 && hours<20 ? "Evening" : "Night"}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          if (isLogin)
            Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).unselectedWidgetColor,
              ),
            ),
          getStatus(hours)
        ],
      ),
    );
  }
}
