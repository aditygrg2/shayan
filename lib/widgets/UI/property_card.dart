import 'package:flutter/material.dart';
class PropertyCard extends StatelessWidget {
  String title ;
  String description,score;
  double width,height;
  PropertyCard({required this.width,required this.height,this.description = "",this.score='96%',this.title="Efficiency"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      width: width,
      height: height,
      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Color.fromRGBO(250, 195, 68, 1),width: 0.9),borderRadius: BorderRadius.circular(12)),
      child: 
          description.isEmpty ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child: Flexible(child: Text(title,style: Theme.of(context).textTheme.headlineSmall,)),),
              Container(child: Text(score,style: TextStyle(fontSize: 25),),)
            ],
          ):Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(child: Expanded(child: Text(title,style: Theme.of(context).textTheme.headlineSmall,)),),
                  Container(child: Text(score,style: TextStyle(fontSize: 15),),),
                  SizedBox(height: 13,),
                  Container(width: width*0.8,height: height*0.6,child: Expanded(child: Text(description,style: Theme.of(context).textTheme.bodySmall,)))
                ],
              ),
            
          );
  }
}