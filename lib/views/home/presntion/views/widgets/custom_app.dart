import 'package:bookly_app/util/const.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 3, top: 40, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AssetData.logo,
              height: 18,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).push("/searchview");
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    size: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
