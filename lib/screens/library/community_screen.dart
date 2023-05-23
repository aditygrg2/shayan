import 'package:cloud_firestore/cloud_firestore.dart';
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
    final postProvider = Provider.of<CommunityPostPRovider>(context);
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeScreenText(
                text: "Community",
              ),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 600,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: Text(
                                   "Create Post",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: const Text(
                                      "Enter Title of the post"),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: TextField(
                                    // controller: timeController,
                                    key: const ValueKey('1'),
                                    onTap: () {
                                    
                                    },
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: const Text("Enter Task Name"),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: TextField(
                                    // controller: taskController,
                                    key: const ValueKey('2'),
                                  ),
                                ),
                                Center(child: Text("")),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 32,
                  ))
            ],
          ),
          FutureBuilder(
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).secondaryHeaderColor),
                );
              }
              final docs = snapshot.data?.docs;
              if (docs!.isEmpty) {
                return Container(
                  width: double.infinity,
                  height: 500,
                  padding: const EdgeInsets.all(15),
                  child: Center(
                      child: const Text(
                    "No Posts Available",
                    style: TextStyle(fontSize: 22),
                  )),
                );
              }
              return Column(
                children: [
                  ...docs.map((ele) {
                    return CommunityPost(
                      description: ele['description'],
                      image: ele['image'],
                      title: ele['title'],
                      name: ele['user'],
                      type: ele['type'],
                      episode: ele.data().containsKey('episodes')
                          ? ele.get('episodes')
                          : null,
                    );
                  }).toList(),
                ],
              );
            },
            future: FirebaseFirestore.instance.collection("community").get(),
          ),
        ],
      ),
    );
  }
}
