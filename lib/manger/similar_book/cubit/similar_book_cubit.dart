import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/data/repos/home_repo_implemnt.dart';
import 'package:equatable/equatable.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookInitial());

  final HomeRepoImpl homeRepo;

  Future<void> fetchSamilerBook({required String catiory}) async {
    emit(SimilarBookLooding());
    var result = await homeRepo.fetchSimilarBooks(category: catiory);
    result.fold((l) {
      emit(SimilarBookFail(errorMassage: l.errorMassage));
    }, (r) {
      emit(SimilarBookSuccsess(books: r));
    });
  }

  @override
  void onChange(Change<SimilarBookState> change) {
    // TODO: implement onChange
    print(change);
  }
}
