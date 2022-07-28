import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  Color? background;
  Color? textColor;
  final VoidCallback onTap;
  bool isUpperCase;
  double? radius;
  double? width = double.infinity;
  double? height;

  MyButton({
    Key? key,
    required this.text,
    this.background,
    this.textColor,
    required this.onTap,
    required this.radius,
    required this.width,
    required this.height,
    this.isUpperCase = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius!)),
        width: width,
        height: height,
        child: MaterialButton(
          onPressed: () {
            onTap();
          },
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(color: textColor),
          ),
          color: background,
        ));
  }
}
