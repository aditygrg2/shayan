import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimelineProvider extends ChangeNotifier {
  List<dynamic> timeline = [];
  TimelineProvider() {}
  List<Map<dynamic, dynamic>> get getTimeline {
    return [...timeline];
  }

  Future editTimeline(int index, String time, String task) async {
    timeline[index] = {
      "time": time,
      "task": task,
    };
    timeline.sort(
      (a, b) => (a['time'] as String).compareTo(
        b['time'],
      ),
    );
    try {
      await FirebaseFirestore.instance
          .collection("timeline")
          .doc(getId())
          .set({'time': jsonEncode(timeline)});
      await FirebaseFirestore.instance
          .collection("users")
          .doc(getId())
          .update({'isCustomizedTimeline': 'true'});
    } catch (e) {
      return false;
    }
    notifyListeners();
  }

  Future addTimeline(String time, String task) async {
    timeline.add({
      "time": time,
      "task": task,
    });
    timeline.sort(
      (a, b) => (a['time'] as String).compareTo(
        b['time'],
      ),
    );
    try {
      await FirebaseFirestore.instance
          .collection("timeline")
          .doc(getId())
          .set({'time': jsonEncode(timeline)});
      await FirebaseFirestore.instance
          .collection("users")
          .doc(getId())
          .update({'isCustomizedTimeline': 'true'});
    } catch (e) {
      return false;
    }
    notifyListeners();
    return true;
  }

  String? getId() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future fetchTimeline() async {
    final user =
        await FirebaseFirestore.instance.collection("users").doc(getId()).get();
    var result;
    if (user['isCustomizedTimeline'] == 'false') {
      final diseaseType =
          user['diseaseType'] != 'NA' ? user['diseaseType'] : 'healthy';
      result = await FirebaseFirestore.instance
          .collection("timeline")
          .doc(diseaseType)
          .get();
    }
    if (user['isCustomizedTimeline'] == 'true') {
      result = await FirebaseFirestore.instance
          .collection("timeline")
          .doc(getId())
          .get();
    }
    timeline = jsonDecode(result['time']);
    return [...timeline];
  }

  void setTimeline() async {
    var result = await FirebaseFirestore.instance
        .collection("timeline")
        .doc("healthy")
        .set({'time': jsonEncode(timeline)});
  }
}
