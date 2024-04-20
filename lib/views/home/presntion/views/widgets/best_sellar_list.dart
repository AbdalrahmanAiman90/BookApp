import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/manger/featuer_newst_book_mang/cubit/featur_newst_book_cubit.dart';
import 'package:bookly_app/util/custom_error.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/best_seller_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestsellarListView extends StatelessWidget {
  const BestsellarListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturNewstBookCubit, FeaturBookState>(
      builder: (context, state) {
        if (state is FeaturNewstBookSuccess) {
          return ListView.builder(
            shrinkWrap:
                true, // important when use SliverToBoxAdapter not SliverFillRemaining
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final thumbnailUrl =
                  state.books[index].volumeInfo.imageLinks?.thumbnail ?? "";

              // Check if thumbnailUrl is valid before passing to CachedNetworkImage
              if (thumbnailUrl.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookIteam(
                    bookModel: state.books[index],
                  ),
                );
              }
            },
            itemCount: state.books.length,
          );
        } else if (state is FeaturNewstBookFailure) {
          return CustomErrorWidget(errorMassage: state.errorMassage);
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
