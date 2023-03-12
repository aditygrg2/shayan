import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/widgets/UI/block_cards.dart';

class NewsUpdate extends StatefulWidget {
  final newData;
  NewsUpdate(this.newData);

  @override
  State<NewsUpdate> createState() => _NewsUpdateState();
}

class _NewsUpdateState extends State<NewsUpdate> {
  void goToPage(context) {
    Navigator.of(context).pushNamed(widget.newData['buttonLink']);
  }

  @override
  Widget build(BuildContext context) {
    return BlockCards(
      backgroundColor: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(widget.newData['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        (widget.newData['news'] as List<String>).map((ele) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            minimumSize: Size(300, 50),
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 1,
                            ),
                          ),
                          onPressed: null,
                          child: Container(
                            child: Text(
                              ele.toString(),
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () => goToPage(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      maximumSize: Size(150, 40),
                      disabledBackgroundColor: Colors.amber,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'View More',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
