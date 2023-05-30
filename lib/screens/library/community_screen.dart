import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/community_post.dart';
import 'package:night_gschallenge/screens/library/community_post.dart';
import 'package:night_gschallenge/screens/startup/login_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/loadingStateCreator.dart';
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
                    String title = "", description = "", image = "";
                    final formKey = GlobalKey<FormState>();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          body: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 15),
                            child: Center(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    TopRow(back: true,),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: const Text(
                                        "Create Post",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Post Title'),
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter title of Post';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        title = value!;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Post Description'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Description of your Post';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        description = value!;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Image(URL)'),
                                      validator: (value) {
                                        // if (value!.isEmpty) {
                                        //   return 'Please enter URL of the Image';
                                        // }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        image = value!;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          String? user = FirebaseAuth.instance
                                              .currentUser?.displayName;
                                          if (user == null) {
                                            Navigator.of(context)
                                                .popUntil((route) => true);
                                            Navigator.of(context).pushNamed(
                                                LoginScreen.routeName);
                                          } else {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              builder: (context) {
                                                return Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  child: LoadingStateCreator(),
                                                );
                                              },
                                            );
                                            
                                            FirebaseFirestore.instance
                                                .collection("community")
                                                .add(image!=""?{
                                              'user': user,
                                              'type': 'article',
                                              'title': title,
                                              'description': description,
                                              'image': image,
                                              'createdAt': Timestamp.now()
                                            }:{
                                              'user': user,
                                              'type': 'article',
                                              'title': title,
                                              'description': description,
                                              'createdAt': Timestamp.now()
                                            }).then((value) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Container(
                                                  child: const Text(
                                                      "Successfully created Post"),
                                                ),
                                              ));
                                              Navigator.of(context).popUntil(
                                                  ModalRoute.withName(
                                                      CommunityScreen
                                                          .routeName));
                                            });
                                          }
                                        }
                                      },
                                      child: const Text('Submit'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).iconTheme.color,
                    size: 32,
                  ))
            ],
          ),
          FutureBuilder(
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LoadingStateCreator();
              }
              final docs = snapshot.data?.docs;
              if (docs!.isEmpty) {
                return Container(
                  width: double.infinity,
                  height: 500,
                  padding: const EdgeInsets.all(15),
                  child: const Center(
                      child: Text(
                    "No Posts Available",
                    style: TextStyle(fontSize: 22),
                  )),
                );
              }
              return Column(
                children: [
                  ...docs.map((ele) {
                    return CommunityPost(
                      docId: ele.id,
                      description: ele['description'],
                      image:ele.data().containsKey("image")? ele['image']:null,
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
