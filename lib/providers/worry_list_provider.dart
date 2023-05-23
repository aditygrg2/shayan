import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WorryListProvider with ChangeNotifier{
  
  String? id = FirebaseAuth.instance.currentUser?.uid;

  // Pattern of the object
  // Situation, worry, solutions, type

  Future addWorry(data)async{
    try{
      await FirebaseFirestore.instance.collection("worry").doc(id).collection("worry").add({
        'worry':data['worry'],
        'situation':data['situation'],
        'notes':data['notes'],
        'createdtimestamp':Timestamp.now()
      });
      notifyListeners();
    }catch(e){

    }
  }
  Future updateWorryList(String docId, List<dynamic> notes)async{
    try{
      await FirebaseFirestore.instance.collection("worry").doc(id).collection("worry").doc(docId).update({
        'notes':notes,
        'updatedTimestamp':Timestamp.now()
      });
      notifyListeners();
    }catch(e){

    }
  }
  Future deleteWorry(String docId)async{
    try{
      await FirebaseFirestore.instance.collection("worry").doc(id).collection("worry").doc(docId).delete();
      notifyListeners();
    }catch(e){

    }
  }
  Future getWorry()async{
    try{
      final doc =  await FirebaseFirestore.instance.collection("worry").doc(id).collection("worry").get();

      return doc;
    }catch(e){

    }
  }

}