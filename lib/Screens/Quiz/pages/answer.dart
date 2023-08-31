import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/app_state.dart';

class Answer extends StatelessWidget {
  int index;

  Answer({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: green, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 15,
        child: ElevatedButton.icon(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set your desired border radius
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(green)),
            onPressed: () {
              state.currentAnswerIndex = index;
              state.nextPage();
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(state.currentAnswerIndex == index
                  ? FontAwesomeIcons.circleCheck
                  : FontAwesomeIcons.circle),
            ),
            label: const Text(
              'Yes of course!',
              softWrap: true,
              style: TextStyle(
                fontSize: 18,
              ),
            )),
      ),
    );
  }
}
