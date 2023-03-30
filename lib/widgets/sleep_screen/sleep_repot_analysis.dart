import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/sleep_report_data_provider.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:provider/provider.dart';

class SleepReportAnalysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sleepReportProvider = Provider.of<SleepReportDataProvider>(context);
    var data = sleepReportProvider.getDiseaseStats();
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.get('healthState') == 'NA' || snapshot.data?.get('healthState') == 'NA') {

          return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            height: 150,
            child: Image.asset("assets/error.png"),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "Sleep Report",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Oops!! You have not Completed the form",
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButtonWithoutIcon(
            text: 'Close',
            onPressedButton: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
        }
        else{
          return FutureBuilder(
            future: Provider.of<SleepReportDataProvider>(context).getDiseaseStats(),
            builder:(context, snapshot) {
              
                String text="Please wait we are loading your Results...";
                if(snapshot.connectionState==ConnectionState.done){
                  bool isHealty=true;
                if(snapshot.data?.get('apnea')>=(20) ){
                  text="Alas!! You have Apnia ";
                  isHealty=false;
                }
                if(snapshot.data?.get('insomia')>=(20)){
                  text="Alas!! You have Insomia ";
                  isHealty=false;

                }
                if(snapshot.data?.get('sleep_deprivation')>=(20)){
                  text="Alas!! You have Sleep Derivation ";
                  isHealty=false;

                }
                if(isHealty) text="Hey, you are healthy have a nice day";
                else text+=".Follow our plan to improve.";
                }
                return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
                  ),
                ),
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
            Container(
              height: 150,
              child: Image.asset("assets/my_sleep_report.gif"),
            ),
            Text(
              "Sleep Report",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButtonWithoutIcon(
              text: 'Close',
              onPressedButton: () {
                Navigator.of(context).pop();
              },
            ),
                  ],
                ),
              );
            },
          );
        }
      },
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get(),
    );
  }
}
