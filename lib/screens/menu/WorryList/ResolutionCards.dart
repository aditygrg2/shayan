import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/worry_list_provider.dart';
import 'package:provider/provider.dart';

class ResolutionCards extends StatefulWidget {
  bool isWriting=false;
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.add,color: Colors.black,size: 40,),onPressed: (){
                  setState(() {
                    widget.isWriting=!widget.isWriting;
                  });
                },),
              ],
            ),
          )
          ,
          ...data.map(
            (e) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
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
                      '${e['worry']}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '${e['situation']}',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.left,
                      ),
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
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (e['notes'].length > 0)
                      ...e['notes'].map((note) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              leading: Icon(
                                Icons.sticky_note_2_outlined,
                                color: Colors.amber,
                                size: 40,
                              ),
                              title: Text(note),
                            ),
                          ),
                        );
                      }),
                    SizedBox(
                      height: 10,
                    ),
                   widget.isWriting? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        autocorrect: true,
                        enableSuggestions: true,
                        controller: e['controller'],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        cursorHeight: 20,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          labelText: 'Enter your notes here...',
                          alignLabelWithHint: false,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white,
                          filled: true,
                    
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                        onSubmitted: (value) {
                          e['notes'].add(value);
                          (e['controller'] as TextEditingController).clear();
                          setState(() {
                            widget.isWriting=false;
                          });
                        },
                      ),
                    ):Container(),
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
