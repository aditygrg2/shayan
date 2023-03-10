import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewsUpdate extends StatefulWidget {
  final newData;
  NewsUpdate(this.newData);

  @override
  State<NewsUpdate> createState() => _NewsUpdateState();
}

class _NewsUpdateState extends State<NewsUpdate> {
   void goToPage(context){
    Navigator.of(context).pushNamed(widget.newData['buttonLink']);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(widget.newData['title']),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: (widget.newData['news'] as List<String>).map((ele) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: double.infinity),
                        ),
                        onPressed: null,
                        child: Container(
                          child: Text(
                            'ele',
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
