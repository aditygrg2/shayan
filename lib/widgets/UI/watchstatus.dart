import 'package:flutter/material.dart';

class WatchStatus extends StatelessWidget {
  const WatchStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        children: [
          Image.asset('assets/gfit.png'),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text('Google Fit connected'),
          ),
        ],
      ),
    );
  }
}
