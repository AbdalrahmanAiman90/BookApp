part of 'search_book_cubit.dart';

sealed class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

final class SearchBookInitial extends SearchBookState {}

final class SearchBookLooding extends SearchBookState {}

final class SearchBookSuccsess extends SearchBookState {
  final List<BookModel> books;
  SearchBookSuccsess({required this.books});
}

final class SearchBookFail extends SearchBookState {
  final String errorMassage;
  const SearchBookFail({required this.errorMassage});
}

final class SearchBookClose extends SearchBookState {}
