import 'package:flutter/material.dart';

class FavouriteBar extends StatefulWidget {
  bool isLiked = false;
  @override
  State<FavouriteBar> createState() => _FavouriteBarState();
}

class _FavouriteBarState extends State<FavouriteBar> {
  @override
  Widget build(BuildContext context) {
    var notificationBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(20, notificationBarHeight, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.isLiked = !widget.isLiked;
              });
            },
            icon: Icon(
              widget.isLiked ? Icons.favorite : Icons.favorite_outline_rounded,
              color: Theme.of(context).iconTheme.color,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close_rounded,
              color: Theme.of(context).iconTheme.color,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
