

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SleepDiseaseProvider extends ChangeNotifier{
  int apnea=0;
  int sleep_deprivation=0;
  int insomia=0;
  List<Map<String,dynamic>>_questions=[
    {
      "que":6,
      "type":"MCQ",
      "answers":["0","0","3"],
    },
    {
      "que":7,
      "type":"MCQ",
      "answers":["0","2","0"],
    },
    {
      "que":8,
      "type":"value",
      "answers":["8","7","8"],
    },
    {
      "que":9,
      "type":"MCQ",
      "answers":["4","1","3"],
    },
    {
      "que":10,
      "type":"MCQ",
      "answers":["4","4","1"],
    },
    {
      "que":11,
      "type":"MCQ",
      "answers":["0","0","1"],
    },
    {
      "que":12,
      "type":"MCQ",
      "answers":["4","4","3"],
    },
    {
      "que":13,
      "type":"MCQ",
      "answers":["2","4","1"],
    },
    {
      "que":14  ,
      "type":"MCQ",
      "answers":["4","4","3"],
    },
    {
      "que":15,
      "type":"MCQ",
      "answers":["0","3","1"],
    },
    {
      "que":16,
      "type":"MCQ",
      "answers":["4","4","3"],
    },
    {
      "que":17,
      "type":"MCQ",
      "answers":["4","0","2"],
    },
    {
      "que":18,
      "type":"MCQ",
      "answers":["4","3","1"],
    },
    {
      "que":19,
      "type":"MCQ",
      "answers":["4","3","1"],
    },
    {
      "que":20  ,
      "type":"MCQ",
      "answers":["*","*","*"],
    },
    {
      "que":21  ,
      "type":"time",
      "answers":["*","*","*"],
    },
    {
      "que":22  ,
      "type":"time",
      "answers":["*","*","*"],
    },
    {
      "que":23  ,
      "type":"time",
      "answers":["*","*","*"],
    },
    {
      "que":24  ,
      "type":"MCQ",
      "answers":["4","0","3"],
    },
    {
      "que":25  ,
      "type":"time",
      "answers":["*","*","*"],
    },
    {
      "que":26  ,
      "type":"time",
      "answers":["*","*","*"],
    },
    {
      "que":27  ,
      "type":"MCQ",
      "answers":["3","1","3"],
    },
    {
      "que":28  ,
      "type":"value",
      "answers":["120","10","20"],
    },
    {
      "que":29  ,
      "type":"time",
      "answers":["*","*","*"],
    },
    {
      "que":30  ,
      "type":"time",
      "answers":["*","*","*"],
    },
    {
      "que":31  ,
      "type":"time",
      "answers":["*","*","*"],
    },
    {
      "que":32  ,
      "type":"time",
      "answers":["*","*","*"],
    },
    {
      "que":33  ,
      "type":"MCQ",
      "answers":["4","0","3"],
    },
    {
      "que":34  ,
      "type":"MCQ",
      "answers":["0","0","1"],
    },
    {
      "que":35  ,
      "type":"MCQ",
      "answers":["0","0","1"],
    },
    {
      "que":36  ,
      "type":"MCQ",
      "answers":["2","3","2"],
    },
    {
      "que":37  ,
      "type":"MCQ",
      "answers":["1","0","0"],
    },

  ];
  String? getId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  bool isDisease(String answer,int index,int disease){
    Map<String,dynamic>map=_questions[index-5];
    if(map['type']=="MCQ" || map['type']=="value"){
      return map['answers'][disease]==answer;
    }else{
      return map['answers'][disease]==answer;
    }

  }
  void checkAndSave(int index)async{

    
    FirebaseFirestore.instance.collection("planForm").doc(getId()).collection("question").doc(index.toString()).get().then(
      (DocumentSnapshot querySnapshot) {
        if(isDisease(querySnapshot.get("answer"), index, 0)){
          apnea++;
        }
        if(isDisease(querySnapshot.get("answer"), index, 1)){
          sleep_deprivation++;
        }
        if(isDisease(querySnapshot.get("answer"), index, 2)){
          insomia++;
        }

        FirebaseFirestore.instance.collection("planForm").doc(getId()).collection("stats").doc(DateTime.now().toString()).set({
          "apnea":apnea,
          "insomia":insomia,
          "sleep_deprivation":sleep_deprivation
        }).then((value) {
          
        } );
      },
      onError: (e) => print("Error completing: $e"),
    );
    
  }
}