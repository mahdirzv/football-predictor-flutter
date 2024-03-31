import 'package:flutter/cupertino.dart';

abstract class BaseMenuItem extends StatelessWidget {
  const BaseMenuItem({super.key, required this.baseMenuItemDetails});

  final BaseMenuItemDetails baseMenuItemDetails;
}

class BaseMenuItemDetails {
  BaseMenuItemDetails(
      {required this.title, required this.desc, required this.onTap});

  final String title;
  final String desc;
  final VoidCallback? onTap;
}