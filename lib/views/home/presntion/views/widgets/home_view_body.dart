import 'package:bookly_app/views/home/presntion/views/widgets/best_sellar_list.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/best_seller_iteam.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/catigory_show.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/custom_app.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/listview_book.dart';
import 'package:bookly_app/util/style.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                BookListviewHorezntal(),
                SizedBox(
                  height: 18,
                ),
                CatigoryShow(),
                SizedBox(
                  height: 18,
                ),
                Text("Best Sellar", style: style.textstyle18),
                SizedBox(
                  height: 13,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: BestsellarListView()),
        ],
      ),
    );
  }
}
