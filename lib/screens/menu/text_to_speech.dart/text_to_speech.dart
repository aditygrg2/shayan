import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/providers/flutter_ttx.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/slider_input.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:volume_controller/volume_controller.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
class TextToSpeechComponent extends StatefulWidget {
  static String routeName = '/textToSpeech';
  final textController = TextEditingController();
  List<Object?> voicesMap = [];
  String dropDown = "Microsoft David - English (United States)";
  int modalIndex;
  double volume;
  double rate;
  double pitch;
  List<String> modals = ['Volume', 'Pitch', 'Rate'];
  List<String> options = ['Speak','Resume','Pause','Stop'];
  TextToSpeechComponent(
      {this.modalIndex = -1, this.volume = 0.5, this.rate = 1, this.pitch = 1});

  @override
  State<TextToSpeechComponent> createState() => _TextToSpeechComponentState();
}

class _TextToSpeechComponentState extends State<TextToSpeechComponent> {
  void initState() {
    super.initState();
    VolumeController().listener((volume) {
      widget.volume = volume;
    });
  }

  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

  double getValue() {
    if (widget.modalIndex == 0) {
      return widget.volume;
    } else if (widget.modalIndex == 1) {
      return widget.pitch;
    }
    return widget.rate;
  }

  @override
  Widget build(BuildContext context) {
    var textSpeech = Provider.of<FlutterTextSpeech>(context);
    return Scaffold(
      body: ListView(
        children: [
          TopRow(back:true),
          Container(
          child: Column(
            children: [
              HomeScreenText(
                text: 'Listen to your Stories',
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(241, 243, 242, 1)),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextField(
                            minLines: 8,
                            maxLines: 15,
                            controller: widget.textController,
                            decoration: InputDecoration(
                                hintText: 'Enter Text For Speech',
                                border: InputBorder.none),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.modalIndex = 0;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.volume_down,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.modalIndex = 1;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.volume_down,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.modalIndex = 2;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.volume_down,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                child: new FutureBuilder(
                                  builder: (context, snapshot) {
                                    widget.voicesMap = snapshot.data;
                                    widget.dropDown = snapshot.data[0]['name'];
                                    return DropdownButton<String>(
                                      dropdownColor: Colors.white,
                                        items: snapshot.data
                                            .map<DropdownMenuItem<String>>(
                                                (ele) => DropdownMenuItem<String>(
                                                      value: ele['name'],
                                                      key: Key(ele['locale']),
                                                      child: Text(
                                                          ele['name'] as String),
                                                    ))
                                            .toList(),
                                        isExpanded: true,
                                        hint: Text('Select voice',overflow: TextOverflow.ellipsis),
                                        value: widget.dropDown,
                                        onChanged: (String? value) {
                                          setState(() {
                                            textSpeech.setVoice(
                                                widget.voicesMap, value);
                                            widget.dropDown = value!;
                                          });
                                        });
                                  },
                                  initialData: ["loading"],
                                  future: Provider.of<FlutterTextSpeech>(context)
                                      .getVoices(),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (widget.modalIndex != -1)
                      SliderInput(
                          value: getValue(),
                          title: widget.modals[widget.modalIndex],
                          callback: (double value) {
                            if (widget.modals[widget.modalIndex] == 'Volume') {
                              widget.volume = value;
                              VolumeController().setVolume(value);
                              textSpeech.setVolume(value);
                            } else if (widget.modals[widget.modalIndex] ==
                                'Rate') {
                              widget.rate = value;
                              textSpeech.setRate(value);
                            } else {
                              widget.pitch = value;
                              textSpeech.setPitch(value);
                            }
                          }),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 400,
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,childAspectRatio: 8/2 ,mainAxisSpacing: 10),itemBuilder: (context, index) {
                        return GestureDetector(
                    child: Container(
                      height: 20,
                      alignment: Alignment.center,
                      child: Text(
                        widget.options[index],
                        style: TextStyle(color: Colors.white,fontSize: 15),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(14, 65, 195, 1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onTap: () {
                      if(widget.options[index] == 'Speak'){
                        textSpeech.setText(widget.textController.text);
                        textSpeech.speak();
                      }else if(widget.options[index] == 'Resume'){

                      }else if(widget.options[index] == 'Stop'){
                        textSpeech.stop();
                      }else{
                        textSpeech.pause();
                      }
                    },
                  );
                      },itemCount: 4,),
                    )
                    
                  ],
                ),
              ),
            ],
          ),
        )],
      ),
    );
  }
}


