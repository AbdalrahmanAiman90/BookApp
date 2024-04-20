import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/book_rating.dart';
import 'package:bookly_app/util/const.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/custom_iteam.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/util/style.dart';
import 'package:go_router/go_router.dart';

class BookIteam extends StatelessWidget {
  const BookIteam({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push("/bookdetails", extra: bookModel);
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            CustomIteam(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? " "),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: style.textstyle20,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookModel.volumeInfo.authors != null &&
                            bookModel.volumeInfo.authors!.isNotEmpty
                        ? bookModel.volumeInfo.authors![0]
                        : 'Unknown',
                    style: style.textstyle14,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Free',
                          style: style.textstyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        RatingBook(
                          count: bookModel.volumeInfo.pageCount ?? 0,
                          rate: "4.9",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
