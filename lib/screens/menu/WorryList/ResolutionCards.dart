import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/worry_list_provider.dart';
import 'package:provider/provider.dart';

class ResolutionCards extends StatefulWidget {
  @override
  State<ResolutionCards> createState() => _ResolutionCardsState();
}

class _ResolutionCardsState extends State<ResolutionCards> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<WorryListProvider>(context).worryData;
    print(data);
    return Container(
      child: Column(
        children: [
          ...data.map(
            (e) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Worry: ${e['worry']}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Situation: ${e['situation']}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notes',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (e['notes'].length > 0)
                      ...e['notes'].map((note) {
                        return ListTile(
                          leading: Icon(
                            Icons.note,
                            color: Colors.amber,
                            size: 40,
                          ),
                          title: Text(note),
                        );
                      }),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: e['controller'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      cursorHeight: 20,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        labelText: 'Enter your notes here...',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onSubmitted: (value) {
                        e['notes'].add(value);
                        (e['controller'] as TextEditingController).clear();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
