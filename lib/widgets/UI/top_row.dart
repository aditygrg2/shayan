import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  final bool? back;

  TopRow({this.back = false});

  @override
  Widget build(BuildContext context) {
    var notificationBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(
          top: notificationBarHeight, left: 10, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: back==true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
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
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.message_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          if (!back!)
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          if (!back!)
          IconButton(
            onPressed: null,
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
