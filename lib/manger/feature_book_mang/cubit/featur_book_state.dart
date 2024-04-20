part of 'featur_book_cubit.dart';

sealed class FeaturBookState extends Equatable {
  const FeaturBookState();

  @override
  List<Object> get props => [];
}

final class FeaturBookInitial extends FeaturBookState {}

final class FeaturBookLooding extends FeaturBookState {}

final class FeaturBookFailure extends FeaturBookState {
  final String errorMassage;

  const FeaturBookFailure(this.errorMassage);
}

final class FeaturBookSuccess extends FeaturBookState {
  final List<BookModel> books;

  const FeaturBookSuccess({required this.books});
}
