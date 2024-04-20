part of 'similar_book_cubit.dart';

sealed class SimilarBookState extends Equatable {
  const SimilarBookState();

  @override
  List<Object> get props => [];
}

final class SimilarBookInitial extends SimilarBookState {}

final class SimilarBookLooding extends SimilarBookState {}

final class SimilarBookSuccsess extends SimilarBookState {
  final List<BookModel> books;

  const SimilarBookSuccsess({required this.books});
}

final class SimilarBookFail extends SimilarBookState {
  final String errorMassage;

  const SimilarBookFail({required this.errorMassage});
}
