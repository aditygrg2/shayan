import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SleepReportDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> healthyReports = [
    {
      'title': 'Mindfulness',
      'score': ' ',
      'description':
          'Perform practical techniques to cultivate mindfulness and reduce stress.',
      'icon': Icons.health_and_safety
    },
    {
      'title': 'Productivity',
      'score': ' ',
      'description':
          'Maximizing your time and energy to achieve more and reach your goals.',
      'icon': Icons.grid_view_rounded
    },
    {
      'title': 'Sleep',
      'score': ' ',
      'description':
          'Chat with a sleep expert and discover tips and techniques for getting a better night\'s rest.',
      'icon': Icons.bed
    },
  ];

  List<Map<String, dynamic>> apneaReports = [
    {
      'title': 'Apnea Management',
      'score': ' ',
      'description':
          'Explore effective techniques and strategies to manage sleep apnea and improve your sleep quality.',
      'icon': Icons.airline_seat_individual_suite,
    },
    {
      'title': 'CPAP Therapy',
      'score': ' ',
      'description':
          'Learn about Continuous Positive Airway Pressure (CPAP) therapy, its benefits, and how to use CPAP equipment.',
      'icon': Icons.local_hospital,
    },
  ];

  List<Map<String, dynamic>> sleepDeprivationReports = [
    {
      'title': 'Sleep Hygiene',
      'score': ' ',
      'description':
          'Discover essential practices for maintaining good sleep hygiene and improving your sleep patterns.',
      'icon': Icons.hotel,
    },
    {
      'title': 'Sleep Schedule',
      'score': ' ',
      'description':
          'Establish a consistent sleep schedule to regulate your body\'s internal clock and combat sleep deprivation.',
      'icon': Icons.schedule,
    },
    {
      'title': 'Relaxation Techniques',
      'score': ' ',
      'description':
          'Learn relaxation exercises and methods to unwind before bed, promoting better sleep and reducing sleep deprivation.',
      'icon': Icons.spa,
    },
  ];
  List<Map<String, dynamic>> insomiaReports = [
    {
      'title': 'Sleep Hygiene',
      'score': ' ',
      'description':
          'Discover essential practices for maintaining good sleep hygiene and improving your sleep patterns.',
      'icon': Icons.hotel,
    },
    {
      'title': 'Sleep Schedule',
      'score': ' ',
      'description':
          'Establish a consistent sleep schedule to regulate your body\'s internal clock and combat sleep deprivation.',
      'icon': Icons.schedule,
    },
    {
      'title': 'Relaxation Techniques',
      'score': ' ',
      'description':
          'Learn relaxation exercises and methods to unwind before bed, promoting better sleep and reducing sleep deprivation.',
      'icon': Icons.spa,
    },
  ];

  Future getDiseaseStats() async {
    return await FirebaseFirestore.instance
        .collection("planForm")
        .doc(getId())
        .collection("stats")
        .doc(getId())
        .get();
  }
  List<Map<String,dynamic>> getReport(String disease){
    if(disease=='sleep deprivation'){
      return sleepDeprivationReports;
    } 
    else if(disease=='apnea') {
      return apneaReports;
    }
    else if(disease=='insomia'){
      return insomiaReports;
    }
    return healthyReports;
   }

  String? getId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }
}
