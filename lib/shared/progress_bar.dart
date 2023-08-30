import 'package:flutter/material.dart';

class AnimatedProgressbar extends StatelessWidget {
  final double value;
  final double maxValue;
  final double height;
  const AnimatedProgressbar(
      {Key? key, this.height = 12, required this.value, this.maxValue = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints box) {
      return Container(
        padding: const EdgeInsets.all(10),
        width: box.maxWidth,
        child: Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.all(Radius.circular(height))),
            ),
            AnimatedContainer(
              duration: const Duration(microseconds: 800),
              curve: Curves.easeInCubic,
              height: height,
              width: _calcProgress(value, box.maxWidth, maxValue),
              decoration: BoxDecoration(
                color: _colorGen(value, maxValue),
                borderRadius: BorderRadius.all(
                  Radius.circular(height),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  _calcProgress(double value, double boxWidth, double maxValue, [min = 0.0]) {
    if (value <= min) {
      return min;
    }

    return (value / maxValue) * boxWidth;
  }

  _colorGen(double value, double maxValue) {
    int rgb = (value * 255).toInt();
    if (value >= 0.6 * maxValue) {
      return Colors.deepOrange.withGreen(rgb).withRed(255 - rgb);
    } else if (value >= 0.3 * maxValue) {
      return Colors.yellow.shade800;
    } else {
      return Colors.redAccent.shade700;
    }
  }
}
