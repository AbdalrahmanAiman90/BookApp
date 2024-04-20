import 'package:bookly_app/util/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomIteam extends StatelessWidget {
  const CustomIteam({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.3 / 4,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            errorWidget: (context, url, error) {
              print("Error loading image: $error");
              return Icon(Icons.error); // Display error icon
            },
          )),
    );
  }
}
