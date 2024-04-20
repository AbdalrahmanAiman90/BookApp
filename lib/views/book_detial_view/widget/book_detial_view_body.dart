import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/views/book_detial_view/widget/book_action.dart';
import 'package:bookly_app/views/book_detial_view/widget/book_list_in_detial_book.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/book_rating.dart';
import 'package:bookly_app/views/book_detial_view/widget/custom_book_detail_appbar.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/custom_iteam.dart';
import 'package:bookly_app/util/style.dart';
import 'package:flutter/material.dart';

class BookDetialBody extends StatelessWidget {
  BookDetialBody({super.key, required this.bookModel});
  BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const CustomBookDetialAppBar(),
                BookIteamDetialSection(
                  bookModel: bookModel,
                ),
                BookAction(
                  bookModel: bookModel,
                ),
                const SizedBox(
                  height: 18,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You Can Also Like",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 16,
                  ),
                ),
                const BookSimilarListView(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/**
 * 
 * widgt section
 * ||||||||||||||||||||||||||
 * 
 * لو محتاج كونتكست بتاعها خليها ويدجت لو لا يبق فنكشن
 */
class BookIteamDetialSection extends StatelessWidget {
  const BookIteamDetialSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .22),
          child: CustomIteam(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? "",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: style.textstyle30,
        ),
        const SizedBox(
          height: 2,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? "Unknow",
            style: style.textstyle16.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        RatingBook(
          mainAxisAligmnt: MainAxisAlignment.center,
          rate: "5",
          count: bookModel.volumeInfo.pageCount!,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
