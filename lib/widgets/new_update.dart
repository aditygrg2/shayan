import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewsUpdate extends StatefulWidget {
  const NewsUpdate({super.key});

  @override
  State<NewsUpdate> createState() => _NewsUpdateState();
}

class _NewsUpdateState extends State<NewsUpdate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text('News Update'),
        ),
        Container(
          child: Column(
            children: [
              Container(
                  child: Column(
                children: [
                  Text('item1'),
                  Text('item1'),
                  Text('item1'),
                ],
              )),
              Container(
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    disabledBackgroundColor: Colors.amber,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'View More',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
