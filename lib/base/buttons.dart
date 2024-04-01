import 'package:flutter/cupertino.dart';

enum ButtonTypes {
  eSolid(
      height: 44.0,
      bgColor: Color.fromRGBO(52, 52, 52, 1),
      textColor: Color.fromRGBO(255, 255, 255, 1)),
  eOutlinedStrong(
      height: 44.0,
      bgColor: Color.fromRGBO(255, 255, 255, 1),
      textColor: Color.fromRGBO(26, 26, 26, 1),
      borderColor: Color.fromRGBO(26, 26, 26, 1),
      borderWidth: 2.0),
  eOutlined(
      height: 44.0,
      bgColor: Color.fromRGBO(255, 255, 255, 1),
      textColor: Color.fromRGBO(26, 26, 26, 1),
      borderColor: Color.fromRGBO(52, 52, 52, 1),
      borderWidth: 1.0);

  const ButtonTypes(
      {required this.height,
        required this.bgColor,
        required this.textColor,
        this.borderColor,
        this.borderWidth = 0.0});

  final double height;
  final Color bgColor;
  final Color textColor;
  final Color? borderColor;
  final double borderWidth;
}

extension ButtonTypesHelper on ButtonTypes {
  Widget getWidget(
      {required String title, required VoidCallback onTap, double? height}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: bgColor,
              border: Border.all(
                  color: borderColor ?? bgColor, width: borderWidth)),
          child: _getChild(title: title),
        ));
  }

  Widget _getChild({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
