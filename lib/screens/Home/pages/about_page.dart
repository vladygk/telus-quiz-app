import 'package:flutter/material.dart';
import 'package:telus_character_quiz/shared/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Text(
            "About the app...",
            style: TextStyle(fontSize: 40),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Center(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                    color: green,
                    border: Border.all(color: darkPurple, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Text(
                  'Inspired by historical events and characters, this work of fiction was designed, developed, and produced by a multicultural team of various religious faiths and beliefs.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, height: 1.5),
                ))),
          ),
        ),
      ],
    );
  }
}
