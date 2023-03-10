import 'package:flutter/material.dart';

class BlockCards extends StatelessWidget {
  final double? height;
  final Widget? child;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  BlockCards({this.height, this.child, this.backgroundColor, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5.0),
        padding: padding,
        decoration: BoxDecoration(
          /**Define final theme properties of all boxes here! */
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        child: child,
      );
  }
}
