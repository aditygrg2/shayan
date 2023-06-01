import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/main.dart';
import 'package:night_gschallenge/providers/authentication_provider.dart';
import 'package:night_gschallenge/providers/shared_preferences_provider.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/screens/startup/default_night_screen.dart';
import 'package:night_gschallenge/screens/startup/signup_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';
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
  String message =
      "If you are registered with us, an email have been sent to reset your password. Your email should be verified to receive an email.";

  void trySubmit() async {
    final isValid = _formKey.currentState!.validate();

    FocusScope.of(context).unfocus();

    if (isValid) {
      setState(() {
        loading = true;
      });
      _formKey.currentState!.save();

      await Provider.of<AuthenticationProvider>(context, listen: false)
          .submitAuthForm(
        user_email.trim(),
        user_password.trim(),
        true,
      );
    }

    if (FirebaseAuth.instance.currentUser != null) {
      var spp = Provider.of<sharedPreferencesProvider>(context, listen: false);
      bool isLaunchDone = spp.checkIfPresent('launch');
      bool isModeSet = false;

      if (isLaunchDone) isModeSet = spp.getValue('launch', 'isModeSet') as bool;

      setState(() {
        loading = false;
      });

      if (isModeSet) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          HomeScreen.routeName,
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          DefaultNightScreen.routeName,
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    var string =
        Provider.of<AuthenticationProvider>(context, listen: true).textMessage;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          ImageCacher(
            imagePath: "https://i.ibb.co/BnKw3WH/output-onlinegiftools-24-1.gif",
          ),
          const SizedBox(
            height: 10,
          ),
          HomeScreenText(
            text: 'Welcome Back',
          ),
          const SizedBox(
            height: 10,
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
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
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
          const SizedBox(
            height: 10,
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
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                              width: 0, color: Theme.of(context).dividerColor)),
                      child: Form(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              HomeScreenText(
                                text: "Reset your password",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ImageCacher(
                                imagePath: "https://i.ibb.co/51MCGcC/output-onlinegiftools-26-1.gif",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: Theme.of(context).primaryColor,
                                child: TextField(
                                  controller: _controller,
                                  autocorrect: true,
                                  decoration: const InputDecoration(
                                      hintText: "Enter your email here"),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                elevation: 0,
                                color: Theme.of(context).primaryColor,
                                borderOnForeground: false,
                                child: SplashButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance
                                        .sendPasswordResetEmail(
                                      email: _controller.text,
                                    )
                                        .onError((error, stackTrace) {
                                      message = error.toString();
                                      setState(() {});
                                    }).then((value) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(message),
                                        ),
                                      );
                                    });
                                          
                                    Navigator.of(context).pop();
                                  },
                                  text: "Submit",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: const Center(
              child: Text("Forgot your password?"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New User?',
                style: TextStyle(shadows: [
                  Shadow(
                    color: Theme.of(context).secondaryHeaderColor,
                    offset: const Offset(0, -5),
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
                        offset: const Offset(0, -5),
                      ),
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
