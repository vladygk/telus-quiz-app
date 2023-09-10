import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telus_character_quiz/shared/theme.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Congrats! You\'ve completed the quiz!!!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35),
          ),
          Divider(
            color: green,
            thickness: 3,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/congrats.gif',
              )),
          Divider(
            color: green,
            thickness: 3,
          ),
          ElevatedButton.icon(
            style: TextButton.styleFrom(backgroundColor: green),
            icon: const Icon(FontAwesomeIcons.question),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/result', (route) => false);
            },
            label: const Text(
              ' See Results ',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
