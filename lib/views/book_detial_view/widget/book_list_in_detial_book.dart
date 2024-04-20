import 'dart:developer';

import 'package:bookly_app/manger/similar_book/cubit/similar_book_cubit.dart';
import 'package:bookly_app/util/custom_error.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/custom_iteam.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookSimilarListView extends StatelessWidget {
  const BookSimilarListView({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookSuccsess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemBuilder: (context, index) {
                final thumbnailUrl =
                    state.books[index].volumeInfo.imageLinks?.thumbnail ?? "";

                // Check if thumbnailUrl is valid before passing to CachedNetworkImage
                if (thumbnailUrl.isNotEmpty) {
                  return CustomIteam(imageUrl: thumbnailUrl);
                }
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is SimilarBookFail) {
          return CustomErrorWidget(errorMassage: state.errorMassage);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
