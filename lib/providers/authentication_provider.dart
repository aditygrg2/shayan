import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthenticationProvider extends ChangeNotifier {
  String text = '';
  User? user;

  String get textMessage {
    return text;
  }

  String? getId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Future<void> submitAuthForm(String email, String password, bool isLogin,
      {String name = ''}) async {
    final _auth = FirebaseAuth.instance;
    UserCredential authResult;
    try {
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }

      if (!isLogin) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set(
          {
            'name': name,
            'email': email,
            'healthState': 'NA',
            'questionNumber':-1,
            'SSCreated': false,
            'diseaseType':'NA',
            'isReady':'NA'
          },
        );
      }

      if (authResult.user!.uid != null) {
        if (isLogin) {
          text = 'Login successful';
        } else {
          text = 'Thank you for signing up!';
        }
      }
      notifyListeners();

    } on PlatformException catch (err) {
      text = err.message.toString();
      notifyListeners();
    } catch (err) {
      text = err.toString();
      notifyListeners();
    }

    notifyListeners();
  }
}
