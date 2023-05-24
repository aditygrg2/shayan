import 'dart:async';

import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/permissionModal.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';

class ChatInput extends StatefulWidget {
  final void Function(String)? getMessage;
  final ScrollController? controller;

  ChatInput({this.getMessage, this.controller});

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _controller = TextEditingController();
  String _enteredMessage = '';
  stt.SpeechToText speech = stt.SpeechToText();
  bool notPopped = true;
  bool finalResult = false;
  String lastWords = '';
  ScrollController _scrollController = ScrollController();

  void _onSpeechResult(SpeechRecognitionResult result) async {
    if (result.finalResult) {
      setState(() {
        finalResult = true;
        _enteredMessage = result.recognizedWords;
        _controller.text = result.recognizedWords;
      });
      if (result.confidence > 0.80) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          widget.controller!.animateTo(
            widget.controller!.position.maxScrollExtent,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOut,
          );
        });
        widget.getMessage!(_enteredMessage);
        _controller.text = "";
      }
    } else {
      notPopped = true;
      finalResult = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    if (finalResult) {
      notPopped = false;
      Navigator.of(context).pop();
      finalResult = false;
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                labelText: 'Write your message here...',
                fillColor: Theme.of(context).primaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
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
                  _enteredMessage = value;
                });
              },
            ),
          ),
        ),
        IconButton(
          onPressed: () async {
            var permit = await Permission.microphone.status;

            if (permit == PermissionStatus.permanentlyDenied ||
                permit == PermissionStatus.denied) {
              // ignore: use_build_context_synchronously
              showDialog(
                context: context,
                builder: (ctx) {
                  return PermissionModal(
                    permissionName: 'Microphone',
                    icon: Icons.mic,
                  );
                },
              );
            } else if (permit == PermissionStatus.granted) {
              speech.initialize();
              var spokenText = await speech.listen(
                  onResult: _onSpeechResult, listenFor: Duration(seconds: 5));

              showGeneralDialog(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mic,
                            size: 48,
                          ),
                          Text(
                            "Listening....",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 32
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              notPopped = false;
                              speech.stop();
                            },
                            child: Text("Close"),
                          )
                        ],
                      ),
                    ),
                  );
                },
                context: context,
              );

              Timer(Duration(seconds: 5), () {
                if (notPopped) {
                  Navigator.of(context).pop();
                  notPopped = true;
                }
              });
            } else {
              await Permission.microphone.request();
            }
          },
          icon: Icon(
            Icons.mic,
          ),
        ),
        IconButton(
          color: Theme.of(context).iconTheme.color,
          icon: const Icon(
            Icons.send,
          ),
          onPressed: _controller.text.trim().isEmpty
              ? null
              : () {
                  widget.controller!.animateTo(height,
                      duration: Duration(seconds: 1), curve: Curves.bounceIn);
                  widget.getMessage!(_enteredMessage);
                  _controller.text = "";
                },
        )
      ],
    );
  }
}
