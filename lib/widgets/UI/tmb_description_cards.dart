import 'package:flutter/material.dart';

class TmbDescriptionCards extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? image;
  final String? route;

  TmbDescriptionCards({this.title, this.subtitle, this.image, this.route});

  @override
  Widget build(BuildContext context) {
    var widthi = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route!);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 2,
            )),
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Row(
            children: [
              Container(
                width: widthi * 0.5,
                padding: const EdgeInsets.only(left: 20, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Expanded(child: Image.asset(image!)),
            ],
          ),
        ),
      ),
    );
  }
}
