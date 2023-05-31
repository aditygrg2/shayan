import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/article.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/loadingStateCreator.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class ArticlesScreen extends StatelessWidget {
  static String routeName = '/articles';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: "Articles",
          ),
          FutureBuilder(
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: LoadingStateCreator(),
                );
              }
              if (snapshot.data?.exists == false) {
                return FutureBuilder(
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: LoadingStateCreator(),
                      );
                    }
                    return Column(
                      children:
                          (snapshot.data?.data()!['article'] as List<dynamic>)
                              .map(
                        (e) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Article(
                              image: e['image'],
                              name: e['title'],
                              description: e['description'],
                            ),
                          );
                        },
                      ).toList(),
                    );
                  },
                  future: FirebaseFirestore.instance
                      .collection('article')
                      .doc("healthy")
                      .get(),
                );
              }
              if (snapshot.data?.get('diseaseType') == 'sleep deprivation') {
                return FutureBuilder(
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: LoadingStateCreator(),
                      );
                    }
                    return Column(
                      children:
                          (snapshot.data?.data()!['article'] as List<dynamic>)
                              .map(
                        (e) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Article(
                              image: e['image'],
                              name: e['title'],
                              description: e['description'],
                            ),
                          );
                        },
                      ).toList(),
                    );
                  },
                  future: FirebaseFirestore.instance
                      .collection('article')
                      .doc("sleep deprivation")
                      .get(),
                );
              }
              if (snapshot.data?.get('diseaseType') == 'apnea') {
                return FutureBuilder(
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: LoadingStateCreator(),
                      );
                    }

                    return Column(
                      children:
                          (snapshot.data?.data()!['article'] as List<dynamic>)
                              .map(
                        (e) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Article(
                              image: e['image'],
                              name: e['title'],
                              description: e['description'],
                            ),
                          );
                        },
                      ).toList(),
                    );
                  },
                  future: FirebaseFirestore.instance
                      .collection('article')
                      .doc("apnea")
                      .get(),
                );
              }
              if (snapshot.data?.get('diseaseType') == 'isnsomia') {
                return FutureBuilder(
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: LoadingStateCreator(),
                      );
                    }
                    return Column(
                      children:
                          (snapshot.data?.data()!['article'] as List<dynamic>)
                              .map(
                        (e) {
                          return Container(
                              padding: const EdgeInsets.all(10),
                              child: Article(
                                  image: e['image'],
                                  name: e['title'],
                                  description: e['description']));
                        },
                      ).toList(),
                    );
                  },
                  future: FirebaseFirestore.instance
                      .collection('article')
                      .doc("isnsomia")
                      .get(),
                );
              }

              return FutureBuilder(
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: LoadingStateCreator(),
                    );
                  }
                  return Column(
                    children:
                        (snapshot.data?.data()!['article'] as List<dynamic>)
                            .map(
                      (e) {
                        return Container(
                            padding: const EdgeInsets.all(10),
                            child: Article(
                                image: e['image'],
                                name: e['title'],
                                description: e['description']));
                      },
                    ).toList(),
                  );
                },
                future: FirebaseFirestore.instance
                    .collection('article')
                    .doc("healthy")
                    .get(),
              );
            },
            future: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .get(),
          ),
        ],
      ),
    );
  }
}
