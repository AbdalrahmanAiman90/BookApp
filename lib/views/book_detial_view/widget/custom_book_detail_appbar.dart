import 'package:flutter/material.dart';

class CustomBookDetialAppBar extends StatelessWidget {
  const CustomBookDetialAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            size: 25,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border_rounded,
            size: 25,
          ),
        )
      ],
    );
  }
}
