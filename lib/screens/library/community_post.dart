import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/article_viewer.dart';
import 'package:night_gschallenge/screens/library/podcast_play_screen.dart';
import 'package:night_gschallenge/widgets/UI/loadingStateCreator.dart';

class CommunityPost extends StatefulWidget {
  bool isLiked = false;
  bool showComments = false;
  String name, description, title, type, docId, comment = "";
  TextEditingController controller = TextEditingController();
  String? image;
  List<dynamic>? episode = null;
  CommunityPost(
      {required this.description,
      required this.image,
      required this.name,
      required this.title,
      required this.type,
      required this.docId,
      this.episode});
  @override
  State<CommunityPost> createState() => _CommunityPostState();
}

class _CommunityPostState extends State<CommunityPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(child: const Icon(Icons.person)),
                    Container(
                      child: Text(
                        widget.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    "shared an ${widget.type}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.episode == null) {
                Navigator.of(context).pushNamed(ArticleViewer.routeName,
                    arguments: {
                      'image': widget.image,
                      'title': widget.title,
                      'description': widget.description
                    });
              } else {
                Navigator.of(context)
                    .pushNamed(PodcastScreenPlay.routeName, arguments: {
                  'image': widget.image,
                  'title': widget.title,
                  'description': widget.description,
                  'episodes': widget.episode
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    if (widget.image != null)
                      Container(
                        width: 115,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.image as String,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              widget.title,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              widget.description,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          widget.isLiked
                              ? Icons.thumb_up
                              : Icons.thumb_up_alt_outlined,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.isLiked = !widget.isLiked;
                          });
                        }),
                    Container(
                      child: const Text('Like'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.comment,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.showComments = !widget.showComments;
                          });
                        }),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.showComments = !widget.showComments;
                        });
                      },
                      child: Container(
                        child: const Text('Comment'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (widget.showComments)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return LoadingStateCreator();
                    }
                    final doc = snapshot.data?.docs;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...doc!.map((e) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).canvasColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * 0.6,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16,
                            ),
                            margin: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  e.get('user') ?? '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                ),
                                Text(
                                  e.get("comment"),
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    );
                  },
                  future: FirebaseFirestore.instance
                      .collection("comments")
                      .doc(widget.docId)
                      .collection("comment")
                      .get(),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: TextField(
                          controller: widget.controller,
                          textCapitalization: TextCapitalization.sentences,
                          autocorrect: true,
                          enableSuggestions: true,
                          decoration: InputDecoration(
                            labelText: 'Write your comment here...',
                            fillColor: Theme.of(context).primaryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Theme.of(context).secondaryHeaderColor,
                                width: 3,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              widget.comment = value;
                            });
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      color: Theme.of(context).iconTheme.color,
                      icon: const Icon(
                        Icons.send,
                      ),
                      onPressed: () {
                        if (widget.comment == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Container(
                              child: const Text("Please enter some Comment"),
                            ),
                          ));
                        } else if (FirebaseAuth.instance.currentUser == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Container(
                              child: const Text("Please Login to Comment"),
                            ),
                          ));
                        } else {
                          FirebaseFirestore.instance
                              .collection("comments")
                              .doc(widget.docId)
                              .collection("comment")
                              .add({
                            'comment': widget.comment,
                            'user':
                                FirebaseAuth.instance.currentUser?.displayName,
                            'createdAt': Timestamp.now()
                          });
                        }
                        widget.controller.clear();
                      },
                    )
                  ],
                )
              ],
            ),
          Container(
            child: const Text(""),
            decoration: BoxDecoration(color: Theme.of(context).dividerColor),
            height: 1,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
