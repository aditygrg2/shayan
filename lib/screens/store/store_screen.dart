import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/store_provider.dart';
import 'package:night_gschallenge/screens/store/products_category.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/sliding_card_rounded.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';
class StoreScreen extends StatelessWidget {
  static String routeName = '/store';

  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvder>(context,listen: false);
    final products = storeProvider.getProducts;
    return Scaffold(
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          TopRow(back: true,),
          HomeScreenText(text: "Shop",),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(padding: const EdgeInsets.symmetric(horizontal: 5),child: const Icon(Icons.favorite)),
                Container(padding: const EdgeInsets.symmetric(horizontal: 5),child: const Icon(Icons.shopping_cart)),
              ],
            ),
          ),
          ...storeProvider.getCategories.map((e) {
            return ProductCategory(data: e['items'], type: e['type']);
          }).toList(),
            Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            "In your Cart",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(child: const Text("11 items in cart"),),
              Container(child: const Text("View All"),),
            ]),
          ),
        )
        ,
            Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Recommended",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Container(
          width: double.infinity,
          child: GridView.builder(     
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 7,
              crossAxisSpacing: 5,
              childAspectRatio: 1.7 / 3,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
            return SlidingCardRounded(heading: products[index]['title'],src: products[index]['image'],);
          },itemCount: products.length,),
        )
        ],  
      ),
    );
  }
}