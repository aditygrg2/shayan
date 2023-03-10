import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/reusable_card_list.dart';

class ReusableCard extends StatefulWidget {
  final data;

  ReusableCard(this.data);

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {

  void goToPage(context){
    Navigator.of(context).pushNamed(widget.data['buttonLink']);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(widget.data['title'].toString()),
          ),
          Container(
            alignment: Alignment.center,
            child: ReusableCardList(),
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
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
