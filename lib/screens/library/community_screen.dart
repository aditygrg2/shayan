import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/community_post.dart';
import 'package:night_gschallenge/screens/library/community_post.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';

class CommunityScreen extends StatelessWidget {
  static String routeName = '/community-screen';
  
  @override
  Widget build(BuildContext context) {
    final postProvider=Provider.of<CommunityPostPRovider>(context);
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: "Community",
          ),
          ...postProvider.getPosts.map((ele) {
            return CommunityPost(
                description: ele['description'],
                image: ele['image'],
                title: ele['title'],
                name:ele['user'],
                type: ele['type'],
                );
          }).toList(),
        ],
      ),
    );
  }
}
