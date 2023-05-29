import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';

class WatchCompanyProvider extends StatelessWidget {
  final String? title;
  final String? imagePath;
  final String? subtitle;
  void Function()? onPressed;

  WatchCompanyProvider({
    this.title,
    this.imagePath,
    this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTap: onPressed,
        child: ListTile(
          splashColor: Theme.of(context).canvasColor,
          leading: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: ImageCacher(
              imagePath: imagePath,
              fit: BoxFit.fitHeight,
            ),
          ),
          title: Text(title!),
          subtitle: Text(subtitle!),
        ),
      ),
    );
  }
}
