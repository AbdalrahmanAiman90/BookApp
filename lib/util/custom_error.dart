import 'package:bookly_app/util/style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMassage});
  final String errorMassage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMassage,
      style: style.textstyle20,
    );
  }
}
