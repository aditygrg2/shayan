import 'package:flutter/material.dart';

class StoreProvder extends ChangeNotifier {
  List<Map<String, dynamic>> categories = [
    {
      'type': 'Shop by Category',
      'items': [
        {
          'title': 'Gadgets',
          'image':
              'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/01/953760-Insomnia-Keeping-You-Up-Try-These-13-Products-to-Help-You-Fall-Asleep-The-Purple-Weighted-Blanket.png?w=525'
        },
        {
          'title': 'Toys',
          'image':
              'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/01/953760-Insomnia-Keeping-You-Up-Try-These-13-Products-to-Help-You-Fall-Asleep-The-Purple-Weighted-Blanket.png?w=525'
        },
        {
          'title': 'Gadgets',
          'image':
              'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/01/953760-Insomnia-Keeping-You-Up-Try-These-13-Products-to-Help-You-Fall-Asleep-The-Purple-Weighted-Blanket.png?w=525'
        },
      ]
    },
  ];
  List<Map<String, dynamic>> products = [
    {
      'title': 'product1',
      'image':
          'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/01/953760-Insomnia-Keeping-You-Up-Try-These-13-Products-to-Help-You-Fall-Asleep-The-Purple-Weighted-Blanket.png?w=525'
    },
    {
      'title': 'product2',
      'image':
          'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/01/953760-Insomnia-Keeping-You-Up-Try-These-13-Products-to-Help-You-Fall-Asleep-The-Purple-Weighted-Blanket.png?w=525'
    },
    {
      'title': 'product3',
      'image':
          'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/01/953760-Insomnia-Keeping-You-Up-Try-These-13-Products-to-Help-You-Fall-Asleep-The-Purple-Weighted-Blanket.png?w=525'
    },
    {
      'title': 'product1',
      'image':
          'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/01/953760-Insomnia-Keeping-You-Up-Try-These-13-Products-to-Help-You-Fall-Asleep-The-Purple-Weighted-Blanket.png?w=525'
    },
    {
      'title': 'product2',
      'image':
          'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/01/953760-Insomnia-Keeping-You-Up-Try-These-13-Products-to-Help-You-Fall-Asleep-The-Purple-Weighted-Blanket.png?w=525'
    },
    {
      'title': 'product3',
      'image':
          'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/01/953760-Insomnia-Keeping-You-Up-Try-These-13-Products-to-Help-You-Fall-Asleep-The-Purple-Weighted-Blanket.png?w=525'
    },
    {
      'title': 'ultralight sleep mask',
      'image': 'https://ibb.co/7C0fjNY',
    },
    {
      'title': 'TruHabit Restosleep Herbal Syrup',
      'image': 'https://ibb.co/1QBddr9',
    },
    {
      'title': 'The sleep company SmartGRID Luxe 8 Inch mattress',
      'image': 'https://ibb.co/KVFZFq7',
    },
  ];

  List<Map<String, dynamic>> get getProducts {
    return [...products];
  }

  List<Map<String, dynamic>> get getCategories {
    return [...categories];
  }
}
