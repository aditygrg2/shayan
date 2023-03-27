import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthenticationProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  String text = '';

  String name = '';

  String get textMessage{
    return text;
  }

  String get userName{
    return name;
  }

  void submitAuthForm(String email, String password, bool isLogin, {String name = ''}) async {
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

      if(!isLogin){
        await FirebaseFirestore.instance.collection('users').doc(authResult.user!.uid).set({
          'name':name,
          'email': email,
        });
      }

      if (FirebaseAuth.instance.currentUser != null) {
        if (isLogin) {
          text = 'Login successful';
        } else {
          text = 'Thank you for signing up!';
        }
      }
    } on PlatformException catch (err) {
      text = err.message.toString();
    } catch (err) {
      text = err.toString();
    }

    notifyListeners();
  }
}