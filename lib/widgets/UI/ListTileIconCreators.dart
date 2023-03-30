import 'package:flutter/material.dart';

class ListTileIconCreators extends StatelessWidget {
  void Function()? onTap;
  String? title;
  IconData? icon;
  ListTileIconCreators({this.onTap, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title!,
        ),
        leading: Icon(
          icon!,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
