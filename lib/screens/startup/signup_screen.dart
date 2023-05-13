import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/authentication_provider.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/screens/startup/login_screen.dart';
import 'package:night_gschallenge/widgets/UI/splash_button.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String? user_email;
  String? user_password;
  String? re_password;
  bool loading = false;
  String? name;

  var isLoading = false;

  void trySubmit() async {
    final isValid = _formKey.currentState!.validate();

    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      if (user_password == re_password) {
        setState(() {
          loading = true;
        });
        // ignore: avoid_single_cascade_in_expression_statements
        await Provider.of<AuthenticationProvider>(context, listen: false)
            .submitAuthForm(
          user_email!.trim(),
          user_password!.trim(),
          false,
          name: name!.trim(),
        );
      }

      if (FirebaseAuth.instance.currentUser != null) {
        setState(() {
          loading = false;
        });
        Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.routeName, (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var string =
        Provider.of<AuthenticationProvider>(context, listen: true).textMessage;
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'assets/signup.gif',
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Text(
              'Create your account!',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
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
                          key: const ValueKey('Name'),
                          decoration: const InputDecoration(labelText: 'Name'),
                          onSaved: (value) {
                            name = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains(RegExp('[a-zA-Z]+\\.?'))) {
                              return 'Please enter correct name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          style: const TextStyle(color: Colors.black),
                          decoration:
                              const InputDecoration(labelText: 'Password'),
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
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.key,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          key: const ValueKey('re-password'),
                          obscureText: true,
                          obscuringCharacter: '●',
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                          ),
                          onSaved: (value) {
                            re_password = value!;
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
            text: loading ? 'Loading..' : 'Signup',
            onPressed: () async {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(0, -5),
                  ),
                ], color: Colors.transparent),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 15,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0, -5),
                        ),
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
