import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class ArticleViewer extends StatelessWidget {
  static String routeName = '/article-view';
  const ArticleViewer();

  @override
  Widget build(BuildContext context) {
    final article =
        ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
print(article);

    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: 'Article ',
          ),
          Container(child: Text(article['title'] as String,style:const TextStyle(fontSize: 25),),padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),),
         if(article.containsKey("image") && article['image']!=null) Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                article['image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              article['description'] as String,
              style: const TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
