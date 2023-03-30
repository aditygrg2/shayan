import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SleepReportDataProvider extends ChangeNotifier{
  
  Future getDiseaseStats()async{
    return await FirebaseFirestore.instance.collection("planForm").doc(getId()).collection("stats").doc(getId()).get();
  }
  
  String? getId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }
}