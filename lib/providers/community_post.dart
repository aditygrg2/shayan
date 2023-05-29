import 'package:flutter/material.dart';

class CommunityPostPRovider extends ChangeNotifier {
  List<Map<dynamic, dynamic>> posts = [
    {
      "title": "The art of Living India",
      "image": "https://i.ibb.co/Z2621Vh/community-image-1.jpg",
      "description":
          "6 new and easy ways to calm the mind.We can learn to calm our minds to be happy with ourselves and friendly with others. This will wean you from the complex turns and twists of your mind...",
      "user": "Ronaldo",
      "type": "artcle"
    },
    {
      "title": "Sleep Difficulties ",
      "image": "https://i.ibb.co/BPS357P/community-image-2.jpg",
      "description":
          "Numerous factors can contribute to sleeping difficulty. A person's lifestyle, sleeping habits, and health status may all play a role...",
      "user": "Laria",
      "type": "article"
    },
    {
      "title": "Top Causes of Nighttime Restlessness",
      "image": "https://i.ibb.co/GF50ZwN/community-image-3.jpg",
      "description":
          "Restless legs syndrome (RLS) is a persistent need to move your legs due to cramping or unpleasant tingling, burning, or creeping sensations which can often be relieved by moving around or getting out of bed. Doctors don't know what causes RLS, but they suspect it may be hereditary..",
      "user": "James",
      "type": "article"
    },
  ];

  List<dynamic> get getPosts {
    return [...posts];
  }
}
