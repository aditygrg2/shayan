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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),child: Image.network(widget.src,fit: BoxFit.cover,))),
        footer: GridTileBar(
            backgroundColor: Colors.white,
            leading: Expanded(
              child: Container(
                // width: MediaQuery.of(context).size.width - 253.5,
                padding: EdgeInsets.all(9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(widget.heading), Text(widget.subHeading,style: TextStyle(fontSize: 8),)],
                ),
              ),
            ),
            trailing: Expanded(child: Icon(Icons.favorite,color: Colors.black,))),
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