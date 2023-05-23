import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/store_provider.dart';
import 'package:night_gschallenge/screens/store/products_category.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';
class StoreScreen extends StatelessWidget {
  static String routeName = '/store';

  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvder>(context,listen: false);
    return Scaffold(
      body: ListView(
        children: [
          TopRow(back: true,),
          HomeScreenText(text: "Store",),
          ...storeProvider.getProducts.map((e) {
            return ProductCategory(data: e['items'], type: e['type']);
          }).toList()
        ],  
      ),
    );
  }
}