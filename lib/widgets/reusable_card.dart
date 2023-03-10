import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/calm_tune_card_list.dart';

class ReusableCard extends StatefulWidget {
  const ReusableCard({super.key});

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text('Calm Tunes'),
          ),
          Container(
            alignment: Alignment.center,
            child: ReusableCardList(),
          ),
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
