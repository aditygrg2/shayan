import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/main.dart';
import 'package:night_gschallenge/widgets/UI/loadingStateCreator.dart';

class ImageCacher extends StatelessWidget {
  String? imagePath;
  BoxFit fit;
  bool isCanvas;

  ImageCacher({this.imagePath, this.fit = BoxFit.none, this.isCanvas = false});

  @override
  Widget build(BuildContext context) {
    ThemeMode theme = Main.of(context).getTheme();
    return CachedNetworkImage(
      key: ValueKey(imagePath),
      imageUrl: imagePath!,
      placeholder: (context, url) {
        return LoadingStateCreator(
          isCanvas: isCanvas,
        );
      },
      errorWidget: (context, url, error) {
        return Icon(Icons.error);
      },
    );
  }
}
