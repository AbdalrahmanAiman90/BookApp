import 'package:bookly_app/manger/feature_book_mang/cubit/featur_book_cubit.dart';
import 'package:bookly_app/util/custom_error.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/custom_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookListviewHorezntal extends StatelessWidget {
  const BookListviewHorezntal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturBookCubit, FeaturBookState>(
      builder: (context, state) {
        if (state is FeaturBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push("/bookdetails", extra: state.books[index]);
                },
                child: CustomIteam(
                  imageUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ??
                          " ",
                ),
              ),
              itemCount: state.books.length,
            ),
          );
        } else if (state is FeaturBookFailure) {
          return CustomErrorWidget(
            errorMassage: state.errorMassage,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
