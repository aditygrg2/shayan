import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/worry_list_provider.dart';
import 'package:night_gschallenge/screens/menu/WorryList/Steps/step_two.dart';
import 'package:night_gschallenge/screens/menu/WorryList/worrycard.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';

class StepOne extends StatelessWidget {
  static const routeName = 'menu/step1';

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<WorryListProvider>(context).worryData;
    var situation = '';
    var worry = '';
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: 'Worry List',
          ),
          SizedBox(
            height: 20,
          ),
          if (data.length == 0)
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'No worries added. Want to list down your worries. Just tap on the button below and we will crush them together',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          if (data.length > 0)
            ...data.map((worry) {
              return Worrycard(
                worry: worry['worry'],
                situation: worry['situation'],
              );
            }),
          Center(
            child: ElevatedButtonWithoutIcon(
              text: 'Add worry',
              onPressedButton: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Write down your worry here..',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextField(
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              maxLines: 3,
                              cursorHeight: 20,
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                labelText: 'List your worry here!',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onChanged: (value) {
                                worry = value;
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextField(
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              maxLines: 3,
                              cursorHeight: 20,
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                labelText: 'List your situation here!',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onChanged: (value) {
                                situation = value;
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Center(
                              child: ElevatedButtonWithoutIcon(
                                text: 'Submit',
                                onPressedButton: () {
                                  Provider.of<WorryListProvider>(context,
                                          listen: false)
                                      .updateWorriesList(
                                    {
                                      'worry': worry,
                                      'situation': situation,
                                      'notes': [],
                                      'controller': TextEditingController(),
                                    },
                                  );
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (data.length > 0)
          Center(
            child: ElevatedButtonWithoutIcon(
              text: 'Continue',
              onPressedButton: (){
                Navigator.of(context).pushNamed(StepTwo.routeName);
              },
            ),
          )
        ],
      ),
    );
  }
}
