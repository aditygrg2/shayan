import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/dialog_flow_provider.dart';
import 'package:night_gschallenge/screens/topbar/chat_input.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  void getMessage(String text) async {
    var id = await FirebaseAuth.instance.currentUser?.uid;
    var user =
        await FirebaseFirestore.instance.collection('users').doc(id).get();

    // User message to firebase
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(id!)
        .collection('messages')
        .doc()
        .set(
      {
        'timestamps': DateTime.now(),
        'value': text,
        'user': id,
        'username': user['name']
      },
    );

    var response = await Provider.of<DialogflowProvider>(context, listen: false)
        .setFlow(text);

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(id)
        .collection('messages')
        .doc()
        .set(
      {
        'timestamps': DateTime.now(),
        'value': response?.text,
        'user': 'dialogflow',
        'username': 'Night Bot'
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var id = FirebaseAuth.instance.currentUser?.uid;
    var notificationBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 15,
              top: notificationBarHeight,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 35,
                  ),
                ),
                HomeScreenText(text: 'Chat with Sleep Trainer'),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(id)
                  .collection('messages')
                  .orderBy('timestamps')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text("No data");

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Please wait..');
                }
                return ListView(
                  controller: _scrollController,
                  children: [
                    ...snapshot.data!.docs.map(
                      (chat) {
                        bool condition = chat['user'] != 'dialogflow';
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: (condition)
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: <Widget>[
                                if (!condition)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                    ),
                                    child: Image.asset(
                                      'assets/bot.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: condition
                                        ? Colors.amber
                                        : Theme.of(context).canvasColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(12),
                                      topRight: const Radius.circular(12),
                                      bottomLeft: !condition
                                          ? const Radius.circular(0)
                                          : const Radius.circular(12),
                                      bottomRight: condition
                                          ? const Radius.circular(0)
                                          : const Radius.circular(12),
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 16,
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: condition
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        chat['username'] ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        chat['value'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        textAlign: condition
                                            ? TextAlign.end
                                            : TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ),
          ChatInput(
            getMessage: getMessage,
            controller: _scrollController,
          )
        ],
      ),
    );
  }
}
