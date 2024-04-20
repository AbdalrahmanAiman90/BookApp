import 'package:bookly_app/util/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.borderRadius,
      this.onPressed,
      required this.text});
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: Text(
          "${text}",
          style: style.textstyle18
              .copyWith(color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
