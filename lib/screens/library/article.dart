import 'package:flutter/material.dart';


class Article extends StatelessWidget {
  String image;
  String name;
  String description;
  Article({required this.image, required this.name, required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
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
                  child: Text(name,style: Theme.of(context).textTheme.headlineLarge,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(description,style: Theme.of(context).textTheme.bodySmall,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
