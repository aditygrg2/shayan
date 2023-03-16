import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    var notificationBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: notificationBarHeight, left: 10, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
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
    );
  }
}
