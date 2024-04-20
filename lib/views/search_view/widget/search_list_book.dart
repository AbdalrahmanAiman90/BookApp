import 'package:bookly_app/manger/search_mang/cubit/search_book_cubit.dart';
import 'package:bookly_app/util/custom_error.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/best_seller_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBookSuccsess) {
          return ListView.builder(
            // Disable scrolling of the ListView
            shrinkWrap: true, //!بوبط حجمه عشان ياخد الي انا قولتله عليه
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final thumbnailUrl =
                  state.books[index].volumeInfo.imageLinks?.thumbnail ?? "";

              // Check if thumbnailUrl is valid before passing to CachedNetworkImage
              if (thumbnailUrl.isNotEmpty) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      "/bookdetails",
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: BookIteam(
                      bookModel: state.books[index],
                    ), // Corrected class name
                  ),
                );
              }
            },
            itemCount: state.books.length,
          );
        } else if (state is SearchBookFail) {
          return CustomErrorWidget(errorMassage: state.errorMassage);
        } else if (state is SearchBookLooding) {
          return CircularProgressIndicator();
        } else {
          return Text("Not Found Date");
        }
      },
    );
  }
}
