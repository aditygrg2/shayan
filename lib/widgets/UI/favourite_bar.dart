import 'package:flutter/material.dart';

class FavouriteBar extends StatefulWidget {
  bool isLiked = false;
  @override
  State<FavouriteBar> createState() => _FavouriteBarState();
}

class _FavouriteBarState extends State<FavouriteBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                widget.isLiked
                    ? Icons.favorite
                    : Icons.favorite_outline_rounded,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close_rounded, color: Colors.black)),
        ],
      ),
    );
  }
}
