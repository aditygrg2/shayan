import 'package:flutter/material.dart';

class LibraryCard extends StatefulWidget {
  final heading;
  final subHeading;
  final src;
  LibraryCard({this.heading, this.subHeading, this.src});
  @override
  State<LibraryCard> createState() => _LibraryCardState();
}

class _LibraryCardState extends State<LibraryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                
              ),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  widget.src,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            padding: EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.heading,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.subHeading,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Container(
//       // margin: EdgeInsets.all(10),
//       height: 150,
//       width: 150,
//       decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
//       child: Expanded(
//         child: Column(
//           children: [
//             ClipRRect(
//               child: Container(
//                   child: Image.network(
//                     widget.src,
//                     fit: BoxFit.cover,
//                   )),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//            Expanded(
//              child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(widget.heading),
//                   Row(
                 
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(child: Text(widget.subHeading,style: Theme.of(context).textTheme.bodySmall,)),
//                         Expanded(child: IconButton(onPressed: null, icon: Icon(Icons.favorite)))
//                       ],
//                     ),
                  
//                 ],
//                 ),
//            ),
//           ],
//         ),
//       ),
//     )