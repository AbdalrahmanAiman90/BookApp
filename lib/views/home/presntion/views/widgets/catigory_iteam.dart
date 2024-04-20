import 'package:flutter/material.dart';

class CatigoryIteam extends StatelessWidget {
  final bool selected;
  final String catigory; // Assuming Catigory is a custom class
  final VoidCallback onTap;

  const CatigoryIteam({
    Key? key,
    required this.selected,
    required this.catigory,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: selected
            ? MaterialStateProperty.all(Color.fromARGB(112, 122, 123, 124))
            : null,
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side:
              BorderSide(color: Colors.white), // Add border side conditionally
        )),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          catigory,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
