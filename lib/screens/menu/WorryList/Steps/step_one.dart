import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/worry_list_provider.dart';
import 'package:night_gschallenge/screens/menu/WorryList/Steps/step_two.dart';
import 'package:night_gschallenge/screens/menu/WorryList/worrycard.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/loadingStateCreator.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';

class StepOne extends StatelessWidget {
  static const routeName = 'menu/step1';

  @override
  Widget build(BuildContext context) {
    var worryProvider = Provider.of<WorryListProvider>(context);
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
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: LoadingStateCreator(),
                );
              }
              final docs = snapshot.data as QuerySnapshot;
              if (docs.docs.length == 0) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'No worries added. Want to list down your worries. Just tap on the button below and we will crush them together',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButtonWithoutIcon(
                        text: 'Add worry',
                        onPressedButton: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                  top: 20,
                                  left: 20,
                                  right: 20,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Add Worry',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      TextField(
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        maxLines: 3,
                                        autocorrect: true,
                                        cursorHeight: 20,
                                        textAlign: TextAlign.left,
                                        decoration: InputDecoration(
                                          labelText: 'List down your worry here',
                                          fillColor:
                                              Theme.of(context).primaryColor,
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
                                        autocorrect: true,
                                        cursorHeight: 20,
                                        textAlign: TextAlign.left,
                                        decoration: InputDecoration(
                                          labelText:
                                              'List down your situtation here!',
                                          fillColor:
                                              Theme.of(context).primaryColor,
                                          filled: true,
                                        ),
                                        onChanged: (value) {
                                          situation = value;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Center(
                                        child: ElevatedButtonWithoutIcon(
                                          text: 'Submit',
                                          onPressedButton: () {
                                            Provider.of<WorryListProvider>(
                                                    context,
                                                    listen: false)
                                                .addWorry(
                                              {
                                                'worry': worry,
                                                'situation': situation,
                                                'notes': []
                                              },
                                            );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                      const SizedBox(
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
                  ],
                );
              }
              return Column(
                children: [
                  ...docs.docs.map((worry) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Worrycard(
                        worry: worry['worry'],
                        situation: worry['situation'],
                        id: worry.id,
                      ),
                    );
                  }),
                  Center(
                    child: ElevatedButtonWithoutIcon(
                      text: 'Add worry',
                      onPressedButton: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                                top: 20,
                                left: 20,
                                right: 20,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Write down your worry here..',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                      autocorrect: true,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        labelText: 'List your worry here!',
                                        fillColor:
                                            Theme.of(context).primaryColor,
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
                                      autocorrect: true,
                                      cursorHeight: 20,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        labelText: 'List your situation here!',
                                        fillColor:
                                            Theme.of(context).primaryColor,
                                        filled: true,
                                      ),
                                      onChanged: (value) {
                                        situation = value;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Center(
                                      child: ElevatedButtonWithoutIcon(
                                        text: 'Submit',
                                        onPressedButton: () {
                                          Provider.of<WorryListProvider>(
                                                  context,
                                                  listen: false)
                                              .addWorry(
                                            {
                                              'worry': worry,
                                              'situation': situation,
                                              'notes': []
                                            },
                                          );
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                    const SizedBox(
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
                  Center(
                    child: ElevatedButtonWithoutIcon(
                      text: 'Continue',
                      onPressedButton: () {
                        Navigator.of(context).pushNamed(StepTwo.routeName);
                      },
                    ),
                  )
                ],
              );
            },
            future: worryProvider.getWorry(),
          ),
        ],
      ),
    );
  }
}
