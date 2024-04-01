
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({super.key, required this.crossSellOnTap});

  final Function(String link) crossSellOnTap;

  final double _kSmallHeight = 58.0;
  final double _kLargeHeight = 90.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      elevation: 0.0,
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        // decoration: getGradientBackground(),
        child: Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(Get.context!).padding.top),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(Get.context!).size.width,
                height: _kSmallHeight,
                child: Stack(children: [
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(),
                      )),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(Get.context!).size.width, _kLargeHeight);
}