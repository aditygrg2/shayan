import 'package:flutter/material.dart';
class PropertyCard extends StatelessWidget {
  String property = "Efficiency";
  String percentage = "96%";
  String description;
  double width,height;
  PropertyCard({required this.width,required this.height,this.description = ""});

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
              Container(child: Flexible(child: Text(property,style: Theme.of(context).textTheme.headlineMedium,)),),
              Container(child: Text(percentage,style: TextStyle(fontSize: 25),),)
            ],
          ):Column(
                children: [
                  Container(child: Flexible(child: Text(property,style: Theme.of(context).textTheme.headlineMedium,)),),
                  Container(child: Text(percentage,style: TextStyle(fontSize: 15),),),
                  Flexible(child: Text(description,style: TextStyle(fontSize: 10),))
                ],
              ),
            
          );
  }
}