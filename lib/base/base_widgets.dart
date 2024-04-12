import 'package:flutter/cupertino.dart';
import 'package:football_predictor_flutter/resources/app_colours.dart';

import 'buttons.dart';

mixin BaseWidgets {
  getGradientBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.1, 0.5, 0.9],
        colors: [
          Color.fromARGB(255, 12, 31, 81),
          Color.fromARGB(255, 22, 40, 103),
          Color.fromARGB(255, 20, 55, 143),
        ],
      ),
    );
  }

  getButton(
      {required ButtonTypes type,
        required String title,
        required VoidCallback onTap}) {
    return type.getWidget(title: title, onTap: onTap);
  }

  /// This function creates a dotted divider.
  ///
  /// [color] is the color of the dots.
  /// [thickness] is the thickness of the dots.
  /// [dashWidth] is the width of the dots.
  /// [dashSpace] is the space between the dots.
  getDottedDivider({
    Color color = AppColors.black2,
    double thickness = 1,
    double dashWidth = 4,
    double dashSpace = 2,
  }) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double boxWidth = constraints.constrainWidth();
        final int dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List<Widget>.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: thickness,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }

  getDivider() {
    return Opacity(
      opacity: 0.50,
      child: Container(
        height: 1,
        decoration: const BoxDecoration(color: Color(0xFF2262DC)),
      ),
    );
  }
}
