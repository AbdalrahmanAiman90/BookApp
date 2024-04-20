import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.homeRepo) : super(SearchBookInitial());
  HomeRepo homeRepo;
  fetchSearchBook(String input) async {
    if (input == '') {
      emit(SearchBookClose());
      return;
    }
    emit(SearchBookLooding());
    log('message');
    var result = await homeRepo.searchScreenBook(input);

    result.fold((l) {
      emit(SearchBookClose());
    }, (r) {
      emit(SearchBookSuccsess(books: r));
    });
  }

  @override
  void onChange(Change<SearchBookState> change) {
    // TODO: implement onChange
    print(change);
  }
}
