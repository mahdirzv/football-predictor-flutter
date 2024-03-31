import 'package:flutter/cupertino.dart';

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
