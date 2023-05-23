import 'package:flutter/material.dart';

class StoreProvder extends ChangeNotifier{
  List<Map<String,dynamic>> products = [
    {
      'type':'type 1',
      'items':[
        {'title':'product1','price':'Rs. 80','description':'This is product1 This is product1 This is product1','image':''},
        {'title':'product2','price':'Rs. 80','description':'This is product1','image':''},
        {'title':'product3','price':'Rs. 80','description':'This is product1','image':''},
      ]
    },
    {
      'type':'type 2',
      'items':[
        {'title':'product1','price':'Rs. 80','description':'This is product1','image':''},
        {'title':'product2','price':'Rs. 80','description':'This is product1','image':''},
        {'title':'product3','price':'Rs. 80','description':'This is product1','image':''},
      ]
    },
  ];

  List<Map<String,dynamic>> get getProducts{
    return [...products];
  }
}