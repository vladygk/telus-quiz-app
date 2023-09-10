import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telus_character_quiz/shared/theme.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: ImageIcon(
              AssetImage(
                'assets/logo.png',
              ),
            ),
          ),
          title: const Center(
              child: Text(
            'Telus personality quiz',
            style: TextStyle(fontSize: 21),
          ))),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'You are...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35),
            ),
            const Text(
              'Mladen Dimitrov',
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 35,
                  decorationStyle: TextDecorationStyle.solid),
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
              icon: const Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (_) => false);
              },
              label: const Text(
                ' Back ',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
