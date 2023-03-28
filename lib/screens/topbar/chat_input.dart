import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final void Function(String)? getMessage;
  final ScrollController? controller;

  ChatInput({this.getMessage, this.controller});

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _controller = new TextEditingController();
  String _enteredMessage = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(15),
            child: TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(
                labelText: 'Write your message here...',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black,
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
          color: Colors.black,
          icon: Icon(
            Icons.send,
          ),
          onPressed: _enteredMessage.trim().isEmpty
              ? null
              : () {
                  widget.controller!.animateTo(widget.controller!.position.maxScrollExtent + 30, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                  widget.getMessage!(_enteredMessage);
                },
        )
      ],
    );
  }
}
