import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/worry_list_provider.dart';
import 'package:night_gschallenge/widgets/UI/loadingStateCreator.dart';
import 'package:provider/provider.dart';

class ResolutionCards extends StatefulWidget {
  bool isWriting=false;
  @override
  State<ResolutionCards> createState() => _ResolutionCardsState();
}

class _ResolutionCardsState extends State<ResolutionCards> {
  @override
  Widget build(BuildContext context) {
    var worryProvider = Provider.of<WorryListProvider>(context);
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.add,color: Theme.of(context).iconTheme.color,size: 40,),onPressed: (){
                  setState(() {
                    widget.isWriting=!widget.isWriting;
                  });
                },),
              ],
            ),
          )
          ,
          FutureBuilder(builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(child: LoadingStateCreator(),);
            }
            final doc = snapshot.data as QuerySnapshot;
            return Column(
              children: [
                ...doc.docs.map((e) {
                  var controller = TextEditingController();
                   return Container(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${e['worry']}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '${e['situation']}',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                              leading: const Icon(
                                Icons.sticky_note_2_outlined,
                                color: Colors.amber,
                                size: 40,
                              ),
                              title: Text(note),
                            ),
                          ),
                        );
                      }),
                    const SizedBox(
                      height: 10,
                    ),
                   widget.isWriting? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        autocorrect: true,
                        enableSuggestions: true,
                        controller:controller,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        cursorHeight: 20,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          labelText: 'Enter your notes here...',
                          alignLabelWithHint: false,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Theme.of(context).primaryColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                        onSubmitted: (value) {
                          var list = e['notes'] as List;
                          list.add(value);
                          worryProvider.updateWorryList(e.id,list).then((value) {
                            controller.clear();
                            setState(() {
                              widget.isWriting=false;
                            });
                          });
                        },
                      ),
                    ):Container(),
                  ],
                ),
              );
                })
              ],
            );
            
          },future: worryProvider.getWorry(),),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
