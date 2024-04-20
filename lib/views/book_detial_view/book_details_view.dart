import 'dart:developer';

import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/manger/similar_book/cubit/similar_book_cubit.dart';
import 'package:bookly_app/views/book_detial_view/widget/book_detial_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetialView extends StatefulWidget {
  const BookDetialView({super.key, required this.bookmodel});
  final BookModel bookmodel;
  @override
  State<BookDetialView> createState() => _BookDetialViewState();
}

class _BookDetialViewState extends State<BookDetialView> {
  @override
  initState() {
    BlocProvider.of<SimilarBookCubit>(context).fetchSamilerBook(
        catiory: widget.bookmodel.volumeInfo.categories?[0] ?? "general");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetialBody(
          bookModel: widget.bookmodel,
        ),
      ),
    );
  }
}
