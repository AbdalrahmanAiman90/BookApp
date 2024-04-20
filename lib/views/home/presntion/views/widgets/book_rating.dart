import 'package:bookly_app/util/style.dart';
import 'package:flutter/material.dart';

class RatingBook extends StatelessWidget {
  const RatingBook(
      {super.key,
      this.mainAxisAligmnt = MainAxisAlignment.start,
      required this.count,
      required this.rate});
  final MainAxisAlignment mainAxisAligmnt;
  final String rate;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAligmnt,
      children: [
        Icon(
          Icons.star_outlined,
          color: Colors.amber,
        ),
        SizedBox(
          width: 6,
        ),
        Text(rate.toString(), style: style.textstyle16),
        SizedBox(
          width: 5,
        ),
        Text(
          "($count)",
          style: style.textstyle14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
