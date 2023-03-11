import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/block_cards.dart';

class WelcomeUser extends StatelessWidget {
  String user = 'demo';

  WelcomeUser(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlockCards(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning, $user!',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Hope you had a restful night\'s sleep',
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
              const Icon(
                Icons.sunny,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
