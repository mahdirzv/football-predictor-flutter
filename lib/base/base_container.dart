import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.borderRadius = 10,
    this.borderColor = CupertinoColors.lightBackgroundGray,
    this.shadowColor = Colors.grey,
    this.shadowSpreadRadius = 2,
    this.shadowBlurRadius = 10,
    this.shadowOffset = const Offset(0, 0),
    this.filterSigmaX = 10,
    this.filterSigmaY = 10,
    this.backgroundColor = CupertinoColors.white,
    this.bgOpacity = 0.2,
    this.padding = const EdgeInsets.all(0),
  });

  final Widget child;
  final double borderRadius;
  final Color borderColor;
  final Color shadowColor;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final double filterSigmaX;
  final double filterSigmaY;
  final Color backgroundColor;
  final double bgOpacity;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor.withAlpha(50)),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.3),
            spreadRadius: shadowSpreadRadius,
            blurRadius: shadowBlurRadius,
            offset: shadowOffset,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: filterSigmaX, sigmaY: filterSigmaY),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: CupertinoDynamicColor.resolve(backgroundColor, context).withOpacity(bgOpacity),
            child: child,
          ),
        ),
      ),
    );
  }
}
