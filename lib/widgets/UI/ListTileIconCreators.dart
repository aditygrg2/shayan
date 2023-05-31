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
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 1
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10),),
          ),
          child: ListTile(
            title: Text(
              title!,
            ),
            leading: Icon(
              icon!,
              color: Theme.of(context).iconTheme.color,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
