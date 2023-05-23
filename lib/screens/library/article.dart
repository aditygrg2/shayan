import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/article_viewer.dart';

class Article extends StatelessWidget {
  String image;
  String name;
  String description;
  Article({required this.image, required this.name, required this.description});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ArticleViewer.routeName, arguments: {
          'image': image,
          'title': name,
          'description': description
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              width: 140,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
