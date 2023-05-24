import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/authentication_provider.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/screens/startup/signup_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/splash_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String user_email = '';
  bool loading = false;
  String user_password = '';

  void trySubmit() async {
    final isValid = _formKey.currentState!.validate();

    FocusScope.of(context).unfocus();

    if (isValid) {
      setState(() {
        loading = true;
      });
      _formKey.currentState!.save();

      await Provider.of<AuthenticationProvider>(context, listen: false)
          .submitAuthForm(user_email.trim(), user_password.trim(), true);
    }

    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        loading = false;
      });
      Navigator.of(context).pushNamedAndRemoveUntil(
          HomeScreen.routeName, (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var string =
        Provider.of<AuthenticationProvider>(context, listen: true).textMessage;
    return Scaffold(
      body: ListView(
        children: [
          Image.asset('assets/login.gif'),
          HomeScreenText(
            text: 'Welcome Back',
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          key: const ValueKey('Email'),
                          decoration:
                              const InputDecoration(labelText: 'Email Address'),
                          onSaved: (value) {
                            user_email = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter correct email format';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.key),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          key: const ValueKey('password'),
                          obscureText: true,
                          obscuringCharacter: '●',
                          style: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixStyle: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                          onSaved: (value) {
                            user_password = value!;
                          },
                          validator: (value) {
                            if (value!.length < 8) {
                              return 'Please enter a long password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SplashButton(
            text: loading ? 'Please wait' : 'Login',
            onPressed: () {
              trySubmit();
              if (string != '') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(string),
                  ),
                );
                setState(() {
                  loading = false;
                });
              }
            },
          ),
          // TextButton(
          //   child: Text(
          //     'Skip',
          //     style: TextStyle(color: Colors.black),
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pushNamedAndRemoveUntil(
          //       HomeScreen.routeName,
          //       (Route<dynamic> route) => false,
          //     );
          //   },
          //   style: ButtonStyle(
          //     textStyle: MaterialStateProperty.all<TextStyle>(
          //       const TextStyle(fontSize: 20),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New User?',
                style: TextStyle(shadows: [
                  Shadow(
                    color: Theme.of(context).secondaryHeaderColor,
                    offset: Offset(0, -5),
                  ),
                ], color: Colors.transparent),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(SignupScreen.routeName);
                },
                child: Text(
                  'Create your account',
                  style: TextStyle(
                      fontSize: 15,
                      shadows: [
                        Shadow(
                          color: Theme.of(context).secondaryHeaderColor,
                          offset: Offset(0, -5),
                        ),
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).secondaryHeaderColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
