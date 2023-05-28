import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/main.dart';

class ImageCacher extends StatelessWidget {
  String? imagePath;
  

  ImageCacher({this.imagePath});

  @override
  Widget build(BuildContext context) {
    ThemeMode theme = Main.of(context).getTheme();
    return CachedNetworkImage(
      imageUrl: imagePath!,
      placeholder: (context, url) {
        return Image.asset(
          theme == ThemeMode.light ? 'assets/processloading.gif' : 'assets/ln.gif',
        );
      },
      errorWidget: (context, url, error) {
        return Icon(Icons.error);
      },
    );
  }
}
