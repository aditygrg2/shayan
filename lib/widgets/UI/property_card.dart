import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  String title;
  String description, score;
  PropertyCard({
    this.description = "",
    this.score = '96%',
    this.title = "Efficiency",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(250, 195, 68, 1), width: 0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: description.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Flexible(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    score,
                    style: TextStyle(fontSize: 25,),
                  ),
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Flexible(
                      child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
                ),
                Container(
                  child: Text(
                    score,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Flexible(
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
