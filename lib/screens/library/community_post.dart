import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/article.dart';

class CommunityPost extends StatefulWidget {

  
  bool isLiked=false;
  String name,description,image,title,type;
  CommunityPost({required this.description,required this.image,required this.name,required this.title,required this.type});
  @override
  State<CommunityPost> createState() => _CommunityPostState();
}

class _CommunityPostState extends State<CommunityPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // decoration: BoxDecoration(color: Color.fromRGBO(143, 227, 221, 1),borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(children: [Container(child: Icon(Icons.person)),
              Container(child: Text(widget.name,style: Theme.of(context).textTheme.headlineMedium,),),],),
              Container(child: Text("shared an ${widget.type}",style: Theme.of(context).textTheme.bodySmall,),)
          
            ],),
          ),
          Container(decoration: BoxDecoration(color: Color.fromRGBO(143, 227, 221, 1),borderRadius: BorderRadius.circular(12)),child: Article(name: widget.title ,description: widget.description,image: widget.image),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child: Row(
                children: [
                  IconButton(icon: Icon(widget.isLiked? Icons.thumb_up:Icons.thumb_up_alt_outlined,color: Colors.black,),onPressed: (){
                    setState(() {
                      widget.isLiked=!widget.isLiked;
                    });
                  }),
                  Container(child: Text('Like'),),
                ],
              ),),
              Container(child: Row(
                children: [
                  IconButton(icon: Icon( Icons.comment,color: Colors.black,),onPressed: null,),
                  Container(child: Text('comment'),),
                ],
              ),),
            ],
          ),
          Container(child: Text(""),decoration: BoxDecoration(color: Colors.black),height: 1,width: double.infinity,),

        ],
      ),
    );
  }
}